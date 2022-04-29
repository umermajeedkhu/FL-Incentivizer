// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


interface IFLTC {
   function withdraw() external;
   function mintFLToken(address recipient) external  returns(bool);
}

