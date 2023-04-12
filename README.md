# mcoin-contracts

To deploy:
```shell
npx hardhat run scripts/deploy.ts --network polygonMumbai
npx hardhat verify --network polygonMumbai DEPLOYED_CONTRACT_ADDRESS "Constructor argument 1"
```