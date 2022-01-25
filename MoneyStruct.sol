//  SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.4;

contract MoneyStruct {
    struct Payment {
        uint amount;
        uint timestamp;
    }

    struct Balance {
        uint totalBalance;
        uint numPayments;
        mapping(uint => Payment) payments;
    }

    mapping(address => Balance) public balanceReceived;

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function sendMoney() public payable {
        balanceReceived[msg.sender].totalBalance += msg.value; // assigns uint totalBalance value
        Payment memory payment; // reference variable to value-type Payment
        payment = Payment(msg.value, block.timestamp); // amount and timestap assignment
        balanceReceived[msg.sender].payments[balanceReceived[msg.sender].numPayments] = payment; // set payments mapping value in Balance struct
        balanceReceived[msg.sender].numPayments++;
    }

    function withdrawMoney(address payable _to, uint _amount) public {
        require(_amount <= balanceReceived[msg.sender].totalBalance, "Error: Insufficient funds");
        balanceReceived[msg.sender].totalBalance -= _amount;
        _to.transfer(_amount);
    }
        
}