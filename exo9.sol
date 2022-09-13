// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

//*** Exercice 9 ***//
// You can store ETH in this contract and redeem them.
contract Vault {
    mapping(address => uint) public balances;

    /// @dev Store ETH in the contract.
    function store() public payable {
        balances[msg.sender]+=msg.value;
    }
    
    /// @dev Redeem your ETH.
    function redeem() public {
        uint _balance = balances[msg.sender];
        balances[msg.sender]=0;
        payable(msg.sender).transfer(_balance);
    }
}