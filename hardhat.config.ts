import * as dotenv from "dotenv";

import { HardhatUserConfig, task } from "hardhat/config";
import "@nomiclabs/hardhat-etherscan";
import "@nomiclabs/hardhat-waffle";
import "@typechain/hardhat";
import "hardhat-gas-reporter";
import "solidity-coverage";

dotenv.config();

// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

import {
  YOUR_ETHERSCAN_API_KEY,
  RINKEBY_URL,
  ROPSTEN_URL,
  RINKEBY_PRIVATE_KEY_0,
  RINKEBY_PRIVATE_KEY_1,
  RINKEBY_PRIVATE_KEY_2,
  RINKEBY_PRIVATE_KEY_3,
  RINKEBY_PRIVATE_KEY_4,
  RINKEBY_PRIVATE_KEY_5,
  RINKEBY_PRIVATE_KEY_6,
  RINKEBY_PRIVATE_KEY_7,
  RINKEBY_PRIVATE_KEY_8,
  RINKEBY_PRIVATE_KEY_9,
  RINKEBY_PRIVATE_KEY_10,
  RINKEBY_PRIVATE_KEY_11,
  

} from './constants/constants'

const config: HardhatUserConfig = {
  solidity: "0.8.7",
  networks: {
    hardhat: {
      chainId: 1337                
    },
    rinkeby: {
      url: RINKEBY_URL,
      accounts: [RINKEBY_PRIVATE_KEY_0,RINKEBY_PRIVATE_KEY_1,RINKEBY_PRIVATE_KEY_2,RINKEBY_PRIVATE_KEY_3,RINKEBY_PRIVATE_KEY_4,RINKEBY_PRIVATE_KEY_5,RINKEBY_PRIVATE_KEY_6,RINKEBY_PRIVATE_KEY_7,RINKEBY_PRIVATE_KEY_8,RINKEBY_PRIVATE_KEY_9,RINKEBY_PRIVATE_KEY_10,RINKEBY_PRIVATE_KEY_11],
    },
    ropsten: {
      url: ROPSTEN_URL,
      accounts: [RINKEBY_PRIVATE_KEY_0,RINKEBY_PRIVATE_KEY_1,RINKEBY_PRIVATE_KEY_2,RINKEBY_PRIVATE_KEY_3,RINKEBY_PRIVATE_KEY_4,RINKEBY_PRIVATE_KEY_5,RINKEBY_PRIVATE_KEY_6,RINKEBY_PRIVATE_KEY_7,RINKEBY_PRIVATE_KEY_8,RINKEBY_PRIVATE_KEY_9,RINKEBY_PRIVATE_KEY_10,RINKEBY_PRIVATE_KEY_11],
    }
  },
  gasReporter: {
    enabled: process.env.REPORT_GAS !== undefined,
    currency: "USD",
  },
  etherscan: {
    apiKey: process.env.YOUR_ETHERSCAN_API_KEY,
  },
};

export default config;