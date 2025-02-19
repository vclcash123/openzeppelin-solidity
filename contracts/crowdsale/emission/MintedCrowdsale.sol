// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "https://github.com/vclcash123/openzeppelin-solidity/blob/master/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/vclcash123/openzeppelin-solidity/blob/master/contracts/token/ERC20/MintableToken.sol";


/**
 * @title MintedCrowdsale
 * @dev Extension of Crowdsale contract whose tokens are minted in each purchase.
 * Token ownership should be transferred to MintedCrowdsale for minting.
 */
contract MintedCrowdsale is Crowdsale {

  /**
   * @dev Overrides delivery by minting tokens upon purchase.
   * @param _beneficiary Token purchaser
   * @param _tokenAmount Number of tokens to be minted
   */
  function _deliverTokens(
    address _beneficiary,
    uint256 _tokenAmount
  )
    internal
  {
    require(MintableToken(token).mint(_beneficiary, _tokenAmount));
  }
}
