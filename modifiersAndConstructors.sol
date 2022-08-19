// SPDX-Lincense-Identifier: MIT
pragma solidity ^0.8.3;

contract FunctionModifier {
    // we will use these variables to demostract how to use
    // modifiers
    address public owner;
    uint public x = 10;
    bool public locked;

    constructor() {
        // set the transaction sender as the owner of the contract
        owner = msg.sender;
    }

    // Modifier to check that the caller is the owner of the
    // contract
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        // underscore is a special character only used inside
        // a funciton modifer and it tells Solidity to 
        // execute the rest of the code
        _;
    }

    // Modifiers can take inputs. This modifier takes checks that the
    // address passed in is not the zero address.
    modifier validAddress(address _addr) {
        require(_addr != address(0), "Not valid address");
        _;
    }

    function changeOwner(address _newOwner) public onlyOwner validAddress (_newOwner) {
        owner = _newOwner;
    }

    // Modifiers can be called before and / or after a function.
    // This modifier prevents a function from being called while
    // It is still executing
    modifier noReentrancy() {
        require(!locked, "No reentrancy");
        locked = true;
        _;
        locked = false;
    }

    function decrement (uint i) public noReentrancy {
        x -= i;

        if ( i > 1 ) {
            decrement(i - 1);
        }
    }
}