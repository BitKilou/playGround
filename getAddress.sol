// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
pragma abicoder v2;

    //@dev small contract to query the balance of a specificly known address.

contract getBalanceOf {
    
    //@notice setting an event to get the address to check 
    event getter(address _toSpy);
    
       mapping(address => uint) balance;
    
       address public addressOwner;
       
       //@notice inputting the address from which we want the balance
      function setAddress(address _addressOwner) public {
          addressOwner = _addressOwner;
          emit getter(_addressOwner);
      }
      
      //@notice displaying the balance of the address we want to query
      function getBalance() public view returns(uint) {
          return addressOwner.balance;
      }
    
}