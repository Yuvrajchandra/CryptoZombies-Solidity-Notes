// Chapter 8: Working With Structs and Arrays
pragma solidity >=0.5.0 <0.6.0;

contract ZombieFactory {

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    }

    Zombie[] public zombies;

    function createZombie (string memory _name, uint _dna) public {
        zombies.push(Zombie(_name, _dna));
    }

}
