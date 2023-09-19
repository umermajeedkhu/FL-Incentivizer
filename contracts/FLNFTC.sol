// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


// Import the openzepplin contracts
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/utils/Counters.sol";



contract FLNFTC is ERC721Enumerable, Ownable, Pausable {
    using Strings for uint256;
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIds;

    // mapping for token URIs
    mapping (uint256 => string) private tokenURIs;
    mapping (uint256 => address) public  FLTPCAddresses;
    mapping (uint256 => string) private GMipfsHashes;
    string public baseURI;  // ipfs://QmTy8w65yBXgyfG2ZBg5TrfB2hPjrDQH3RCQFJGkARStJb
    // baseTokenURI="ipfs://"

    // all tokens in this contract should have unique tokenURI // can be assigned repeatedly if required but at the time they should be unique
    // this mapping assign 1 to the currently active tokenURI
    mapping(string => uint8) private tokenURIsCheck;
    // all tokens in this contract should have unique FLTPCAddress// can be assigned repeatedly if required but at the time they should be unique
    // this mapping assign 1 to the currently active FLTPCAddress
    mapping(address => uint8) private FLTPCAddressescheck;
    // all tokens in this contract should have unique GMipfsHash // can be assigned repeatedly if required but at the time they should be unique
    // this mapping assign 1 to the currently active GMipfsHash
    mapping(string => uint8) private GMipfsHashCheck;

    event TokenURIset(uint FLNFTID, string _tokenURI);
    event GMipfsHashset(uint FLNFTID, string _GMipfsHash);


    constructor(string memory __baseURI) ERC721("FLNFT", "FLNFT") {

        // mint an NFT to yourself
        // _mint(msg.sender, 1);
        // _owner = msg.sender;
        baseURI = __baseURI;
    }


    function getGMipfsHash(uint _tokenId) public view returns (string memory _GMipfsHash){
        require(_exists(_tokenId), "ERC721Metadata: URI query for nonexistent token");
        

        _GMipfsHash = GMipfsHashes[_tokenId];

        // If both are set, concatenate the baseURI and tokenURI (via abi.encodePacked).
        if (bytes(_GMipfsHash).length > 0) {
            _GMipfsHash = string(abi.encodePacked(baseURI, _GMipfsHash));
        }
    }


    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal virtual  {
        super._beforeTokenTransfer(from, to, tokenId,1);

        require(!paused(), "ERC721Pausable: token can not transfer while paused");
    }

 

    function _baseURI() internal view override returns (string memory) {
        return baseURI;
    }

    function tokenURI(uint256 _tokenId) public view override returns (string memory _tokenURI) {
        
        require(_exists(_tokenId), "ERC721Metadata: URI query for nonexistent token");
        

       _tokenURI = tokenURIs[_tokenId];

        // If both are set, concatenate the baseURI and tokenURI (via abi.encodePacked).
        if (bytes(_tokenURI).length > 0) {
            _tokenURI = string(abi.encodePacked(baseURI, _tokenURI));
        }
    }

    function _is_FLTPCAddress(address spender, uint256 _tokenId) internal view returns (bool) {
        require(_exists(_tokenId), "ERC721: operator query for nonexistent token");
        address owner = FLTPCAddresses[_tokenId];
        return (spender == owner);
    }

    function setTokenURI(uint256 _tokenId, string memory _tokenURI) public  whenNotPaused returns (bool){
        require(_exists(_tokenId), "ERC721Metadata: URI set of nonexistent token");
        
        require(_is_FLTPCAddress( _msgSender(), _tokenId) ,"caller is not owner of FLTPCAddress");
        
        require(tokenURIsCheck[_tokenURI] != 1, "Provided _tokenURI already exist");
        string memory _currtokenURI = tokenURIs[_tokenId];
        tokenURIs[_tokenId] = _tokenURI;
        tokenURIsCheck[_currtokenURI] = 0;
        emit TokenURIset( _tokenId,  _tokenURI);
        return true;
    }

    function setGMipfsHash(uint256 _tokenId, string memory _GMipfsHash) public whenNotPaused returns (bool){
        require(_exists(_tokenId), "ERC721Metadata: _GMipfsHash set of nonexistent token");
        
        require(_is_FLTPCAddress( _msgSender(), _tokenId),"caller is not owner of FLTPCAddress");
        
        require(GMipfsHashCheck[_GMipfsHash] != 1, "Provided _GMipfsHash already exist");
        string memory _currGMipfsHash = GMipfsHashes[_tokenId];
        GMipfsHashes[_tokenId] = _GMipfsHash;
        GMipfsHashCheck[_currGMipfsHash] = 0;
        emit GMipfsHashset( _tokenId,  _GMipfsHash);
        return true;
    }


    function mintFLNFT(address minter, address _FLTPCAddress, string memory _tokenURI, string memory _GMipfsHash) public whenNotPaused returns (uint256){

        require(tokenURIsCheck[_tokenURI] != 1, "Provided _tokenURI already exist");
        require(GMipfsHashCheck[_GMipfsHash] != 1, "Provided _GMipfsHash already exist");
        require(FLTPCAddressescheck[_FLTPCAddress] != 1, "Provided _FLTPCAddress already exist");
        
        _tokenIds.increment();
        uint256 _tokenId = _tokenIds.current();
        _mint(minter, _tokenId);
        require(_exists(_tokenId), "ERC721Metadata: nonexistent token");
        FLTPCAddresses[_tokenId] = _FLTPCAddress;
        GMipfsHashes[_tokenId] = _GMipfsHash;
        tokenURIs[_tokenId] = _tokenURI;
        emit GMipfsHashset( _tokenId,  _GMipfsHash);
        emit TokenURIset( _tokenId,  _tokenURI);
        return _tokenId;

    }

    function renounceOwnership() public view override onlyOwner {
        revert("can't renounceOwnership here"); //not possible with this smart contract
    }

    function pause() public onlyOwner{
        _pause();
    }

    function unpause() public onlyOwner{
        _unpause();
    }

    receive() external payable {
    }

    fallback() external payable {
    }

    function withdraw() public onlyOwner  {
          address _owner = owner();
          uint256 amount = address(this).balance;
          (bool sent, ) =  _owner.call{value: amount}("");
          require(sent, "Failed to send Ether");
    }


}