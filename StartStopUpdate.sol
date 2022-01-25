// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.1;

contract StartStopUpdate {
    address owner;
    bool public paused;
    uint256 public balance;

    constructor() {
        owner = msg.sender;
    }

    function receiveMoney() public payable {
        balance += msg.value;
    }
    
    function withdrawMoneyTo(address payable _to) public {
        // require(msg.sender == owner, "Error: Only this contract owner can transfer funds from this acccount");
        setPaused();
        require(paused == true);
        _to.transfer(getMsgSenderBalance());
    }

    function getMsgSenderBalance() public view returns (uint) {
        return address(this).balance;
    }

    function setPaused() private  {
        require(msg.sender == owner, "Error: Only this contract owner can transfer funds from this acccount. This smart contract has been paused.");
        paused = true;
    }

}