# Description
> This file contains the creteria for rewarding Local model Submissions to FLT.

# Creteria
To get the Approval for LMS and the reward for LMS these creteria must be met: 

1. The local model submission (LMS)  done using `function submitLocalModel(string memory _LMipfsHash, string memory _LMURI, uint _GI)`; where: `GI` must be the progressing global iteration, `_LMipfsHash` must be IPFS hash for `.pkl` file of the local model, `_LMURI` must be the IPFS hash of `.json` that contains metaData for LMS.
2. The `_LMipfsHash` and `_LMURI` must be the `IPFS_hash` without anything else: i.e. `IPFS_hash` could be `QmcfsZCGdcXyHJP8MupMQwYuSET8TFJCHUhAaoJwe4EJuP`