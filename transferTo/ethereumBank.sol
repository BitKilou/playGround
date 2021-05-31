// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
pragma abicoder v2;

   //@dev Small contract using a Smart contract to "transfer funds" more like a Bank. 
   // Since we do not send directly our funds to a person but to a "bank"
   // Here security is low, no modifier onlyOwner for example etc..

contract transferETH {
    
    mapping(address => uint) balance;
    
    //@notice creation of my events
    event depositedFunds(address from, uint amount);
    event fundsWithdrawn(address withdrawnFrom, uint amount);
    
    //@notice this deposit function is opened to any address, we initiate our balance[msg.sender] to keep track of his balance
   function deposit() public payable {
       balance[msg.sender] += msg.value;
       emit depositedFunds(msg.sender, msg.value);
   }
  
  
   //@notice we implemented the require, to make sure nobody can withdraw more then what they have put in the contract
   function withdraw(uint _amount) public payable {
       require(balance[msg.sender] >= _amount);
       payable(msg.sender).transfer(_amount);
       balance[msg.sender] -= _amount;
       emit fundsWithdrawn(msg.sender, msg.value);
   }
   
   
   function getBalanceOf() public view returns(uint) {
       return balance[msg.sender];
   }
   
   //@notice helper to check the current contract balance.
   function getContractBalance() public view returns(uint) {
       return address(this).balance;
   }
   
}