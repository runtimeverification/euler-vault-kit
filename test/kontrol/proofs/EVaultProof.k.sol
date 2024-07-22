// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.13;

import {Vm} from "forge-std/Vm.sol";
import {EVaultExtended} from "test/invariants/helpers/extended/EVaultExtended.sol";
import {EthereumVaultConnector} from "ethereum-vault-connector/EthereumVaultConnector.sol";
import {InitState} from "./utils/InitState.sol";

contract EVaultProof is InitState {
    EthereumVaultConnector evc;
    EVaultExtended eTST;

    function setUpInlined() public {
        evc = EthereumVaultConnector(payable(evcAddress));
        eTST = EVaultExtended(eTSTAddress);
    }

    function prove_ethereumVaultConnector_code_nonempty() public {
        setUpInlined();
        assert(address(evc).code.length > 0);
    }

    function prove_EVault_asset_doesNotRevert() public {
        setUpInlined();
        eTST.asset();
    }

    /*
      string constant ERC4626_ASSETS_INVARIANT_A = "ERC4626_ASSETS_INVARIANT_A: asset MUST NOT revert";
      function assert_ERC4626_ASSETS_INVARIANT_A() internal {
      try eTST.asset() {}
      catch {
      fail(ERC4626_ASSETS_INVARIANT_A);
      }
      }
    */
}
