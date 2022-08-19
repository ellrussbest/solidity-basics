// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract ReceiveEther {
    /*
        Which function is called, fallback() or receive()?

            send Ether
                |
            msg.data is empty?
                / \
              yes  no
                /     \
    receive() exists?  fallback()
            /   \
            yes   no
            /      \
        receive()   fallback()
        */
    // function to receive Ether. msg.data must be empty
    receive() external payable {}

    // Fallback function is called when msg.data is not empty
    fallback() external payable{}

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

}

contract sendEther {
    function sendViaTransfer(address payable _to) public payable {
        // This function is no longer recommended fro sending Ether
        _to.transfer(msg.value);
    }

    function sendViaSend(address payable _to) public payable {
        // Send returns a boolean value indicating success or failure.
        // this function is not recommended fro sending Ether.
        bool sent = _to.send(msg.value);
        require(sent, "Failed to send Ether");
    }

    function sendViaCall(address payable _to) public payable {
        // Call returns a boolean value indicating success or failure
        // this is the current recommended method to use

        // (bool sent, bytes memory data) = _to.call{value: msg.value}("");
        (bool sent,) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");

        // you can specify the gas to be fowarded as follows
        // _to.call.gas(1000).value(msg.value)("");
    }
}

contract Charity {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function donate() public payable {}

    function withdraw() public {
        uint amount = address(this).balance;
        (bool sent, bytes memory data) = owner.call{value: amount}("");
        require(sent, "failed to send Ether");
    }
}