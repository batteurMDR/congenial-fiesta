// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

//*** Exercice 11 ***//
// You can store ETH in this contract and redeem them.
contract VaultInvariant {
    mapping(address => uint) public balances;
    uint totalBalance;

    /// @dev Store ETH in the contract.
    function store() public payable {
        balances[msg.sender]+=msg.value;
        totalBalance+=msg.value;
    }
    
    /// @dev Redeem your ETH.
    function redeem() public {
        uint toTranfer = balances[msg.sender];
        payable(msg.sender).transfer(toTranfer);
        balances[msg.sender]=0;
        totalBalance-=toTranfer;
    }
    
    /// @dev Let a user get all funds if an invariant is broken.
    function invariantBroken() public {
        require(totalBalance!=address(this).balance);
        
        payable(msg.sender).transfer(address(this).balance);
    }
    
}