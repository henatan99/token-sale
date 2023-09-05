## DApp Token
### Console
- `truffle console`

- `DappToken.deployed().then(function(instance) { tokenInstance = instance })`

- `tokenInstance.name()`

- `tokenInstance.symbol()`

- `tokenInstance.standard()`

- `tokenInstance.totalSupply().then(function(s) { supply = s })`

- `supply.toNumber()`

- `web3.eth.getAccounts().then(accounts => { accounts = accounts }).catch(error => { console.error(error) });`

- `accounts`

- `admin = accounts[0]`

- `tokenInstance.balanceOf(admin)`

- `tokenInstance.balanceOf(admin).then(function(bal) { balance = bal })`

- `balance.toNumber()`

- `receiver = accounts[1]`

- `tokenInstance.transfer(receiver, 1, { from: admin })`

- `tokenInstance.balanceOf(admin)`

- `tokenInstance.balanceOf(receiver)`

- `tokenInstance.approve(accounts[1], 100)`

- `fromAccount = accounts[2]`

- `toAccount = accounts[3]`

- `spendingAccount = accounts[4]`

- `tokenInstance.transfer(fromAccount, 100, { from: admin })`

- `tokenInstance.balanceOf(fromAccount)`

- `tokenInstance.approve(spendingAccount, 10, { from: fromAccount })`

- `tokenInstance.transferFrom(fromAccount, toAccount, 10, { from: spendingAccount })`

- `tokenInstance.balanceOf(fromAccount)`

- `tokenInstance.balanceOf(toAccount)`

- `tokenInstance.allowance(fromAccount, spendingAccount)`

## Token Sale Contract

- Privision tokens to token sale contract
- Set a token price in WEI
- Assign an admin
- Buy tokens
- End sale