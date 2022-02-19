
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";

contract EKBasic721 is ERC721 {
    
    uint256 private _id;

    constructor (string memory name, string memory symbol) ERC721(name, symbol) {}

    function mint(address to) public {
        _id+=1;
        super._safeMint(to, _id);
    }

    function page(uint256 tokenId, uint8 num) public view returns (address[] memory, uint256) {
        address[] memory rv_owners = new address[](num);
        uint256 i2; 
        for (uint256 i = 0; i < num; i++) {
            i2=i+tokenId;
            rv_owners[i]=ownerOf(i2);
        }
        return (rv_owners, _id);
    }

}
