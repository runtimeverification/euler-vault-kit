// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Setup} from "../../invariants/Setup.t.sol";
import {SaveAddress} from "./SaveAddress.sol";

// forge script test/kontrol/init-state/InitState.sol:InitState --sig runSetUp --ffi
// kontrol load-state InitState test/kontrol/init-state/InitState.json --contract-names
// test/kontrol/init-statexs/AddressNames.json --output-dir test/kontrol/proofs/utils
// kontrol prove --mt test_name --init-node-from-dump test/kontrol/init-state/InitState.json

contract InitState is SaveAddress, Setup {
    function runSetUp() public {
        _setUp();
        // File path defined in SaveAddress
        vm.dumpState(string.concat(folder, dumpStateFile));
        saveAddresses();
    }

    // Function to name deployed contracts
    function saveAddresses() public {
        // _deployProtocolCore addresses
        save_address(address(evc), "evc");
        save_address(feeReceiver, "feeReceiver");
        save_address(address(protocolConfig), "protocolConfig");
        save_address(balanceTracker, "balanceTracker");
        save_address(address(oracle), "oracle");
        save_address(sequenceRegistry, "sequenceRegistry");
        save_address(address(assetTST), "assetTST");
        save_address(address(assetTST2), "assetTST2");
        save_address(address(1), "unitOfAccount");
        save_address(permit2, "permit2");

        // _deployVaults addresses
        // save_address(evaultImpl, "evaultImpl");
        save_address(address(factory), "factory");
        save_address(address(eTST), "eTST");
    }
}
