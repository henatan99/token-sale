var DappToken = artifacts.require("./DappToken.sol");

module.exports = function (deployer) {
  deployer.deploy(DappToken, 1000000);  // 1000000 is the argument passed in constructor function
};
