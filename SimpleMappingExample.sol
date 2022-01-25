//  SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.4;

contract SimplemappingExample {
    mapping (uint => bool) public myMapping;
    mapping (address => bool) public myAddressMapping;
    uint256 public transferMoneyAmt;
    address public toAddress;

    function setValue(uint _index) public {
        myMapping[_index] = true;
    }

    function setAddressToTrue() public {
        myAddressMapping[msg.sender] = true;
    }

    function receiveMoney() public payable {
        transferMoneyAmt += msg.value;
    }

    function withdrawMoneyTo(address payable _to) public {

    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}