const { artifacts, ethers } = require("hardhat");
const { BigNumber, utils: { keccak256, defaultAbiCoder, toUtf8Bytes, solidityPack }, } = require("ethers")


async function main() {
    let accounts = await ethers.getSigners();

    let fLNFTC, fLNFTCAddr, tx ;
    let fLTPC,fLTPCAddr="0x0Ec67d3fBa044F609cb34E84A46f8d5BD21D6a69";
    let flTC, fLTCAddr;

    const FLTPC = await ethers.getContractFactory("FLTPC");
    fLTPC = await FLTPC.attach(fLTPCAddr).connect(accounts[1]);

    fLNFTCAddr = await fLTPC.FLNFTCAddr();
    const FLNFTC = await ethers.getContractFactory("FLNFTC");
    fLNFTC = await FLNFTC.attach(fLNFTCAddr).connect(accounts[0]);


    fLTCAddr = await fLTPC.FLTCAddr();
    const FLTC = await ethers.getContractFactory("FLTC");
    fLTC = await FLTC.attach(fLTCAddr).connect(accounts[2]);

    console.log("Owner of FLTPC:", await fLTPC.owner());
    console.log("FLTPC is Paused:", await fLTPC.paused());
    console.log("address of FLTPC.FLNFTCAddr:", await fLTPC.FLNFTCAddr());
    console.log("address of FLTPC.FLTCAddr:", await fLTPC.FLTCAddr());

    console.log("baseURI of FLNFTC:", await fLNFTC.baseURI());
    console.log("FLTC totalSupply", await fLTC.totalSupply()); 
    console.log("FLTC name", await fLTC.name());
    console.log("FLTC symbol", await fLTC.symbol());

    console.log("Owner of FLTPC:", await fLTPC.owner());
    console.log("FLTPC is Paused:", await fLTPC.paused());
    console.log("address of FLTPC.FLNFTCAddr:", await fLTPC.FLNFTCAddr());
    console.log("address of FLTPC.FLTCAddr:", await fLTPC.FLTCAddr());

    console.log("baseURI of FLNFTC:", await fLNFTC.baseURI());
    console.log("FLTC totalSupply", await fLTC.totalSupply()); 
    console.log("FLTC name", await fLTC.name());
    console.log("FLTC symbol", await fLTC.symbol());

//-start---------- fLTPC.createFLNFT--------------------------------------------------------------------------    
    fLTPC = await FLTPC.attach(fLTPCAddr).connect(accounts[1])
    tx = await fLTPC.createFLNFT("Qma8m5GhUxRRq6iQLwfqWJmMvDKzWZFnnuQW21BhyRvBR8","QmT6BBUnEsd84HFqGFNZWQtQdWkjL449pJjBtPHezLN4kj");
    receipt = await tx.wait();
    console.log(receipt);
    for (const event of receipt.events) {
      console.log(`Event ${event.event} with args ${event.args}`);
    }

//-end------------------------------------------------------------------------------------    
    
    console.log("FLTPC FLNFTID:", await fLTPC.FLNFTID());
    console.log("FLTPC FLNFTID 1 owner:", await fLNFTC.ownerOf(1));
    console.log("FLNFTC FLNFTID 1 getGMipfsHash:", await fLNFTC.getGMipfsHash(1));
    console.log("FLNFTC FLNFTID 1 tokenURI:", await fLNFTC.tokenURI(1));
    console.log("FLTPC LMSAccepting:", await fLTPC.LMSAccepting());


//-start---------- fLTPC.start_LMSs--------------------------------------------------------------------------    

    tx = await fLTPC.start_LMSs();
    receipt = await tx.wait();
    console.log(receipt);
    for (const event of receipt.events) {
    console.log(`Event ${event.event} with args ${event.args}`);
    }

    console.log("FLTPC LMSAccepting:", await fLTPC.LMSAccepting());

//-end------------------------------------------------------------------------------------    


//-start---------- fLTPC.submitLocalModel--------------------------------------------------------------------------    

    fLTPC = await FLTPC.attach(fLTPCAddr).connect(accounts[2])
    tx = await fLTPC.submitLocalModel("QmcSQvN6hX6A5ut72ZZaNYi87A3CSr53Sv9sP48vUxe4GX","Qmc7QUWxE9c1sV1E76CAMu8fgBQsyYFLLh3ViP3ThPgwLZ",1)
    receipt = await tx.wait();
    console.log(receipt);
    for (const event of receipt.events) {
        console.log(`Event ${event.event} with args ${event.args}`);
    }

    fLTPC = await FLTPC.attach(fLTPCAddr).connect(accounts[3])
    tx = await fLTPC.submitLocalModel("Qme1R8zu7krxVGaKmvpngEgCkiKYxZgJTg1UgVCjhmPf5y","QmTnL1NuRdKvq8U59zD8hGpKeMPhsYePuHnXwks9sd1DEN",1)
    receipt = await tx.wait();
    console.log(receipt);
    for (const event of receipt.events) {
        console.log(`Event ${event.event} with args ${event.args}`);
    }

    fLTPC = await FLTPC.attach(fLTPCAddr).connect(accounts[4])
    tx = await fLTPC.submitLocalModel("QmR2YwZi8FeVRfcR78gZR2TEpCD7KvAz2xY75pmX4Sarwr","QmTTvk2GSWCk2epXb13yXsfDS2KyW2cJsxgoDQfXwatVEs",1)
    receipt = await tx.wait();
    console.log(receipt);
    for (const event of receipt.events) {
        console.log(`Event ${event.event} with args ${event.args}`);
    }

    fLTPC = await FLTPC.attach(fLTPCAddr).connect(accounts[5])
    tx = await fLTPC.submitLocalModel("QmdhMbP9mwdfL5jc86jKwo1r7138vVdz1X7fhh946E6ZTK","QmbvYjmLLovMVyrgoTheF8ZekN4nM1gGc2DaPr1AQfGQP4",1)
    receipt = await tx.wait();
    console.log(receipt);
    for (const event of receipt.events) {
        console.log(`Event ${event.event} with args ${event.args}`);
    }

    fLTPC = await FLTPC.attach(fLTPCAddr).connect(accounts[6])
    tx = await fLTPC.submitLocalModel("QmZJyntfsBfWKjtHWnzhAkgd9qCsUwoKUr6v4m8UeihypQ","Qmbszw4YBgeZwzkTCF8peCsDnEdNmwvfVisDLvRGzhnJmG",1)
    receipt = await tx.wait();
    console.log(receipt);
    for (const event of receipt.events) {
        console.log(`Event ${event.event} with args ${event.args}`);
    }

    fLTPC = await FLTPC.attach(fLTPCAddr).connect(accounts[7])
    tx = await fLTPC.submitLocalModel("QmYz6W2cow1NgMWkhjciWmLeTQ2QjKwtwNw8wkRUqqiC15","QmdQ5YnKoQzcD4JZNC6ZNwoA2wgZ2hCpM2TuQZYjZyCe5j",1)
    receipt = await tx.wait();
    console.log(receipt);
    for (const event of receipt.events) {
        console.log(`Event ${event.event} with args ${event.args}`);
    }

    fLTPC = await FLTPC.attach(fLTPCAddr).connect(accounts[8])
    tx = await fLTPC.submitLocalModel("QmPA9xbPcZkwp6VjctSZ4MTLgzu8h4hpqJMUNoaguacHKF","QmYk29HjdptpPrvqWv4mAHFPbkMjfwE5MQrKPS2XewFrGv",1)
    receipt = await tx.wait();
    console.log(receipt);
    for (const event of receipt.events) {
        console.log(`Event ${event.event} with args ${event.args}`);
    }

    fLTPC = await FLTPC.attach(fLTPCAddr).connect(accounts[9])
    tx = await fLTPC.submitLocalModel("QmaFvC6JPDs3Qu41KiQRiY1knUFzxeTScKFxs3ezC1soP5","Qmf44f9eGK5TUAgDZaajnpByVzEcgh2i7L9dRCpDbbPLVh",1)
    receipt = await tx.wait();
    console.log(receipt);
    for (const event of receipt.events) {
        console.log(`Event ${event.event} with args ${event.args}`);
    }

    fLTPC = await FLTPC.attach(fLTPCAddr).connect(accounts[10])
    tx = await fLTPC.submitLocalModel("QmNdtAc6KG3USrq1QvuHuCqXYm68jDMLRzjcAmwXUaTGrc","QmXhY8WxNJmBcw1Rb1gBysBweBy3MSL5fmH4zfkKUHKJAm",1)
    receipt = await tx.wait();
    console.log(receipt);
    for (const event of receipt.events) {
        console.log(`Event ${event.event} with args ${event.args}`);
    }

    fLTPC = await FLTPC.attach(fLTPCAddr).connect(accounts[11])
    tx = await fLTPC.submitLocalModel("QmZ7wFex5roxSg4w1xzS3Ry7ApZFAcg7C6nEmokB3rAcqV","QmS16WpVcWAg6hGR5thGRiTitzinC6jgnB4nZQmqG6H3fg",1)
    receipt = await tx.wait();
    console.log(receipt);
    for (const event of receipt.events) {
        console.log(`Event ${event.event} with args ${event.args}`);
    }

//-end------------------------------------------------------------------------------------  


//-start---------- fLTPC.close_LMSs--------------------------------------------------------------------------    

    fLTPC = await FLTPC.attach(fLTPCAddr).connect(accounts[1])
    console.log("FLTPC LMSAccepting:", await fLTPC.LMSAccepting());

    tx = await fLTPC.close_LMSs();
    receipt = await tx.wait();
    console.log(receipt);
    for (const event of receipt.events) {
    console.log(`Event ${event.event} with args ${event.args}`);
    }

    console.log("FLTPC LMSAccepting:", await fLTPC.LMSAccepting());

//-end------------------------------------------------------------------------------------    

//-start---------- fLTPC.Download_LMSx--------------------------------------------------------------------------    
    fLTPC = await FLTPC.attach(fLTPCAddr).connect(accounts[1])

    LMSubmitters = await fLTPC.Download_LMSx(1);

    console.log(LMSubmitters);

    for (i in LMSubmitters){
        // console.log("Address is", LMSubmitters[i]);
        LM = await fLTPC.Download_LMS(1, LMSubmitters[i]);
        // console.log("LM is", LM);
    
    }
    console.log("LM is", LM);
    console.log("LMtype is", typeof(LM));
    console.log("LM keys is", Object.keys(LM));


//-end------------------------------------------------------------------------------------    


 //-start---------- fLTPC.ADRLMS--------------------------------------------------------------------------    
   
    fLTPC = await FLTPC.attach(fLTPCAddr).connect(accounts[1])

        
    console.log("FLTC totalSupply", await fLTC.totalSupply());
    for (let i = 2; i < 12; i++) {
        LMADR = await fLTPC.ADRLMS(accounts[i].address, 1,2);
        receipt = await LMADR.wait();
        console.log(receipt);
        for (const event of receipt.events) {
            console.log(`Event ${event.event} with args ${event.args}`);
        }
    }

    fLTPC = await FLTPC.attach(fLTPCAddr).connect(accounts[1]);
    tx = await fLTPC.setLMSADRC(1);
    receipt = await tx.wait();
    console.log(receipt);
    for (const event of receipt.events) {
        console.log(`Event ${event.event} with args ${event.args}`);
    }
    console.log("FLTC totalSupply", await fLTC.totalSupply());

//-end------------------------------------------------------------------------------------    
    // console.log("FLTPC LMSADRC GI", await fLTPC.LMSADRC(1));

    fLTPC = await FLTPC.attach(fLTPCAddr).connect(accounts[1])
    tx = await fLTPC.GMupdate(1,"QmWxBLJzaawXYqPFf54KPWnRX5yXwNZRPYpx1dBHTSgiYp","QmYGKr6p9MLbAVaQBAn9kAJ8dxFPnzahEVX3NvHczZ1fEE");
    receipt = await tx.wait();
    console.log(receipt);
    for (const event of receipt.events) {
      console.log(`Event ${event.event} with args ${event.args}`);
    }


}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});