// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "https://github.com/vclcash123/openzeppelin-solidity/blob/patch-2/contracts/token/ERC20/IERC20.sol";
import "https://github.com/vclcash123/openzeppelin-solidity/blob/patch-2/contracts/token/ERC20/IERC20Metadata.sol";
import "https://github.com/vclcash123/openzeppelin-solidity/blob/patch-2/contracts/token/ERC20/Context.sol";

/**
 * @title ERC20 interface
 * @dev see https://github.com/ethereum/EIPs/issues/20
 */
contract ERC20 is ERC20Basic {
  function allowance(address owner, address spender)
    public view returns (uint256);

  function transferFrom(address from, address to, uint256 value)
    public returns (bool);

  function approve(address spender, uint256 value) public returns (bool);
  event Approval(
    address indexed owner,
    address indexed spender,
    uint256 value
  );
}
