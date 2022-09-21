pragma solidity ^0.5.16;

import "./ERC20TokenNotMinable.sol";

contract VoteCoin is ERC20Token {

  constructor() public {
    _name = "Dservice Vote Coin";
    _symbol = "VOTE";
    _decimals = 6;
    _totalSupply = 102400000 * (10 ** 6);
    _balances[msg.sender] = _totalSupply;

    emit Transfer(address(0), msg.sender, _totalSupply);
  }
}