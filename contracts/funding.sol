// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract funding{
    uint256 public numOfFunders;

    mapping(uint256 => address) private funders;

    receive() external payable {}

    function transfer() external payable {
        funders[numOfFunders] = msg.sender;
    }

    function withdraw(uint256 withdrawAmount) external {
        require(
            withdrawAmount <= 2000000000000000000,
            "Cannot withdraw more than 2 ether"
        );
        payable(msg.sender).transfer(withdrawAmount);
    }
}