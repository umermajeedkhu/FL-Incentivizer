# Description
> This file contains the guidelines for the local model submissions.

# Guidelines
1. The local model submission (LMS) should be done using `function submitLocalModel(string memory _LMipfsHash, string memory _LMURI, uint _GI)`; where: `GI` is the progressing global iteration, `_LMipfsHash` is IPFS hash for `.pkl` file of the local model, `_LMURI` is the IPFS hash of `.json` that contains metaData for LMS.
2. The IPFS link for a file is like `"https://ipfs.io/ipfs/"+IPFS_hash`, where `IPFS_hash` could be `QmcfsZCGdcXyHJP8MupMQwYuSET8TFJCHUhAaoJwe4EJuP`. Please submit only `IPFS_hash` for `_LMipfsHash` and `_LMURI`.

