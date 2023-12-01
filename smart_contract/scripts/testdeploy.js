
const { ethers } = require("hardhat");
const { verify } = require("./verifyContract");


const deployerAddress = "0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266";        //for localhost    
const addrZero = '0x0000000000000000000000000000000000000000'
const person1 = "0x7A675d2485924E19A7C43E540B08b8f4d7426884";                //for goerli
const person2 = "0x808f0597D8B83189ED43d61d40064195F71C0D15";                //for goerli
const person3 = "0xf3545A1eaD63eD1A6d8b6E63d68D937cdBf1aeE4";                //for goerli
const person4 = "0x5cbD5063DdaE154c546860e2A4D2C16E2e1C786c";                //for goerli
const person5 = "0xa13e152ED443c52DF0c33612E80904Ce849db3Ae";                //for goerli
const person6 = "0x1260e408d9E1Ad2f2293Fb092D840BF252c68833";                //for goerli



async function main() {
 // This is just a convenience check
  if (network.name === "hardhat") {
    console.warn(
      "You are trying to deploy a contract to the Hardhat Network, which" +
        "gets automatically created and destroyed every time. Use the Hardhat" +
        " option '--network localhost'"
    );
  
    }

    const [deployer] = await ethers.getSigners();
    
    console.log("DEPLOYING CONTRACTS.......................");    

    ////////////////////////////////////////////Moola Token/////////////////////////////////////////////
    const Moola = await ethers.getContractFactory("Moola")
    const moola = await Moola.deploy()
    await moola.deployed()
    console.log("Moola Address", moola.address)


    ////////////////////////////////////////////Verifying Contracts/////////////////////////////////////////

    // console.log("Verifying Moola Token")
    // const args = [];
    // await verify(moola.address, args, true);

   


}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });

// npx hardhat run scripts/testdeploy.js --network hardhat
