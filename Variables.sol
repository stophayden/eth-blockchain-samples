// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.1;

contract WorkingWithVariables {
    uint256 public myUint;
    uint8 public myUint8;
    bool public myBool;
    address public myAddress;

    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }

    function setMyBool(bool _myBool) public {
        myBool = _myBool;
    }

    function incUint8() public {
        myUint8++;
    }

    function decUint8() public {
        myUint8--;
    }

    function setAddress(address _address) public {
        myAddress = _address;
    }

    function getBalanceOfAddress() public view returns (uint){
        return myAddress.balance;
    }

    string public myString = 'hello world';

    function setMyString(string memory _myString) public {
        myString = _myString;
    }

    // end smart contract
}