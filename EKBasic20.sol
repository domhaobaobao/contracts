
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract EKBasic20 is ERC20, Ownable {
    
    constructor (string memory name, string memory symbol) ERC20(name, symbol) {}

    function mint(address account, uint256 amount) public onlyOwner {
        super._mint(account, amount);
    }

    function burn(address account, uint256 amount) public onlyOwner {
        super._burn(account, amount);
    }

    function fetch(address[] memory accounts) public view returns (uint256[] memory balances) {
        uint[] memory rv_balances = new uint256[](accounts.length); 
        for (uint i = 0; i < accounts.length; i++) {
            rv_balances[i]=balanceOf(accounts[i]);
        }
        return (rv_balances);
    }

}
