# Important Update !!! on our published IEEE Access outdated information (Ethereum Merge)
After the Ethereum Merge, Rinkeby and Ropsten test networks have been deprecated. As a result, we have migrated our FL-Incentivizer to the Sepolia test network. Previously, our FL-Incentivizer was deployed on Rinkeby and Ropsten, as mentioned in our published IEEE Access journal. However, to align with the current developments, we have updated and deployed the FL-Incentivizer on the Sepolia test network. This change ensures that our application remains compatible with the evolving Ethereum ecosystem. Please refer to the updated information in this section of the README file for the most recent deployment details.


## Deployment

> SECTION V-A IMPLEMENTATION AND DEPLOYMENT

We deployed our smart contracts using Hardhat and JavaScript using the commands

`npx hardhat run script/deploy.js
--network sepolia`

## Etherscan verification commands

### FLNFT

`npx hardhat verify --network sepolia 0x51676b3077807AB483e276E5d31AaB4eC00db067 "https://ipfs.io/ipfs/"`

### FLTPC
`npx hardhat verify --network sepolia 0x0Ec67d3fBa044F609cb34E84A46f8d5BD21D6a69 0x51676b3077807AB483e276E5d31AaB4eC00db067`
### FLTC
`npx hardhat verify --network sepolia 0xd6846E68694A029E4158a21CB2158957482D5e97 "FLToken" "FLT"`

## TABLE 2. Parameters

The TABLE 2. Parameters is updated as follow

| Parameter | Description | Sepolia |
|-----------|-------------|---------|
| $addrof(Regulator)$ | address of $Regulator$ | [0xCE23b7933759490516AA768595d0e32d42cd679b](https://sepolia.etherscan.io/address/0xCE23b7933759490516AA768595d0e32d42cd679b) |
| $addrof(FLTPCO)$ | address of $FLTPCO$ | [0x33fc30CCc6b4a0791a06428E51023CF88C68c632](https://sepolia.etherscan.io/address/0x33fc30CCc6b4a0791a06428E51023CF88C68c632) |
| $addrof(FLTrainer_1)$ | address of $FLTrainer_1$ | [0x6dF96AFfb722cDAa57A25c3955090B5166119C9a](https://sepolia.etherscan.io/address/0x6dF96AFfb722cDAa57A25c3955090B5166119C9a) |
| $addrof(FLTPC)$ | address of $FLTPC$ | [0x0Ec67d3fBa044F609cb34E84A46f8d5BD21D6a69](https://sepolia.etherscan.io/address/0x0Ec67d3fBa044F609cb34E84A46f8d5BD21D6a69) |
| $addrof(FLNFTC)$ | address of $FLNFTC$ | [0x51676b3077807AB483e276E5d31AaB4eC00db067](https://sepolia.etherscan.io/address/0x51676b3077807AB483e276E5d31AaB4eC00db067) |
| $addrof(FLTC)$ | address of $FLTC$ | [0xd6846E68694A029E4158a21CB2158957482D5e97](https://sepolia.etherscan.io/address/0xd6846E68694A029E4158a21CB2158957482D5e97) |
| $FLTPC.FLNFTID$ | Federated Learning Non-Fungible Token ID for a FLT | 1 |

## FIGURE 8. 

| Previous (Rinkeby) | Updated (Sepolia) |
|-------------------|------------------|
| FIGURE 8. Transaction executed for a complete GI on FLTPC (https://rinkeby.etherscan.io/address/0xdC63FB6f6a11c358D06Cf05A1049eC04cf1e5bc1)          | FIGURE 8. Transaction executed for a complete GI on FLTPC (https://sepolia.etherscan.io/address/0x0ec67d3fba044f609cb34e84a46f8d5bd21d6a69)'         |


## FIGURE 9. 

| Previous (Rinkeby) | Updated (Sepolia) |
|-------------------|------------------|
| FIGURE 9. Minting of FL-NFT to FLTPCO by transaction `Create FLNFT`(mintFLNFT)  (https://rinkeby.etherscan.io/tx/0x68fb7b7a448eaca40667a4fc890198f7f9de4e18aa12077f88b104d68864a2fb).        | FIGURE 9. Minting of FL-NFT to FLTPCO by transaction `Create FLNFT`(mintFLNFT)  (https://sepolia.etherscan.io/tx/0x93e76ce42d9b76f6b4ede511e262e7ac9d77e5079f2cd0171e8e2e554d231a7a).          |

## FIGURE 10. 

| Previous (Rinkeby) | Updated (Sepolia) |
|-------------------|------------------|
| FIGURE 10. Eventlog of transaction `GMupdate` showing events TokenURIset and GMipfsHashset (https://rinkeby.etherscan.io/tx/0x08c18089f0a3010373e16259b91f5591c22deda0c0980cb4fb0d77e785240697#eventlog).        | FIGURE 10. Eventlog of transaction `GMupdate` showing events TokenURIset and GMipfsHashset(https://sepolia.etherscan.io/tx/0xe60bb8ce28ce1cd85079637e76dacd65a6348129d0ff0a8539d21d4d5cdcfc77#eventlog).     |

## FIGURE 11. 

| Previous (Rinkeby) | Updated (Sepolia) |
|-------------------|------------------|
| FIGURE 11. Representative image of FL-NFT on OpenSea. Could See FL-NFT on OpenSea at (https://testnets.opensea.io/assets/0x620ef4e1cde7f1841538279e6baf1d1b96f6e6c4/1) before the Ethereum Merge. Now see property `image` for URL of representative image of FL-NFT from meta-data of FL-NFT at (https://ipfs.io/ipfs/QmWxBLJzaawXYqPFf54KPWnRX5yXwNZRPYpx1dBHTSgiYp)        | FIGURE 11. Representative image of FL-NFT on OpenSea. See FL-NFT on OpenSea at (https://testnets.opensea.io/assets/0x51676b3077807ab483e276e5d31aab4ec00db067/1). Can also property `image` for URL of representative image of FL-NFT from meta-data of FL-NFT at (https://ipfs.io/ipfs/QmWxBLJzaawXYqPFf54KPWnRX5yXwNZRPYpx1dBHTSgiYp)  |

## FIGURE 12. 

| Previous (Rinkeby) | Updated (Sepolia) |
|-------------------|------------------|
| FIGURE 12. Transfer of FL-Token (symbol: FLT) to FLTrainer1 for contributing a LMS for FLT (https://rinkeby.etherscan.io/tx/0x3668d209780b1518e97133c8c72b583227b38b39f8a7922b528eb371f3013081).       | FIGURE 12. Transfer of FL-Token (symbol: FLT) to FLTrainer1 for contributing a LMS for FLT (https://sepolia.etherscan.io/tx/0x7ad2fa424f86dfce32f7fdaa8cdd3ccfceaf56f8489695317532b79f7e10153c).  |




# genrate files

## surya mdreport of contracts
```bash
surya mdreport contracts/FLTC.md contracts/FLTC.sol
surya mdreport contracts/FLTPC.md contracts/FLTPC.sol
surya mdreport contracts/FLNFTC.md contracts/FLNFTC.sol
```

## flatten contracts
```bash
npx hardhat flatten contracts/FLNFTC.sol > flat_contracts/flat_FLNFTC.sol
npx hardhat flatten contracts/FLTC.sol > flat_contracts/flat_FLTC.sol
npx hardhat flatten contracts/FLTPC.sol > flat_contracts/flat_FLTPC.sol
``` 

## surya mdreport of flatten contracts

``` bash
surya mdreport flat_contracts/flat_FLTC.md flat_contracts/flat_FLTC.sol
surya mdreport flat_contracts/flat_FLTPC.md flat_contracts/flat_FLTPC.sol
surya mdreport flat_contracts/flat_FLNFTC.md flat_contracts/flat_FLNFTC.sol
```

## inheritance of flatten contracts

``` bash
surya inheritance flat_contracts/flat_FLTPC.sol | dot -Tpng > inheritanceGraphs/FLTPCandFLTC.png
surya inheritance flat_contracts/flat_FLNFTC.sol | dot -Tpng > inheritanceGraphs/FLNFTC.png
```

# project initalization 

## initialize project directory as node project
```bash
npm init
npm install --save-dev hardhat
npx hardhat
# Create an advanced sample project that uses TypeScript
```



# Default Hardhat Readme

## Advanced Sample Hardhat Project

This project demonstrates an advanced Hardhat use case, integrating other tools commonly used alongside Hardhat in the ecosystem.

The project comes with a sample contract, a test for that contract, a sample script that deploys that contract, and an example of a task implementation, which simply lists the available accounts. It also comes with a variety of other tools, preconfigured to work with the project code.

Try running some of the following tasks:

```shell
npx hardhat accounts
npx hardhat compile
npx hardhat clean
npx hardhat test
npx hardhat node
npx hardhat help
REPORT_GAS=true npx hardhat test
npx hardhat coverage
npx hardhat run scripts/deploy.ts
TS_NODE_FILES=true npx ts-node scripts/deploy.ts
npx eslint '**/*.{js,ts}'
npx eslint '**/*.{js,ts}' --fix
npx prettier '**/*.{json,sol,md}' --check
npx prettier '**/*.{json,sol,md}' --write
npx solhint 'contracts/**/*.sol'
npx solhint 'contracts/**/*.sol' --fix
```

## Etherscan verification

To try out Etherscan verification, you first need to deploy a contract to an Ethereum network that's supported by Etherscan, such as Ropsten.

In this project, copy the .env.example file to a file named .env, and then edit it to fill in the details. Enter your Etherscan API key, your Ropsten node URL (eg from Alchemy), and the private key of the account which will send the deployment transaction. With a valid .env file in place, first deploy your contract:

```shell
hardhat run --network ropsten scripts/deploy.ts
```

Then, copy the deployment address and paste it in to replace `DEPLOYED_CONTRACT_ADDRESS` in this command:

```shell
npx hardhat verify --network ropsten DEPLOYED_CONTRACT_ADDRESS "Hello, Hardhat!"
```

## Performance optimizations

For faster runs of your tests and scripts, consider skipping ts-node's type checking by setting the environment variable `TS_NODE_TRANSPILE_ONLY` to `1` in hardhat's environment. For more details see [the documentation](https://hardhat.org/guides/typescript.html#performance-optimizations).
