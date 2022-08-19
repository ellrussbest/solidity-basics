// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Base {
    // Private function can only be called
    // - inside this contract
    // Contracts that inheirt this contract cannot call this function
    function privateFunc() private pure returns (string memory) {
        return "private function called";
    }

    function testPrivateFunc() public pure returns (string memory) {
        return privateFunc();
    }

    // Internal funciton can eb called 
    // - inside this contract
    // - inside contracts that inheirt this contract
    function internalFunc() internal pure returns (string memory) {
        return "internal function called";
    }

    function testInternalFunc() public pure virtual returns (string memory) {
        return internalFunc();
    }

    // public functions can be called
    // - inisdie this contract
    // - nside contracts that inherit this contract
    // - by other contracts and accounts
    function publicFunc() public pure returns (string memory) {
        return "public function called";
    }

    // External functions can only be called
    // - by other contrcts and accounts
    function externalFunc() external pure returns (string memory) {
        return "external funciton called";
    }

    // This funciton will not compile since we're trying to call
    // an external function here.
    // function testExteranlFunc() public pure returns (string memory) {
    //     return externalFunc();
    // }

    // state variables
    string private privateVar = "my private variable";
    string internal internalVar = "my internal variable";
    string public publicVar = "my public variable";
    // state variables cannot be external so tis code won't compile.
    // string external externalVar = "my external variable";
}

contract Child is Base {
    // Inherited contracts do not have access to to private funcitons
    // and state variables.
    // function testPrivateFunc() public pure returns (string memory) {
    //     return privateFunc();
    // }

    // internal function can be called inside child contracts
    function testInternalFunc() public pure override returns (string memory) {
        return internalFunc();
    }

    function testInternalVar() public view returns (string memory _internalVar, string memory _publicVar) {
        _internalVar = internalVar;
        _publicVar = publicVar;
    }
}