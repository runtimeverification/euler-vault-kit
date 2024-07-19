// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {ESynth, IEVC, Ownable} from "src/Synths/ESynth.sol";
import {KontrolCheats} from "kontrol-cheatcodes/KontrolCheats.sol";

contract ESynthProof is Test, KontrolCheats {
    ESynth synth;
    address owner;
    address evc;

    function setUp() public {
        owner = makeAddr("owner");
        evc = makeAddr("evc");

        // avoiding branching on symbolic `chainId`
        vm.chainId(1);

        vm.startPrank(owner);
        synth = new ESynth(IEVC(evc), "TestSynth", "TS");

        // setting symbolic `capacity` for `owner`
        uint128 capacity = freshUInt128();
        synth.setCapacity(owner, capacity);
        vm.stopPrank();
    }

    function prove_addIgnoredForTotalSupply_onlyOwner(address caller, address ignored) public {
        _notKnownAddress(caller);
        _notKnownAddress(ignored);

        vm.prank(caller);
        vm.expectRevert();
        synth.addIgnoredForTotalSupply(ignored);
    }

    function _notKnownAddress(address addr) internal view {
        vm.assume(addr != address(this));
        vm.assume(addr != address(vm));
        vm.assume(addr != owner);
        vm.assume(addr != address(synth));
        vm.assume(addr != address(evc));
    }
}
