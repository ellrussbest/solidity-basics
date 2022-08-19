// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Loop {
    function loop () public pure{
        // for loop
        for (uint i = 0; i < 10; i++) {
            if (i == 3) {
                // skip to the next iteration with continue
                continue;
            }

            if (i == 5) {
                // Exit loop with break
                break;
            }

            // while loop
            uint j;
            while (j < 10) {
                j++;
            }
        }
    }
}