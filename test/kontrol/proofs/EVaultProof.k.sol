// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {EVaultExtended} from "test/invariants/helpers/extended/EVaultExtended.sol";
import {EthereumVaultConnector} from "ethereum-vault-connector/EthereumVaultConnector.sol";
import {InitState} from "./utils/InitState.sol";

contract EVaultProof is InitState, Test {
    EthereumVaultConnector evc;
    EVaultExtended eTST;

    address alice;
    address account;

    function setUpInlined() public {
        evc = EthereumVaultConnector(payable(evcAddress));
        eTST = EVaultExtended(eTSTAddress);

        // Setting up an account
        alice = makeAddr("alice");
        // uint256 seed = 1024;
        uint8 subAccountId = 32;

        account = address(uint160(uint160(alice) ^ subAccountId));
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

    function prove_ControllersManagement() public {
        setUpInlined();
        address msgSender = alice;

        assertFalse(evc.isControllerEnabled(account, address(eTST)));
        /*
        // enabling controller
        vm.expectEmit(true, true, false, true, address(evc));
        emit ControllerStatus(account, vault, true);
        vm.prank(msgSender);
        evc.enableController(account, vault);
        assertTrue(evc.isControllerEnabled(account, vault));

        // trying to enable second controller will throw on the account status check
        address otherVault = address(new Vault(evc));

        vm.prank(msgSender);
        vm.expectRevert(Errors.EVC_ControllerViolation.selector);
        evc.handlerEnableController(account, otherVault);

        // only the controller vault can disable itself
        assertTrue(evc.isControllerEnabled(account, vault));
        controllersPre = evc.getControllers(account);

        vm.prank(msgSender);
        vm.expectEmit(true, true, false, true, address(evc));
        emit ControllerStatus(account, vault, false);
        Vault(vault).call(address(evc), abi.encodeWithSelector(evc.handlerDisableController.selector, account));
        assertFalse(evc.isControllerEnabled(account, vault));
        */
    }
}
