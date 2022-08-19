// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract SimpleStorage {
    // state variable to store a number
    uint public num;
    bool public b = true;

    // you need to send a transaction to write to a state variable
    function set(uint _num) public {
        num = _num;
    }

    // you can read from a state variabe without sending a transaction
    function get() public view returns (uint) {
        return num;
    }

    function get_b() public view returns (bool) {
        return b;
    }

    function add(uint x, uint y) external pure returns (uint) {
        return x + y;
    }
}