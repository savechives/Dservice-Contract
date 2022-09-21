pragma solidity ^0.5.16;

import "./ERC20TokenNotMinable.sol";

contract GUSD is ERC20Token {

  constructor() public {
    _name = "USD in Goerli";
    _symbol = "gUSD";
    _decimals = 6;
    _totalSupply = 1024000000 * (10 ** 6);
    _balances[msg.sender] = _totalSupply;

    emit Transfer(address(0), msg.sender, _totalSupply);
  }
}