const { artifacts, ethers } = require("hardhat");
const { BigNumber, utils: { keccak256, defaultAbiCoder, toUtf8Bytes, solidityPack }, } = require("ethers")


async function main() {

    let accounts = await ethers.getSigners();

    let fLNFTC;
    let fLTPC;
    let flTC;

    const FLNFTC = await ethers.getContractFactory("FLNFTC");
    fLNFTC = await FLNFTC.connect(accounts[0]).deploy("https://ipfs.io/ipfs/");
    console.log("FLNFTC deployed to:", fLNFTC.address);
    console.log("FLNFTC is Paused:", await fLNFTC.paused());
    console.log("Owner of FLNFTC:", await fLNFTC.owner());

    const FLTPC = await ethers.getContractFactory("FLTPC");
    fLTPC = await FLTPC.connect(accounts[1]).deploy(fLNFTC.address);

    const FLTC = await ethers.getContractFactory("FLTC");
    let fLTCAddr = await fLTPC.FLTCAddr();
    fLTC = await FLTC.attach(fLTCAddr).connect(accounts[2]);

    console.log("FLTPC deployed to:", fLTPC.address);
    console.log("FLTPC is Paused:", await fLTPC.paused());
    console.log("Owner of FLTPC:", await fLTPC.owner());
    console.log("address of FLTPC.FLNFTCAddr:", await fLTPC.FLNFTCAddr());
    console.log("address of FLTPC.FLTCAddr:", await fLTPC.FLTCAddr());
    console.log("FLTPC.FLNFTID:", await fLTPC.FLNFTID());

    console.log("Owner of FLTC:", await fLTC.owner());


}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });
