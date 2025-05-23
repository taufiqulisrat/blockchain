const hre = require("hardhat");

async function main() {
  const ChatApp = await hre.ethers.getContractFactory("ChatApp");
  const chatApp = await ChatApp.deploy();

  await chatApp.waitForDeployment(); // gunakan ini di Hardhat terbaru
  console.log("ChatApp deployed to:", await chatApp.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
