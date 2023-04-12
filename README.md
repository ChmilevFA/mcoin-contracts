# mcoin-contracts

To deploy:
```shell
npx hardhat run scripts/deploy.ts --network polygonMumbai
npx hardhat verify --contract contracts/SimpleToken.sol:SimpleToken --network polygonMumbai CONTRACT_ADDRESS "Super mega stable coin" "SMSC" "10000000000000000000000"
```