 // We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// When running the script with `npx hardhat run <script>` you'll find the Hardhat
// Runtime Environment's members available in the global scope.
const { ethers } = require("hardhat");
const abi = require("../utils/abi.json");
 
// const wEth = '0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2' //mainnet  
const wEth = '0xC558DBdd856501FCd9aaF1E62eae57A9F0629a3c' //sepolia  
const addrZero = '0x0000000000000000000000000000000000000000'
// const POOL = "0x87870Bca3F3fD6335C3F4ce8392D69350B4fA4E2";  //mainnet
const POOL = "0x6Ae43d3271ff6888e7Fc43Fd7321a503ff738951";  //sepolia
const _wallet = "0xfdb039899F5BfeAc8bc3cd898A0E807d31849Fde";


async function main() {
  // try {
  // This is just a convenience check
  if (network.name === "hardhat") {
    console.warn(
      "You are trying to deploy a contract to the Hardhat Network, which" +
        "gets automatically created and destroyed every time. Use the Hardhat" +
        " option '--network localhost'"
    );
  }


  const [deployer] = await ethers.getSigners();
  
 //////////////////////////////////////Deploying DegenWallet////////////////////////////////////////////
 
//  DegenWallet = await ethers.getContractFactory("DegenWallet");
//  const taxFee = 69;
//  const wallet = await DegenWallet.deploy(taxFee,_wallet,_wallet);
//  await wallet.deployed();
//  console.log("DegenWallet Address", wallet.address);

const wallet = await ethers.getContractAt("DegenWallet","0x7879163fc6C9e297EEE6DBEfFF16f73981dc38Ae");


////////////////////////////////////////////Calling Function//////////////////////////////////////////// 

////lending ETH

const dept = new ethers.Contract(POOL,abi,deployer)

console.log("User ETH Balance Before ==============>",await deployer.getBalance())  
const balanceBefore = await dept.getReserveData(wEth)
console.log(balanceBefore[8]);
const atokenAAVE = await ethers.getContractAt("USDC",balanceBefore[8])

 console.log("User aweth Balance Before ==============>",await atokenAAVE.balanceOf("0x7A675d2485924E19A7C43E540B08b8f4d7426884"))
const tx =  await wallet.lendTokenOnAave(addrZero,0,{value:ethers.utils.parseEther("0.002")})
await tx.wait(2)
console.log("User aweth Balance After ==============>",await atokenAAVE.balanceOf("0x7A675d2485924E19A7C43E540B08b8f4d7426884"))

////Withdraw Collateral ETH
console.log("WithDrawing Collateral.........");
const useraWETHBefore = await atokenAAVE.balanceOf("0x7A675d2485924E19A7C43E540B08b8f4d7426884");
console.log("aweth balance while withdrawing",useraWETHBefore.toString())
// atokenAAVE.approve(wallet.address, useraWETHBefore.toString())
// await atokenAAVE.approve(wallet.address, useraWETHBefore.toString())
const tx2 = await atokenAAVE.approve("0x7879163fc6C9e297EEE6DBEfFF16f73981dc38Ae", useraWETHBefore.toString())
await tx2.wait(2)
await wallet.withdrawCollateral(wEth, useraWETHBefore.toString())  
const useraWETHAfter = await atokenAAVE.balanceOf("0x7A675d2485924E19A7C43E540B08b8f4d7426884")
console.log("User aWETH Balance After==============>",useraWETHAfter.toString())  
console.log("User ETH Balance After ==============>",await deployer.getBalance())  

}



main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });


// npx hardhat run scripts/sepoliatest.js --network sepolia