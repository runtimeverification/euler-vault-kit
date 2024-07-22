# Euler Vault Kit Kontrol Tests
-------------------------

In this repo you'll find a series of examples showcasing some of the features of Kontrol, an open-source tool for formal verification of Solidity smart contracts. 

## Getting Kontrol

We recommend installing Kontrol via the K framework package manager, `kup`. We also recommend using the latest version of Foundry.

To get `kup` and install Kontrol:
```shell
bash <(curl https://kframework.org/install)
kup install kontrol
```

For more information you can visit the [`kup` repo](https://github.com/runtimeverification/kup) and the [`kup` cheatsheet](https://docs.runtimeverification.com/kontrol/cheatsheets/kup-cheatsheet).

## Using Docker Instead

We also provide a docker image with this repository cloned and all the commands already executed in case you want to walk through the instructions provided.

To get the docker image and run a bash shell, please run:
```shell
docker run -it ghcr.io/runtimeverification/kontrol/friday-workshop
```

Once you've entered the container, please run the following command to use a Foundry profile we have set up for this tutorial:
```shell
export FOUNDRY_PROFILE=kontrol
```

To see the list of proofs that have been generated for this project, run:
```shell
kontrol list
```

## `run-kontrol.sh`

It is customary with Kontrol projects to have a `run-kontrol.sh` script containing the steps to reproduce the proofs and some other features.
In this example we have a top-level [`run-kontrol.sh`](../../run-kontrol.sh) which executes commands needed to run all proofs included in this workshop.

### Kontrol usage

[`test/kontrol/proofs`](./proofs) contains Solidity files with Kontrol tests (`*.k.sol` and `*.t.sol`) we are using in this tutorial. To build the proofs, run:
```shell
kontrol build
```
in this (`test/kontrol`) directory. The arguments this command is executed with are specified in the [`kontrol.toml`](../../kontrol.toml) file.

To run the proofs, execute:
```shell
kontrol prove
```

A specific proof can be run by passing the `--mt` flag with the name of the proof. For example, to run the [`prove_Allowance_ReturnsZero`](./proofs/DTokenProof.k.sol) proof for the `DToken` contract, execute:
```shell
kontrol prove --mt prove_Allowance_ReturnsZero
```
This command will ensure that `DToken` contract's `allowance` function returns zero for _any_ input addresses.

### Examples

In this repository, you can find the following examples:

#### 1. [Counter](./proofs/Counter.k.sol)

Taken from the [Kontrol documentation](https://docs.runtimeverification.com/kontrol/guides/kontrol-example/property-verification-using-kontrol), `CounterTest` is a simple (but eloquent) example of how Kontrol can catch an issue missed by a fuzzer.
Please note that, at the moment, this example is not available in the Docker container.

For illustration purposes, we've modified the code of a `Counter` contact by adding a special case in which its `setNumber` function would not update the number value and will throw an error instead.
This will happen if two input parameters have specific values: `uint256 newNumber` is `0xC0FFEE` and `bool inLuck` is `true`. In other words, a test such as 
```solidity
    function testSetNumber(uint256 x, bool inLuck) public {
        counter.setNumber(x, inLuck);
        assert(counter.number() == x);
    }
```
should fail if `x` is `0xC0FFEE` and `inLuck` is `true`, and pass otherwise.

To run this test with Kontrol, execute:
```shell
kontrol prove --match-test CounterTest.testSetNumber
```

In the output, you should see that the test has failed with the following model (i.e., counterexample) being printed:
```
  Path condition:
    { VV0_x_114b9705:Int #Equals 12648430 }
#And { VV1_inLuck_114b9705:Int #Equals 1 }
  Model:
    VV1_inLuck_114b9705 = 1
    ORIGIN_ID = 645326474426547203313410069153905908525362434350
    CALLER_ID = 645326474426547203313410069153905908525362434350
    TIMESTAMP_CELL = 0
    VV0_x_114b9705 = 12648430
    NUMBER_CELL = 0
```
The path condition tells us that the failure occurs when `x == 12648430` and `inLuck == 1`, where `12648430` is the decimal representation of `0xC0FFEE`, and `1` represents `true` for Boolean values.

The model represents concrete assignments to the symbolic variables `x` and `inLuck` that lead to the failure. It also concretizes globally accessible variables such as `msg.sender` (`CALLER_ID`) and `tx.origin` (`ORIGIN_ID`), although their values are not relevant for this example.

#### 2. [OpenZeppelin ERC20](./proofs/GLDToken.t.sol)

This contract demonstrates how Kontrol proofs can be used to verify properties of existing contracts, such as the ERC20 implementation from the OpenZeppelin library.
The specification is implemented in the form of Foundry tests, however, running these tests with Kontrol ensures that function behaviors are checked for all possible input and storage values (the latter is ensured by the use of `kevm.symbolicStorage(address(dToken))` cheatcode in `setUp()`).

To run these proofs, execute:
```shell
kontrol prove --mt GLDTokenTest.test
```

To make formal reasoning more efficient, these tests are using lemmas provided in the [lemmas.md](../../lemmas.md) file. For more information on lemmas, please refer to [our documentation](https://docs.runtimeverification.com/kontrol/guides/advancing-proofs).

#### 3. [DToken](./proofs/DToken.k.sol) and [ESynth](./proofs/ESynthProof.k.sol)

These proofs exemplify how to verify properties of contracts present in the Euler codebase by adapting the existing Foundry tests to Kontrol.

[ESynthProof.prove_addIgnoredForTotalSupply_onlyOwner](./proofs/ESynthProof.k.sol#L29) helps verify that the `addIgnoredForTotalSupply` function of the `ESynth` contract can only be called by the owner of the contract for all symbolic inputs.

[DTokenProof.prove_Allowance_ReturnsZero](./proofs/DTokenProof.k.sol#L28) verifies that the `allowance` function of the `DToken` contract returns zero for all inputs and storage values (ensured by the use of `kevm.symbolicStorage(address(dToken))` cheatcode in `setUp()`).
[DTokenProof.prove_Approve_NotSupported](./proofs/DTokenProof.k.sol#L41) verifies that the `approve` function of the `DToken` contract always reverts with a specific (`Errors.E_NotSupported`) custom error.

To run these three proofs in parallel, execute:
```shell
kontrol prove --mt prove_Allowance_ReturnsZero --mt prove_Approve_NotSupported --mt prove_addIgnoredForTotalSupply_onlyOwner --workers 3
```

#### 4. [EVault](./proofs/EVaultProof.k.sol)

`EVaultProof` showcases the external computation feature of Kontrol. Kontrol is both time and resource intensive, but here's a way of saving an arbitrary amount of time when executing a proof in Kontrol.
This example instructs on how to offload the initial part of your proof computation to Foundry (which is blazing fast) and then incorporate it into a Kontrol proof.

The way we achieve this is via the cheatcodes `vm.stopAndReturnStateDiff` or `vm.dumpState`.
Depending on the cheatcode used the approach is slightly different. However, in both cases we produce a JSON containing the state of the chain after executing some code, and load that state into Kontrol.
In this example, we are using `vm.dumpState` since it's easier to work with. For complete instructions on how to include external computation with `vm.stopAndReturnStateDiff`, please see the [documentation](https://github.com/runtimeverification/kontrol/tree/master/docs/external-computation).

We will be using external computation to prove that the `asset()` function of `EVault` never reverts, in accordance with the ERC4626 specification.
Even though the property itself is simple, setting up the state of `EVault` and supplementary contracts is time- and resource-intensive. We will use Foundry to set up the state and then load it into Kontrol to prove the property.

To use external computation in Kontrol, one needs to:
- Add the following permissions to `foundry.toml`
```toml
fs_permissions = [{ access = "read-write", path = "./"}]
```
- Add `vm.dumpState` cheatcode to the function that performs deployment and state setup for the test contract. In this case, it's the `_runSetUp()` function in [`init-state/InitState.sol`](./init-state/InitState.sol).
- Add calls to the `saveAddresses` function implemented in [`init-state/SaveAddresses.sol`](./init-state/SaveAddresses.sol) to save the addresses of the contracts we want to use in the proof. `saveAddresses` is called with two parameters: the address of the contract and the name of the contract, which can be used in the proof to reference its address.
- Run `forge script test/kontrol/init-state/InitState.sol:InitState --sig runSetUp --ffi` to execute this function and generate JSON files ([`init-state/InitState.json`](./init-state/InitState.json) and [`init-state/AddressNames.json`](./init-state/AddressNames.json)) with state updates corresponding to the deployment process and saved addresses. 
- Generate helper contracts, converting the generated JSON to a Solidity contract. This is done by running
```shell
kontrol load-state InitState test/kontrol/init-state/InitState.json --contract-names test/kontrol/init-state/AddressNames.json --output-dir test/kontrol/proofs/utils`.
```
This will generate two Solidity contracts in the [proofs/utils](./proofs/utils) directory that can be used to load the state into Kontrol.
- You can then implement a proof contract that inherits [proofs/utils/InitState.sol](./proofs/utils/InitState.sol) generated in the previous step, to access the names of the deployed contracts:
```solidity
import {InitState} from "./utils/InitState.sol";

contract EVaultProof is InitState {
    ...
}
```
as done in [EVaultProof](./proofs/EVaultProof.k.sol).
Note that the generated contract has a `recreateState` function to recreate the state updates recorded with Foundry. However, it is faster to add said state updates through the `kontrol prove` command as instructed below.

You can then prove that the "`asset()` does not revert" property holds by running
```shell
kontrol prove --mt prove_EVault_asset_doesNotRevert --init-node-from-dump test/kontrol/init-state/InitState.json
```

#### 5. [MockProof](./proofs/MockProof.k.sol)

Another Kontrol feature that improves scalability is the ability to mock function calls. This is particularly useful when you want to test a contract that interacts with other contracts, but do not want to verify the whole logic of the external call being made.
In this case, you can "summarize" the return values or side effects of the external call and use them in your proof by means of Foundry's `vm.mockCall(...)` cheatcode and Kontrol's `kevm.mockFunction(...)` cheatcode, respectively.

- [MockTest.prove_mockCall](./proofs/MockProof.k.sol#L46) demonstrates how `vm.mockCall` can be used to replace the actual external call with the specified return value.
- [MockTest.prove_mockFunction](./proofs/MockProof.k.sol#L51) demonstrates how `kevm.mockFunction` can substitute an external call to a smart contract function with a simpler implementation of this function available in a different, mock contract.

## Documentation, Socials and Posts

Have more appetite for formal verification and Kontrol? The following resources will sort you out!

### Kontrol ecosystem

Get to know Kontrol more in depth. Open a PR or an issue!

- [Kontrol documentation](https://docs.runtimeverification.com/kontrol/cheatsheets/kup-cheatsheet)
- [Kontrol repo](https://github.com/runtimeverification/kontrol)

### Socials

You can reach us on any of these platforms. We'll answer any questions and provide guidance throughout your Kontrol journey!

- [Telegram](https://t.me/rv_kontrol)
- [Discord](https://discord.com/invite/CurfmXNtbN)
- [Twitter/X](https://x.com/rv_inc)

### Blog Posts

Want to learn more about Kontrol, formal verification, and the cool things we do? Read any of these posts!

- [Optimism's pausability system verification](https://runtimeverification.com/blog/kontrol-integrated-verification-of-the-optimism-pausability-mechanism)
- [Kontrol 101](https://runtimeverification.com/blog/kontrol-101)
- [Why does Formal Verification work?](https://runtimeverification.com/blog/formal-verification-lore)