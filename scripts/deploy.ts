import { ethers } from "hardhat";

async function main() {
  const Contract = await ethers.getContractFactory("SimpleToken");
  const contract = await Contract.deploy("Super mega stable coin", "SMSC", "10000000000000000000000");

  await contract.deployed();

  console.log(
    `Deployed to ${contract.address}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
