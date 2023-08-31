// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract DappToken {
  // Name
  string public name = "DApp Token";
  // Symbol
  string public symbol = "DAPP";
  // Standard 
  string public standard = "DApp Token v1.0";
  // state variables
  uint256 public totalSupply;

  event Transfer(
    address _from, 
    address _to,
    uint256 _value
  );
  
  mapping(address => uint256) public balanceOf;

  // constructor

  constructor(uint256 _initialSupply) public {
    balanceOf[msg.sender] = _initialSupply;
    // Set the total number of tokens
    totalSupply = _initialSupply;
  }

  // Transfer
  

  function transfer(address _to, uint256 _value) public returns (bool success) {
    // Exception if account doesn't have enough
    require(balanceOf[msg.sender] >= _value);
    // Transfer the balance
    balanceOf[msg.sender] -= _value;
    balanceOf[_to] += _value;
    // Transfer event 
    emit Transfer(msg.sender, _to, _value);

    return true;
  }
  
}
