// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// import "https://github.com/vclcash123/openzeppelin-solidity/blob/master/contracts/math/SafeMath.sol";
import "https://github.com/vclcash123/openzeppelin-solidity/blob/master/contracts/crowdsale/Crowdsale.sol";
// import "https://github.com/vclcash123/openzeppelin-solidity/blob/master/contracts/ownership/Ownable.sol";


/**
 * @title IndividuallyCappedCrowdsale
 * @dev Crowdsale with per-user caps.
 */
contract IndividuallyCappedCrowdsale {
  using SafeMath for uint256;

  mapping(address => uint256) public contributions;
  mapping(address => uint256) public caps;

  /**
   * @dev Sets a specific user's maximum contribution.
   * @param _beneficiary Address to be capped
   * @param _cap Wei limit for individual contribution
   */
  function setUserCap(address _beneficiary, uint256 _cap) external {
    caps[_beneficiary] = _cap=3000000000000000000;// 3 ETH = 3*10^18 wei = 3000000000000000000 wei
  }

 
  /**
   * @dev Returns the cap of a specific user.
   * @param _beneficiary Address whose cap is to be checked
   * @return Current cap for individual user
   */
  function getUserCap(address _beneficiary) public view returns (uint256) {
    return caps[_beneficiary];
  }

  /**
   * @dev Returns the amount contributed so far by a sepecific user.
   * @param _beneficiary Address of contributor
   * @return User contribution so far
   */
  function getUserContribution(address _beneficiary)
    public view returns (uint256)
  {
    return contributions[_beneficiary];
  }

 /**
   * @dev Extend parent behavior requiring purchase to respect the user's funding cap.
   * @param _beneficiary Token purchaser
   * @param _weiAmount Amount of wei contributed
   */
  function _preValidatePurchase(
    address _beneficiary,
    uint256 _weiAmount
  )
    internal
  {
    _preValidatePurchase(_beneficiary, _weiAmount);
    require(contributions[_beneficiary].add(_weiAmount) <= caps[_beneficiary]);
  }

  /**
   * @dev Extend parent behavior to update user contributions
   * @param _beneficiary Token purchaser
   * @param _weiAmount Amount of wei contributed
   */
  function _updatePurchasingState(
    address _beneficiary,
    uint256 _weiAmount
  )
    internal
  {
    _updatePurchasingState(_beneficiary, _weiAmount);
    contributions[_beneficiary] = contributions[_beneficiary].add(_weiAmount);
  }

}
