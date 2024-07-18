// SPDX-License-Identifier: AGPL-3.0-only
/// @author: Certora Team
/// @author: Runtime Verification Team
// Adapted from
// https://github.com/Certora/Examples/tree/af4b65cf022c8ca0f1c5b66fa640275d25d5d7ff/CVLByExample/Summarization/WildcardVsExact
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {KontrolCheats} from "kontrol-cheatcodes/KontrolCheats.sol";

contract B {
    function mockedFunction() external pure returns (uint256) {
        return 0;
    }
}

contract A {
    B public b;

    constructor(address _b) {
        b = B(_b);
    }

    function externalFunction() external view returns (uint256) {
        return b.mockedFunction();
    }
}

contract Mock {
    function mockedFunction() external pure returns (uint256) {
        return 7;
    }
}

contract MockTest is Test, KontrolCheats {
    A public a;
    B public b;
    Mock public mock;

    function setUp() public {
        b = new B();
        a = new A(address(b));
        mock = new Mock();
    }

    function test_mockCall() public {
        vm.mockCall(address(b), abi.encodeWithSelector(b.mockedFunction.selector), abi.encode(7));
        assertEq(a.externalFunction(), 7);
    }

    function test_mockFunction() public {
        kevm.mockFunction(address(b), address(mock), abi.encodeWithSelector(b.mockedFunction.selector));
        assertEq(a.externalFunction(), 7);
    }
}
