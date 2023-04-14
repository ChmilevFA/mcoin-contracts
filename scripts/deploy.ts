import { ethers, upgrades } from "hardhat";
//import '@openzeppelin/hardhat-upgrades';

async function main() {
  // Upgradable first time deploy
  const Contract = await ethers.getContractFactory("SimpleToken");
  const contract = await upgrades.deployProxy(Contract, ["Resolv coin", "RSLV1", "10000000000000000000000"], { initializer: 'initialize' });
  await contract.deployed();

  /*
  // Non upgradable deploy
  const Contract = await ethers.getContractFactory("SimpleToken");
  const contract = await Contract.deploy("Resolv coin", "RSLV1", "10000000000000000000000");

  await contract.deployed();
  */

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
