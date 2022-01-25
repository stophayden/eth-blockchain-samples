// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.1;

contract MoneyTransfer{
    uint public smartBalance;

    function receiveMoney() public payable {
        smartBalance += msg.value;
    }

    function withdrawMoney() public {
    address payable _to = payable(msg.sender);
    _to.transfer(getBalance());
    }

    function withdrawMoneyTo(address payable _to) public{
        _to.transfer(getBalance());
    }
    
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

}