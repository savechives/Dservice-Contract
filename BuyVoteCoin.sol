pragma solidity ^0.5.16;

import "./common/IERC20.sol";
import "./common/Ownable.sol";
import "./common/SafeMath.sol";

contract BuyVote is Ownable {
    using SafeMath for uint256;
    //vote coin contract
    address public voteCoinAddress =   0xebBA921554901aBc495Bf4C9f5E8F1C1c98078d9;

    IERC20 voteCoinContract = IERC20(voteCoinAddress);

    uint256 public price = 100000000; // Wei/VOTE coin

    // min VOTE quantity to buy in one order
    uint256 public minQty = 500000000;

    // Event for buy function
    event Buy(
        address indexed user,
        uint256 indexed amount,
        uint256 indexed value
    );

    constructor() public {

    }

    // make the contract payable
    function () payable external {}

    function setPrice(uint256 _price) public onlyOwner returns(bool) {
        price = _price;
        return true;
    }

    function setMinQty(uint256 _qty) public onlyOwner returns(bool) {
        minQty = _qty;
        return true;
    }

    function buy() payable public returns(bool) {
        require(msg.value >= minQty.mul(price), "The Value sent is insuffient for min quantity in one order");
        // count how many VOTE can be bought
        uint256 _amount = msg.value.div(price);
        // transfer to msg.sender
        voteCoinContract.transfer(msg.sender, _amount);
        // emit buy event
        emit Buy(msg.sender, _amount, msg.value);

        return true;
    }

    function withdraw(uint256 _amount) public onlyOwner returns(bool) {

        require(address(this).balance > _amount, 'Insufficient balance');

        msg.sender.transfer(_amount);
    }
}