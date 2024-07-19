// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {DToken} from "src/EVault/DToken.sol";
import {Errors} from "src/EVault/shared/Errors.sol";
import {Events} from "src/EVault/shared/Events.sol";
import {KontrolCheats} from "kontrol-cheatcodes/KontrolCheats.sol";
import {MockEVault} from "test/mocks/MockEVault.sol";

contract DTokenProof is Test, KontrolCheats {
    DToken dToken;
    MockEVault eVault;

    function setUp() public {
        address factory = makeAddr("factory");
        address evc = makeAddr("evc");
        eVault = new MockEVault(factory, evc);

        // Deploying `DToken` contract
        vm.prank(address(eVault));
        dToken = new DToken();

        // Making storage of `dToken` symbolic
        kevm.symbolicStorage(address(dToken));
    }

    function prove_Allowance_ReturnsZero(address user1, address user2) public view {
        _notKnownAddress(user1);
        _notKnownAddress(user2);

        assertEq(dToken.allowance(user1, user2), 0);
    }

    /*
    function test_allowance() public view {
        assertEq(dToken.allowance(user, user2), 0);
    }
    */

    function prove_Approve_NotSupported(address caller, address to, uint256 amount) public {
        _notKnownAddress(caller);

        vm.prank(caller);
        vm.expectRevert(Errors.E_NotSupported.selector);
        dToken.approve(to, amount);
    }

    /*
        function test_Approve_NotSupported(address caller, address to, uint256 amount) public {
        vm.expectRevert(Errors.E_NotSupported.selector);
        vm.prank(caller);
        dToken.approve(to, amount);
    }
    */

    function _notKnownAddress(address addr) internal view {
        vm.assume(addr != address(this));
        vm.assume(addr != address(vm));
        vm.assume(addr != address(eVault));
        vm.assume(addr != address(dToken));
    }
}
