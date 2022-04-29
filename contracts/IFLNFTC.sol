// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


interface IFLNFTC {
    function mintFLNFT(address minter, address _FLtaskPublisherContract, string memory _tokenURI, string memory _GMipfsHash) external  returns (uint256);
    function setTokenURI(uint256 _tokenId, string memory _tokenURI) external returns(bool);
    function setGMipfsHash(uint256 _tokenId, string memory _GMipfsHash) external returns(bool);
    function ownerOf(uint256 tokenId) external view returns (address owner);
}