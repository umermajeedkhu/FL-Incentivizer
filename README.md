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
