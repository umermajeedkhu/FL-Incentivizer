// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Import the openzepplin contracts
import "./Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/security/Pausable.sol";

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

import "./FLTC.sol";
import "./IFLNFTC.sol";
import "./IFLTC.sol";

contract FLTPC is Ownable, Pausable{
    using Strings for string; 

    address payable public FLTCAddr;
    address payable public FLNFTCAddr;
    uint public FLNFTID=0;
    uint public GI = 0;
    string public tokenURI = "";
    string public GMipfsHash = "";
    bool public LMSAccepting=false;



    enum LMstatus {
        notexist,
        Submitted,
        Approved,
        Denied,
        Rewarded
    }

    struct LM {
        string LMipfsHash;
        string LMURI;
        LMstatus lmstatus;
    }

    mapping(uint => mapping (address => LM )) private LMSs; // GI -> address -> LocalModel
    mapping(uint => address[]) private LMsubmitters;
    mapping(string => bool) private LMipfsHashes;
    mapping(string => bool) private LMURIs;
    mapping (uint => bool) public GIC;
    mapping (uint => bool) public LMSC; // LMSs completed for this global iteration
    mapping (uint => bool) public LMSADRC; // LMSs Approval Disarroval completed for this global iteration
    event LMSstarted(uint indexed GI); // Where GI is the global iteration for which local model submission has been started
    event LMSclosed(uint indexed GI); // Where GI is the global iteration for which local model submission has been ended


    constructor (address payable _FLNFTCAddr) {
        FLNFTCAddr = _FLNFTCAddr;
        _pause();
        FLTC fLTC = new FLTC("FLToken","FLT"); 
        FLTCAddr = payable(address(fLTC));
    }

    modifier whenFLNFTminted() {
        require(FLNFTID!=0,"FLNFTX");  
        _;
    }

    modifier whenLMSAccepting() {

        require(FLNFTID!=0,"FLNFTX");
        require(!paused(), "Pausable: paused");
        require(LMSAccepting,"LMSsX"); // LMSsX="LMSubmissions not acceptable currently"
        _;
    }

    modifier whenLMSNotAccepting() {
        require(FLNFTID!=0,"FLNFTX");
        require(!paused(), "Pausable: paused");
        require(!LMSAccepting,"X: LMSs acceptable"); // X: LMSs acceptable="Error: LMSubmissions acceptable currently"
        _;
    }

    modifier onlyOwner() override{
        if(FLNFTID!=0 && owner()!=IFLNFTC(FLNFTCAddr).ownerOf(FLNFTID)){
            _transferOwnership(IFLNFTC(FLNFTCAddr).ownerOf(FLNFTID));
        }
        require(owner() == _msgSender(), "OWNX"); // OWNX: caller is not owner
        _;
    }

    function transferOwnership(address newOwner) public override onlyOwner {
        require(FLNFTID==0,"FLNFTY :TRX"); 
        require(newOwner != address(0), "NOWN0"); //Ownable: new owner is the zero address
        _transferOwnership(newOwner);
    }


    function start_LMSs() public onlyOwner whenLMSNotAccepting{
        LMSAccepting = true;
        if(GI>0){
            require(GIC[GI],"Do GMUpdate"); //Please complete GMupdate first
        }
       
        emit LMSstarted(GI+1); // LocalModelSubmissionStarted
    }

    function close_LMSs() public onlyOwner whenLMSAccepting{ // closeLocalModelSubmission
        LMSAccepting = false;
        emit LMSclosed(GI+1); // LocalModelSubmissionClosed
        LMSC[GI+1]=true;
    }


    function createFLNFT(string memory _tokenURI, string memory _GMipfsHash) public onlyOwner whenPaused{
        require(FLNFTID==0,"FLNFTY"); //FLNFT already minted
        FLNFTID = IFLNFTC(FLNFTCAddr).mintFLNFT(owner(), address(this), _tokenURI, _GMipfsHash);
        tokenURI = _tokenURI;
        GMipfsHash = _GMipfsHash;
        _unpause();
    }
    event LMSubmitted(uint indexed gi, string indexed _LMipfsHash, string indexed _LMURI);

    function submitLocalModel(string memory _LMipfsHash, string memory _LMURI, uint _GI) public  whenLMSAccepting {
        
        if (Validate_LMS( _LMipfsHash,  _LMURI, _GI, msg.sender)){

            Add_LMS( _LMipfsHash,  _LMURI, msg.sender);
            LMipfsHashes[_LMipfsHash] = true;
            LMURIs[_LMipfsHash] = true;
            emit LMSubmitted(_GI,_LMipfsHash,_LMURI);
        }
    }

    function Validate_LMS(string memory _LMipfsHash, string memory _LMURI, uint _gi, address _addroffltrainer) internal view returns (bool){
        require(LMsubmitters[_gi].length < 10, "LMTR"); //Local model submission limit reached
        require(LMSs[GI+1][_addroffltrainer].lmstatus==LMstatus.notexist,"LMY"); // You have already submmitted LM
        require(GI+1==_gi,"LMSs GI X");  // LMSs for this global iteration are not accepted
        require(LMipfsHashes[_LMipfsHash] != true, "_LMipfsHash Y"); // Provided _LMipfsHash already exist
        require(LMURIs[_LMURI] != true, "_LMURI Y"); // Provided _LMURI already exist
        return true;
    }

    function Add_LMS(string memory _LMipfsHash, string memory _LMURI, address _addroffltrainer) internal returns (bool){
        LMsubmitters[GI+1].push(_addroffltrainer);
        LMSs[GI+1][_addroffltrainer]= LM(_LMipfsHash, _LMURI, LMstatus.Submitted);

        return true;
    }

    function Download_LMSx(uint _GI) public view whenLMSNotAccepting returns(address[] memory){
        return LMsubmitters[_GI];
    }

    function Download_LMS(uint _GI, address LM_Submitter) public view whenLMSNotAccepting returns(string memory, string memory, LMstatus ){
        require(LMSs[_GI][LM_Submitter].lmstatus!=LMstatus.notexist,'LMSX');
        return (LMSs[_GI][LM_Submitter].LMipfsHash,LMSs[_GI][LM_Submitter].LMURI,LMSs[_GI][LM_Submitter].lmstatus);
    }


    function ADRLMS( address _LMsubmitter, uint _GI, LMstatus _localModelStatus) public onlyOwner whenLMSNotAccepting returns(bool){
        require(_GI==GI+1,"LMADR GI X"); 
        require(LMSs[_GI][_LMsubmitter].lmstatus==LMstatus.Submitted,'LMSX');
        require(_localModelStatus==LMstatus.Approved || _localModelStatus==LMstatus.Denied,'LMS Status IC'); //incorrect _localModelStatus provided
        LMSs[_GI][_LMsubmitter].lmstatus = _localModelStatus;
        if(_localModelStatus == LMstatus.Approved){
            bool statusminted = IFLTC(FLTCAddr).mintFLToken(_LMsubmitter);
            if(statusminted){
                LMSs[_GI][_LMsubmitter].lmstatus = LMstatus.Rewarded;
            }
        }

        return true;
    }

    function setLMSADRC(uint _GI) public onlyOwner whenLMSNotAccepting{
        require(_GI==GI+1,"GI IC"); // incorrect GI provided
        require(LMSC[_GI],"closeLMS X"); // LMSs not closed
        LMSADRC[_GI]=true;

    }

    event GMupdated(uint indexed gi, string indexed _GMipfsHash, string indexed _tokenURI);
    
    function GMupdate( uint _GI, string memory _tokenURI, string memory _GMipfsHash) public onlyOwner  whenLMSNotAccepting returns(bool){
        require(!GIC[_GI],"GM GI Y"); // GM for this iteration already avaiable!
        require(_GI==GI+1,"GI IC"); // incorrect GI update!
        require(LMSADRC[_GI],"LMSADRC GI X"); //LMSADRC for _GI not completed!
        bool setTokenURIF = IFLNFTC(FLNFTCAddr).setTokenURI(FLNFTID, _tokenURI);
        bool setGMipfsHashF = IFLNFTC(FLNFTCAddr).setGMipfsHash(FLNFTID, _GMipfsHash);
        if(setTokenURIF && setGMipfsHashF){
            GI = GI+1;
            tokenURI = _tokenURI;
            GMipfsHash = _GMipfsHash;
            emit GMupdated( GI,  _GMipfsHash,  _tokenURI);
            GIC[GI]=true;
            return true;
        } 
        else{
            return false;
        }
    }

    function pause() public onlyOwner whenFLNFTminted{
        if(LMSAccepting){
            close_LMSs();
        }
        _pause();
    }

    function unpause() public onlyOwner whenFLNFTminted{
        _unpause();
    }



    receive() external payable {

    }

    fallback() external payable {

    }

    function withdraw() public onlyOwner  {
          (bool sent, ) =  owner().call{value: address(this).balance}("");
          require(sent, "ETH TR X");
    }

    function FLTCwithdraw() public onlyOwner  {
          IFLTC(FLTCAddr).withdraw();
    }

}