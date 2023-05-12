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
}