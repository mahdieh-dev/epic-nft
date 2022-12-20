async function main() {
  const nftContractFactory = await hre.ethers.getContractFactory("MyEpicNFT");
  const nftContract = await nftContractFactory.deploy();
  await nftContract.deployed();
  console.log("contract deployed to: ", nftContract.address);

  const firstColor = Math.floor(Math.random() * 16777215).toString(16);
  const secondColor = Math.floor(Math.random() * 16777215).toString(16);
  let txn = await nftContract.makeAnEpicNFT(
    `#${firstColor}`,
    `#${secondColor}`
  );
  await txn.wait();
}

const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (error) {
    console.error(error);
    process.exit(1);
  }
};

runMain();
