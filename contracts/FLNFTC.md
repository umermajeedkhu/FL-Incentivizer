## Sūrya's Description Report

### Files Description Table


|  File Name  |  SHA-1 Hash  |
|-------------|--------------|
| contracts/FLNFTC.sol | 5e853ee9c4bacce8760291993062b6f5173d9c92 |


### Contracts Description Table


|  Contract  |         Type        |       Bases      |                  |                 |
|:----------:|:-------------------:|:----------------:|:----------------:|:---------------:|
|     └      |  **Function Name**  |  **Visibility**  |  **Mutability**  |  **Modifiers**  |
||||||
| **FLNFTC** | Implementation | ERC721Enumerable, Ownable, Pausable |||
| └ | <Constructor> | Public ❗️ | 🛑  | ERC721 |
| └ | getGMipfsHash | Public ❗️ |   |NO❗️ |
| └ | _beforeTokenTransfer | Internal 🔒 | 🛑  | |
| └ | _baseURI | Internal 🔒 |   | |
| └ | tokenURI | Public ❗️ |   |NO❗️ |
| └ | _is_FLTPCAddress | Internal 🔒 |   | |
| └ | setTokenURI | Public ❗️ | 🛑  | whenNotPaused |
| └ | setGMipfsHash | Public ❗️ | 🛑  | whenNotPaused |
| └ | mintFLNFT | Public ❗️ | 🛑  | whenNotPaused |
| └ | renounceOwnership | Public ❗️ |   | onlyOwner |
| └ | pause | Public ❗️ | 🛑  | onlyOwner |
| └ | unpause | Public ❗️ | 🛑  | onlyOwner |
| └ | <Receive Ether> | External ❗️ |  💵 |NO❗️ |
| └ | <Fallback> | External ❗️ |  💵 |NO❗️ |
| └ | withdraw | Public ❗️ | 🛑  | onlyOwner |


### Legend

|  Symbol  |  Meaning  |
|:--------:|-----------|
|    🛑    | Function can modify state |
|    💵    | Function is payable |
