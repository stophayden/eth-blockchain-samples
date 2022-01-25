// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.1;

contract IntegerExample{
    address public userAddress;
    uint8 public deployCount;
    bool public deployed;

    function setMyAddress(address _userAddress) public {
        deployCount++;
        deployed = !deployed;
        userAddress = _userAddress;
    }

    function getAddressBalance() public view returns (uint) {
        return userAddress.balance;
    }
} 