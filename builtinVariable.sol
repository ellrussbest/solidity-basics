// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract MyContract {
    // tx
    address _origin = tx.origin; // the ethereum address that sent the transaction

    // msg - gives info about the calling environment of the function
    uint _value = msg.value; // amount of ether that was sent to this smart contract in wei
    address _sender = msg.sender; // the ethereum address that called the function
    uint _gas = gasleft(); // available gas remaining for a current transaction
    bytes _data = msg.data;
    /**
    Alice => Smart contract A       => smart contract B
             tx.origin = Alice         tx.origin = Alice
             msg.sender = Alice        msg.sender = smart Contract A
    */

    //block
    uint _timestamp = block.timestamp; // timestamp at which the block was mined
}