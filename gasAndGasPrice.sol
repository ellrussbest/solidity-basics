// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Gas {
    uint public i = 0;
    uint public cost = 12;

    // using up all of the gas that you send causes your transaction to fail
    // state changes are undone
    // gas spend are not refunded
    function forever() public {
        // Here we run a loop untill all of the gas are spent
        // and the transaction fails
        while (true) i += 1;        
    }

    function testGasRefund() public view returns (uint) {
        return tx.gasprice;
    }
}