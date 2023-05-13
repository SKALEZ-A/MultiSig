// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Multisig {
    event Deposit(address indexed sender);
    event Submit(uint indexed txId);
    event Approve(address indexed owner, uint indexed txId);
    event Revoke(address indexed owner, uint indexed txId);
    event Execute(uint indexed txId);

    struct Transaction {
        address to;
        uint value;
        bytes data;
        bool executed;
    }

    address[] public owners;
    mapping(address => bool) public isOwner;
    uint public required;

    Transaction[] public transactions;
    mapping(uint => mapping(address => bool)) public approved;

    modifier onlyOwner() {
        require(isOwner[msg.sender], "not owner" );
        _;
    }

    // to confirm that the transaction exists before it can be reverted 
    modifier txExists(uint _txId) {
        require(_txId < transactions.length, "tx does not exists");
        _;
    }

    // to confirm that the transaxtion has not been approved
    modifier notApproved(uint _txId) {
        require(!approved[_txId][msg.sender], "tx already approved");
        _;
    }

    // to confirm that the transaction has not been executed 
    modifier notExecuted(uint _txId) {
        require(!transactions[_txId].executed, "tx already executed");
        _;
    }

    constructor (address[] memory _owners, uint _required) {
        require(_owners.length > 0, "owners required");
        require(_required > 0 && _required <= _owners.length, "invalid required number of owners");

        for(uint i; i < _owners.length; i++ ) {
            address owner = _owners[i];
        }
    }
}