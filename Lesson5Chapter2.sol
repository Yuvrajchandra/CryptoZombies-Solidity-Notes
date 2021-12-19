pragma solidity >=0.5.0 <0.6.0;

import "./zombieattack.sol";
import "./erc721.sol";

// Declare ERC721 inheritance here
contract ZombieOwnership is ZombieAttack, ERC721 {

}
