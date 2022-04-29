## Sūrya's Description Report

### Files Description Table


|  File Name  |  SHA-1 Hash  |
|-------------|--------------|
| contracts/FLTPC.sol | 69e180e1018be311601a3922f68cdcfa70801554 |


### Contracts Description Table


|  Contract  |         Type        |       Bases      |                  |                 |
|:----------:|:-------------------:|:----------------:|:----------------:|:---------------:|
|     └      |  **Function Name**  |  **Visibility**  |  **Mutability**  |  **Modifiers**  |
||||||
| **FLTPC** | Implementation | Ownable, Pausable |||
| └ | <Constructor> | Public ❗️ | 🛑  |NO❗️ |
| └ | transferOwnership | Public ❗️ | 🛑  | onlyOwner |
| └ | start_LMSs | Public ❗️ | 🛑  | onlyOwner whenLMSNotAccepting |
| └ | close_LMSs | Public ❗️ | 🛑  | onlyOwner whenLMSAccepting |
| └ | createFLNFT | Public ❗️ | 🛑  | onlyOwner whenPaused |
| └ | submitLocalModel | Public ❗️ | 🛑  | whenLMSAccepting |
| └ | Validate_LMS | Internal 🔒 |   | |
| └ | Add_LMS | Internal 🔒 | 🛑  | |
| └ | Download_LMSx | Public ❗️ |   | whenLMSNotAccepting |
| └ | Download_LMS | Public ❗️ |   | whenLMSNotAccepting |
| └ | ADRLMS | Public ❗️ | 🛑  | onlyOwner whenLMSNotAccepting |
| └ | setLMSADRC | Public ❗️ | 🛑  | onlyOwner whenLMSNotAccepting |
| └ | GMupdate | Public ❗️ | 🛑  | onlyOwner whenLMSNotAccepting |
| └ | pause | Public ❗️ | 🛑  | onlyOwner whenFLNFTminted |
| └ | unpause | Public ❗️ | 🛑  | onlyOwner whenFLNFTminted |
| └ | <Receive Ether> | External ❗️ |  💵 |NO❗️ |
| └ | <Fallback> | External ❗️ |  💵 |NO❗️ |
| └ | withdraw | Public ❗️ | 🛑  | onlyOwner |
| └ | FLTCwithdraw | Public ❗️ | 🛑  | onlyOwner |


### Legend

|  Symbol  |  Meaning  |
|:--------:|-----------|
|    🛑    | Function can modify state |
|    💵    | Function is payable |
