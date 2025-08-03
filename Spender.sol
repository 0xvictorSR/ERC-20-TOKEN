// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC20 {
    function transferFrom(address from, address to, uint amount) external returns (bool);
}

contract Spender {
    IERC20 public goofyGoober;
    mapping(address => uint256) public pooled;

    constructor(address tokenAddress) {
        goofyGoober = IERC20(tokenAddress);
    }

    function poolTokens(uint256 amount) public {
        bool success = goofyGoober.transferFrom(msg.sender, address(this), amount);
        require(success, "Transfer failed");
        pooled[msg.sender] += amount;
    }
}
