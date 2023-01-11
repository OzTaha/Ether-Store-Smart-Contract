// SPDX-License-Identifier: MIT
 pragma solidity ^0.8.7;
 
 contract FeeCollector { // 0x840c600862166724bD825BB0a0bc0b36552F37Ef
     address public owner;
     uint256 public balance;

     constructor() {
         owner = msg.sender;
     }

     receive() payable external {
         // balance = balance + msg.value
         balance += msg.value; 
     }
         // This function sends ETH to given address
     function withdraw(uint amount, address payable destAddr) public {
         // Throws error if msg.sender is not owner
         require(msg.sender == owner, "Only owner can withdraw");
         // Throws error if amount > balance of the account
         require(amount <= balance, "Insufficient funds");
         // After being sure about the function we are sending eth to the given addres
         destAddr.transfer(amount);
         // send funds to given address
         balance -= amount;
     }
 }