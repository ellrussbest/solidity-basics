// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Enum {
    // Enum representing shipping status
    enum Status {
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }

    // Default value s the first element listed in
    // definition of the tpe, in this case "Pending"
    Status public status;

    // Returns uint
    // Pending - 0
    // Shipped - 1
    // Accepted - 2
    // Rejected - 3
    // Canceled - 4
    function get() public view returns (Status) {
        return status;
    }

    function ship() public {
        require(status == Status.Pending);
        status = Status.Shipped;
    }

    function acceptDelivery() public {
        require(status == Status.Shipped);
        status = Status.Accepted;
    }

    function rejectDelivery() public {
        require(status == Status.Shipped);
        status = Status.Rejected;
    }

    // you can update to a specific enum like this
    function cancel() public {
        require(status == Status.Pending);
        status = Status.Canceled;
    }

    // delete resets the enum to its first value, 0
    function reset() public {
        delete status;
    }
}