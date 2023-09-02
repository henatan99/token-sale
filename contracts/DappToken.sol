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
    address indexed _from, 
    address indexed _to,
    uint256 _value
  );
  
  // approve
  event Approval(
    address indexed _from, 
    address indexed _to,
    uint256 _value
  );

  mapping(address => uint256) public balanceOf;
  mapping(address => mapping(address => uint256)) public allowance;

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
  
  // Dellegated transfer 
  // approve
  function approve(address _spender, uint256 _value) public returns (bool success) {
    // allowance
    allowance[msg.sender][_spender] = _value;
    // Approve event 

    emit Approval(msg.sender, _spender, _value);
    return true;
  }

  // transferFrom 
  function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
    // Require _from has enough tokens 
    require(_value <= balanceOf[_from]);
    // Require allowance is big enough 
    require(_value <= allowance[_from][msg.sender]);
    // Change the balance
    balanceOf[_from] -= _value;
    balanceOf[_to] += _value;
    // Update the allowance 
    allowance[_from][msg.sender] -= _value;
    // Transfer event
    emit Transfer(_from, _to, _value);
    // return a boolean
    return true;
  }
}
