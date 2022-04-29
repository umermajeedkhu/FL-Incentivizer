// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


// Import the openzepplin contracts
import "./Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/security/Pausable.sol";


contract FLTC is ERC20, Ownable, Pausable{

    // owner of FLTokenContract should be FLtaskPublisherContract
    constructor(string memory _name, string memory _symbol) ERC20(_name, _symbol) {
        
    }


    function mintFLToken(address recipient)public whenNotPaused onlyOwner returns(bool){
        _mint(recipient, 1 * 10 ** 18); 
        return true;
    }

    function pause() public onlyOwner{
        _pause();
    }

    function unpause() public onlyOwner{
        _unpause();
    }

    function renounceOwnership() public view override onlyOwner {
        revert("can't renounceOwnership here"); //not possible with this smart contract
    }

    function transferOwnership() public view onlyOwner {
       revert("can't transferOwnership here"); //not possible with this smart contract
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