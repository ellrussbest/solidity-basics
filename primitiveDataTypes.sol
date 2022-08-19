// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Primitives {
    bool public boo = true;

    uint public u8 = 1;
    uint public u256 = 456;
    uint public u = 123; // uint is an alias for uint256

    int8 public i8 = -1;
    int public i256 = 456;
    int public i = -123; // int is the same as int256

    address public addr = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;

    bool public defaultBoo; // false
    uint public defaultUint; // 0
    int public defaultInt; // 0
    address public defaultAddr; // 0x0000000000000000000000000000000000000000

    // Finding minimum int
    int public minInt = type(int).min;
    
    // Finding maximum int
    int public maxInt = type(int).max;

    // bytes32 is encountered when you are dealing with Keccack256 hash algorithm
    bytes32 public b32 = 0x9878dbb4b82cd531125f404fb8b4e286be6caa0f6c53cbd7232eacf63b84cbca;
}