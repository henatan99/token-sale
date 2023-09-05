var DappToken = artifacts.require("./DappToken.sol");
var DappTokenSale = artifacts.require("./DappTokenSale.sol")

module.exports = function (deployer) {
  deployer.deploy(DappToken, 1000000).then(function() { // 1000000 is the argument passed in constructor function for DappToken contract
    // token price is 0.01 eth
    var tokenPrice = 1000000000000000;
    return deployer.deploy(DappTokenSale, DappToken.address, tokenPrice);  // DappToken.address is the argument passed in constructor function for DappTokenSale contract
  });  
};
