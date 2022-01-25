//  SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.4;

contract MoneyMapping { 
    mapping(address => uint) public accBalance;

    function walletBalance() public view returns (uint) {
        return accBalance[msg.sender];
    }

    function investBalance() public view returns (uint) {
        return address(this).balance;
    }

    function receiveMoney() public payable {
        // sends money to smart contract from 'msg.sender'
        accBalance[msg.sender] += msg.value;

    }

    function withdrawMoneyTo(address payable _to, uint _amt) public{
        require(_amt <= accBalance[msg.sender], "Broke funds.");
        accBalance[msg.sender] -= _amt;
        _to.transfer(_amt);
    }

    function withdrawALLMoneyTo(address payable _to) public  {
        uint availableFunds = accBalance[msg.sender];
        accBalance[msg.sender] = 0;
        _to.transfer(availableFunds);
    }
}