// This setup uses Hardhat Ignition to manage smart contract deployments.
// Learn more about it at https://hardhat.org/ignition

import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const nftAddress = "0x2b43B0C5BA5e358D7D38B4657E503a26c1554dAA";

const NFTZone = buildModule("NFTZone", (m) => {


  const NFTZone = m.contract("NFTZone", [nftAddress]);

  return { NFTZone };
});

export default NFTZone;
