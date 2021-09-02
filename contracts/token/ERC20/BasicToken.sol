// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.7;

import "https://github.com/vclcash123/openzeppelin-solidity/blob/patch-2/contracts/token/ERC20/ERC20.sol";
import "https://github.com/vclcash123/openzeppelin-solidity/blob/patch-2/contracts/token/ERC20/IERC20.sol";
import "https://github.com/vclcash123/openzeppelin-solidity/blob/patch-2/contracts/token/ERC20/IERC20Metadata.sol";
import "https://github.com/vclcash123/openzeppelin-solidity/blob/patch-2/contracts/token/ERC20/Context.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";
import "https://github.com/vclcash123/openzeppelin-solidity/blob/patch-2/contracts/token/ERC20/ERC20Basic.sol";

contract BasicToken is ERC20Basic {
  /* *This creates an array with all balancesOf */
  mapping(address => uint256) private _balances;
  mapping(address => mapping(address => uint256)) private _allowances;
 
 
   string private _name;
    string private _symbol;
    uint8 public _decimals;
    uint256 private _totalSupply;
 
  event Transfer(address indexed from, address indexed to, uint256 value);
 
  /**
     * @dev Sets the values for {name} and {symbol}.
     *
     * The default value of {decimals} is 18. To select a different value for
     * {decimals} you should overload it.
     *
     * All two of these values are immutable: they can only be set once during
     * construction.
     */
    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }
 
 
  /**
  * dev total number of tokens in existence
  */
  function totalSupply() public view returns (uint256) {
    return _totalSupply;
  }

 

/**
   * @dev Transfer tokens from one address to another
   * @param _from address The address which you want to send tokens from
   * @param _to address The address which you want to transfer to
   * @param _value uint256 the amount of tokens to be transferred
   */
  function transferFrom(
    address _from,
    address _to,
    uint256 _value
  )
    public returns (bool){
    require(_to != address(0));
  
    emit Transfer(_from, _to, _value);
    return true;
  }
 
   /**
     * @dev See {IERC20-balanceOf}.
     */
    function balanceOf(address owner) public view returns (uint256) {
        return _balances[owner];
    }

  }
