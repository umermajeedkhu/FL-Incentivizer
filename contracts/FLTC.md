## Sūrya's Description Report

### Files Description Table


|  File Name  |  SHA-1 Hash  |
|-------------|--------------|
| contracts/FLTC.sol | ece9961ef07cbeaaf6ba9742066a814e056b6dc5 |


### Contracts Description Table


|  Contract  |         Type        |       Bases      |                  |                 |
|:----------:|:-------------------:|:----------------:|:----------------:|:---------------:|
|     └      |  **Function Name**  |  **Visibility**  |  **Mutability**  |  **Modifiers**  |
||||||
| **FLTC** | Implementation | ERC20, Ownable, Pausable |||
| └ | <Constructor> | Public ❗️ | 🛑  | ERC20 |
| └ | mintFLToken | Public ❗️ | 🛑  | whenNotPaused onlyOwner |
| └ | pause | Public ❗️ | 🛑  | onlyOwner |
| └ | unpause | Public ❗️ | 🛑  | onlyOwner |
| └ | renounceOwnership | Public ❗️ |   | onlyOwner |
| └ | transferOwnership | Public ❗️ |   | onlyOwner |
| └ | <Receive Ether> | External ❗️ |  💵 |NO❗️ |
| └ | <Fallback> | External ❗️ |  💵 |NO❗️ |
| └ | withdraw | Public ❗️ | 🛑  | onlyOwner |


### Legend

|  Symbol  |  Meaning  |
|:--------:|-----------|
|    🛑    | Function can modify state |
|    💵    | Function is payable |
