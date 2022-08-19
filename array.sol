// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Array {
    // several ways to initialize an array
    uint [] public arr;
    uint [] public arr2 = [1, 2, 3];
    uint [3] public arr3 = [0, 1, 2];
    // fixed size array, all elements initalize to 0
    uint[10] public myFixedSizeArr;

    function get (uint i) public view returns (uint) {
        return arr[i];
    }

    // solidity can return the entire array.
    // but this funciton should be avoided for
    // arrays that can grow indefinitely in length
    function getArr() public view returns (uint [] memory) {
        return arr;
    }

    function getarr() public view returns (uint[3] memory) {
        return arr3;
    }

    function push(uint i) public {
        // Append to array
        // This will increase the array length by 1.
        arr.push(i);
    }

    function pop() public {
        // Remove last element from array
        // this will decrease the array length by 1
        arr.pop();
    }

    function getLength() public view returns (uint) {
        return arr.length;
    }

    function remove(uint index) public {
        // Delete does not change the array length
        // it resets the value at index to its default value
        // in this case 0
        delete arr[index];
    }

    // create array in memory
    // array in memory has to be a fixed size
    uint [] a = new uint[](5);
}

contract CompactArray {
    uint [] public arr;

    // Deleting an element creates a gap in the array.
    // One trick to keep the array compact is to
    // move the last elemnt into the place to delete
    function remove(uint index) public {
        // move the last element into the place to delete
        arr[index] = arr[arr.length - 1];
        // Remove the last element
        arr.pop();
    }

    function test() public {
        arr.push(1);
        arr.push(2);
        arr.push(3);
        arr.push(4);
        // [ 1, 2, 3, 4 ]

        remove(1);
        // [ 1, 4, 3]

        remove(2);
        // [ 1, 4 ]
    }
}