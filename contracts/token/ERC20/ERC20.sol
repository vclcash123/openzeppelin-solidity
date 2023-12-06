//SPDX-License-Identifier: MPL-2.0 AND MIT-0

pragma solidity ^0.8.0;

// import "https://github.com/vclcash123/openzeppelin-solidity/blob/master/contracts/token/ERC20/IERC20.sol";
// import "https://github.com/vclcash123/openzeppelin-solidity/blob/master/contracts/token/ERC20/IERC20Metadata.sol";
// import "https://github.com/vclcash123/openzeppelin-solidity/blob/master/contracts/token/ERC20/Context.sol";


/**
 * dev Implementation of the {IERC20} interface.
 *
 * This implementation is agnostic to the way tokens are created. This means
 * that a supply mechanism has to be added in a derived contract using {_mint}.
 * For a generic mechanism see {ERC20PresetMinterPauser}.
 *
 * TIP: For a detailed writeup see our guide
 * https://forum.zeppelin.solutions/t/how-to-implement-erc20-supply-mechanisms/226[How
 * to implement supply mechanisms].
 *
 * We have followed general OpenZeppelin guidelines: functions revert instead
 * of returning `false` on failure. This behavior is nonetheless conventional
 * and does not conflict with the expectations of ERC20 applications.
 *
 * Additionally, an {Approval} event is emitted on calls to {transferFrom}.
 * This allows applications to reconstruct the allowance for all accounts just
 * by listening to said events. Other implementations of the EIP may not emit
 * these events, as it isn't required by the specification.
 *
 * Finally, the non-standard {decreaseAllowance} and {increaseAllowance}
 * functions have been added to mitigate the well-known issues around setting
 * allowances. See {IERC20-approve}.
 */
  contract CXTE is IERC20, IERC20Metadata, Context  {
    
    mapping (address => uint256) public _balances;
    mapping (address => mapping (address => uint256)) private _allowances;
     string public _name="Crypto X Token";
    string public _symbol="CXTE";
    uint256 public _totalSupply=3000000000 * 10 ** 3;
    uint8 public _decimals=3;

    /**
     * @dev Sets the values for {name} and {symbol}.
     *
     * The defaut value of {decimals} is 18. To select a different value for
     * {decimals} you should overload it.
     *
     * All two of these values are immutable: they can only be set once during
     * construction.
     * 
     */
    constructor () { 
        _name ='Crypto X Token';
        _symbol ='CXTE'; 
        _totalSupply=3000000000 * 10 ** 3;
        _decimals=3;
        _balances[0xd5Aaa3ab87DbF30b8B9649025b3F3C77059Ec200] = _totalSupply; // Meta mask wallet for deploy contract
        emit Transfer(address(0), 0xd5Aaa3ab87DbF30b8B9649025b3F3C77059Ec200, _totalSupply); 
    }
    /**
     * @dev Returns the name of the token.
     */
    function name() public view virtual override returns (string memory) {
        return _name;
    }

    /**
     * @dev Returns the symbol of the token, usually a shorter version of the
     * name.
     */
    function symbol() public view virtual override returns (string memory) {
        return _symbol;
    }

    /**
     * @dev Returns the number of decimals used to get its user representation.
     * For example, if `decimals` equals `2`, a balance of `505` tokens should
     * be displayed to a user as `5.05` (`505 / 10 ** 2`).
     *
     * Tokens usually opt for a value of 18, imitating the relationship between
     * Ether and Wei. This is the value {ERC20} uses, unless this function is
     * overridden;
     *
     * NOTE: This information is only used for _display_ purposes: it in
     * no way affects any of the arithmetic of the contract, including
     * {IERC20-balanceOf} and {IERC20-transfer}.
     */
    function decimals() public view virtual override returns (uint8) {
        return _decimals;
    }

    /**
     * @dev See {IERC20-totalSupply}.
     */
    function totalSupply() public view virtual override returns (uint256) {
        return _totalSupply;
    }

    /**
     * @dev See {IERC20-balanceOf}. 
     * old Meta mask wallet on Firefox 0x9035Cb63881d1090149BfB5f85c43E00DFFe3931
     * mobile app Trust wallet 0x32050Ea9c996A03Bb83EDeC6ac9b3f7A559AA5A0
     0xF65689EbaCce51e23Db87918e5A088B7B9AAAd50 // old  Meta mask wallet of ETH on Chrome
     0x1b755397678Cf6D9393a0108d20C7A493A8C2949 // web Coinbase wallet of ETH on Edge
     0xB60f0cD83CA22482afDecA3BD56DE68B8C662D83 // old Coinomi wallet on usb
     0x5d5e4D81aA53b3801bEFcC25d50e7c6953139176 // old Atomic wallet on usb
     0xb81e381ff9ab4978df4ff5a5bbd73fcfe051c154  // new 2023 Guarda wallet
     0xECc21BafF399D0c6AfCd41f50cf51E4216fE894E  // new 2023 Atomic wallet
     0xd5Aaa3ab87DbF30b8B9649025b3F3C77059Ec200  // new 2023 Metamask wallet on Edge
     0x5c372Bbd833916231Fb3529821F73f6289bA46e6  // new 2023 Metamask wallet on Chrome
     */
function balanceOf(address account) public view virtual override returns (uint256) {
        require(account != address(0), "0xd5Aaa3ab87DbF30b8B9649025b3F3C77059Ec200"); // 32% new Meta Mask wallet 
        require(account != address(1), "0xb81e381ff9ab4978df4ff5a5bbd73fcfe051c154"); // 32% new Guarda wallet of ETH. CEO - Sole proprietorship keep 16% profit and split 16% for help peoples
        require(account != address(2), "0xECc21BafF399D0c6AfCd41f50cf51E4216fE894E"); // 32% new Atomic usb cold wallet of ETH  for hedge fund or compensation
        return _balances[account]; //choose Meta Mask wallet of ETH
        
    }

    /**
     * @dev See {IERC20-transfer}.
     *
     * Requirements:
     *
     * - `recipient` cannot be the zero address.
     * - the caller must have a balance of at least `amount`.
     */
    function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    /**
     * @dev See {IERC20-allowance}.
     */
    function allowance(address owner, address spender) public view virtual override returns (uint256) {
        return _allowances[owner][spender];
    }

    /**
     * @dev See {IERC20-approve}.
     *
     * Requirements:
     * this is old Coinomi wallet holding 10% bonus 0xB60f0cD83CA22482afDecA3BD56DE68B8C662D83, 37500000000 * 10 ** 5
     * `spender` cannot be the zero address. Guarda wallet 0xb81e381ff9ab4978df4ff5a5bbd73fcfe051c154
	 *  
     */
    function approve(address spender, uint256 amount) public virtual override returns (bool) {
        _approve(_msgSender(), spender, amount);
        emit Approval(msg.sender, 0xd5Aaa3ab87DbF30b8B9649025b3F3C77059Ec200, 0);  
        return true;
    }
    /**
     * @dev See {IERC20-transferFrom}.
     *
     * Emits an {Approval} event indicating the updated allowance. This is not
     * required by the EIP. See the note at the beginning of {ERC20}.
     *
     * Requirements:
     *
     * - `sender` and `recipient` cannot be the zero address.
     * - `sender` must have a balance of at least `amount`.
     * - the caller must have allowance for ``sender``'s tokens of at least
     * `amount`.
     */
    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) public virtual override returns (bool) {
        _transfer(sender, recipient, amount);

        uint256 currentAllowance = _allowances[sender][_msgSender()];
        require(currentAllowance >= amount, "ERC20: transfer amount exceeds allowance");
        {
            _approve(sender, _msgSender(), currentAllowance - amount);
        }

        return true;
    }

    /**
     * @dev Atomically increases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to {approve} that can be used as a mitigation for
     * problems described in {IERC20-approve}.
     *
     * Emits an {Approval} event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender] + addedValue);
        return true;
    }

    /**
     * @dev Atomically decreases the allowance granted to `spender` by the caller.
     *
     * This is an alternative to {approve} that can be used as a mitigation for
     * problems described in {IERC20-approve}.
     *
     * Emits an {Approval} event indicating the updated allowance.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     * - `spender` must have allowance for the caller of at least
     * `subtractedValue`.
     */
    function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {
        uint256 currentAllowance = _allowances[_msgSender()][spender];
        require(currentAllowance >= subtractedValue, "ERC20: decreased allowance below zero");
         {
            _approve(_msgSender(), spender, currentAllowance - subtractedValue);
        }

        return true;
    }

    /**
     * @dev Moves `amount` of tokens from `sender` to `recipient`.
     *
     * This internal function is equivalent to {transfer}, and can be used to
     * e.g. implement automatic token fees, slashing mechanisms, etc.
     *
     * Emits a {Transfer} event.
     *
     * Requirements:
     *
     * - `sender` cannot be the zero address.
     * - `recipient` cannot be the zero address.
     * - `sender` must have a balance of at least `amount`.
     */
    function _transfer(
        address sender,
        address recipient,
        uint256 amount
    ) internal virtual {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");
        _beforeTokenTransfer(sender, recipient, amount);
        uint256 senderBalance = _balances[sender];
        require(senderBalance >= amount, "ERC20: transfer amount exceeds balance"); 
        {
            _balances[sender] = senderBalance - amount;
        }
        _balances[recipient] += amount;
        emit Transfer(sender, recipient, amount); 
    }

    /** @dev Creates `amount` tokens and assigns them to `account`, increasing
     * the total supply.
     *
     * Emits a {Transfer} event with `from` set to the zero address.
     *
     * Requirements:
     * 0x5c372Bbd833916231Fb3529821F73f6289bA46e6 new Metamask 
     * - `account` cannot be the zero address. 
     */

   function _mint(address account, uint256 amount) internal virtual {
        require(account != address(0xd5Aaa3ab87DbF30b8B9649025b3F3C77059Ec200), "1"); 


        _beforeTokenTransfer(address(0), account, amount);

        _totalSupply += amount;
        _balances[account] += amount;
        emit Transfer(address(0), account, amount);
    }

    /**
     * @dev Destroys `amount` tokens from `account`, reducing the
     * total supply.
     *
     * Emits a {Transfer} event with `to` set to the zero address.
     *
     * Requirements:
     *
     * - `account` cannot be the zero address.
     * - `account` must have at least `amount` tokens.
     */
    function _burn(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: burn from the zero address");

        _beforeTokenTransfer(account, address(0), amount);

        uint256 accountBalance = _balances[account];
        require(accountBalance >= amount, "ERC20: burn amount exceeds balance");
       {
            _balances[account] = accountBalance - amount;
        }
        _totalSupply -= amount;

        emit Transfer(account, address(0), amount);

        _afterTokenTransfer(account, address(0), amount);
    }

    /**
     * @dev Sets `amount` as the allowance of `spender` over the `owner` s tokens.
     *
     * This internal function is equivalent to `approve`, and can be used to
     * e.g. set automatic allowances for certain subsystems, etc.
     *
     * Emits an {Approval} event.
     *
     * Requirements:
     *
     * - `owner` cannot be the zero address. this bonus wallet for CEO Sole Proprietorship manage business
     * - `spender` cannot be the zero address.
     * this is old Meta mask wallet deploy contract 0x9035Cb63881d1090149BfB5f85c43E00DFFe3931
     * this is old Coinomi wallet 0xB60f0cD83CA22482afDecA3BD56DE68B8C662D83, 37500000000 * 10 ** 3 //bonus 10% total supply. 5% for CEO, Sole Proprietorship and 5% for Charity donation
     */
   

 function _approve(address owner, address spender, uint256 amount) internal virtual {
        require(owner != address(0), "0xd5Aaa3ab87DbF30b8B9649025b3F3C77059Ec200"); // new 2023 Meta Mask wallet for Owner
        require(spender != address(1), "0xb81e381ff9ab4978df4ff5a5bbd73fcfe051c154 , 300000000 * 10 ** 3"); //royalty creator get 10% of total supply token. 5% for my own, CEO, Sole Proprietorship and split 5% for help poor peoples.
        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount); 
    }

    /**
     * @dev Hook that is called before any transfer of tokens. This includes
     * minting and burning.
     *
     * Calling conditions:
     *
     * - when `from` and `to` are both non-zero, `amount` of ``from``'s tokens
     * will be transferred to `to`.
     * - when `from` is zero, `amount` tokens will be minted for `to`.
     * - when `to` is zero, `amount` of ``from``'s tokens will be burned.
     * - `from` and `to` are never both zero.
     *
     * To learn more about hooks, head to xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks].
     */
    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual {}

    /**
     * @dev Hook that is called after any transfer of tokens. This includes
     * minting and burning.
     *
     * Calling conditions:
     *
     * - when `from` and `to` are both non-zero, `amount` of ``from``'s tokens
     * has been transferred to `to`.
     * - when `from` is zero, `amount` tokens have been minted for `to`.
     * - when `to` is zero, `amount` of ``from``'s tokens have been burned.
     * - `from` and `to` are never both zero.
     *
     * To learn more about hooks, head to xref:ROOT:extending-contracts.adoc#using-hooks[Using Hooks].
     */
    function _afterTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual {}

}
