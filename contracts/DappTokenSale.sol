// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
import "./DappToken.sol";

contract DappTokenSale {
    address admin;
    DappToken public tokenContract;
    uint256 public tokenPrice;
    uint256 public tokenSold;

    event Sell(address _buyer, uint256 _amount);

    constructor(DappToken _tokenContract, uint256 _tokenPrice) public {
        // Assign an admin
        admin = msg.sender;
        // Token contract
        tokenContract = _tokenContract;
        // Token Price
        tokenPrice = _tokenPrice;
    }

    // multiply 
    function multiply(uint x, uint y) internal pure returns (uint z) {
        require(y == 0 || ( z = x * y) / y == x);
    }

    // Buy tokens
    function buyTokens(uint256 _numberOfTokens) public payable {
        // Require that value is equal to tokens
        require(msg.value == multiply(_numberOfTokens, tokenPrice));
        // Require that there are enough tokens in the contract 
        require(tokenContract.balanceOf(address(this)) >= _numberOfTokens); // address(this) returns the address of the DappTokenSale contract
        // Require a transfer is scuccessful 
        require(tokenContract.transfer(msg.sender, _numberOfTokens));
        // Keep track of tokenSold
        tokenSold += _numberOfTokens;
        // Trigger sell event 
        emit Sell(msg.sender, _numberOfTokens);
    }
}