// SPDX-License-Identifier: MIT License Modern Variant

pragma solidity ^0.8.7;

/**
 * title ERC20Basic
 * dev Simpler version of ERC20 interface
 * dev see https://github.com/ethereum/EIPs/issues/179
 */
contract ERC20Basic {
  function totalSupply() public view returns (uint256);
  function balanceOf(address who) public view returns (uint256);
  function transfer(address to, uint256 value) public returns (bool);
  event Transfer(address indexed from, address indexed to, uint256 value);
}
© 2021 GitHub, Inc.
