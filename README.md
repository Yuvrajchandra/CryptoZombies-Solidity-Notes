<h1 align="center">CryptoZombies</h1>

![Untitled design (4)](https://user-images.githubusercontent.com/53931942/144187820-a4cc5096-9f88-4978-87bc-e6022279e4f7.png)

This repository contains codes from CryptoZombies (Solidity Tutorial &amp; Etherium Blockchain Programming Course)

CryptoZombies is a free, open source, interactive code school that teaches you to build games on Ethereum. The course is designed for beginners to Solidity and starts off with the absolute basics.  
  
Link to the course: https://cryptozombies.io/en/course/

## Quick Notes from the course:

### Contracts
Solidity's code is encapsulated in contracts. A contract is the fundamental building block of Ethereum applications — all variables and functions belong to a contract, and this will be the starting point of all your projects.
An empty contract named HelloWorld would look like this:
```
contract HelloWorld {

}
```
### Version Pragma
All solidity source code should start with a "version pragma" — a declaration of the version of the Solidity compiler this code should use. This is to prevent issues with future compiler versions potentially introducing changes that would break your code.
```
pragma solidity >=0.5.0 <0.6.0;
````
### State Variables
State variables are permanently stored in contract storage. This means they're written to the Ethereum blockchain. Think of them like writing to a DB.
```
contract Example {
  // This will be stored permanently in the blockchain
  uint myUnsignedInteger = 100;
}
```
### Unsigned Integers: uint
The uint data type is an unsigned integer, meaning its value must be non-negative. There's also an int data type for signed integers.  

In Solidity, uint is actually an alias for uint256, a 256-bit unsigned integer. You can declare uints with less bits — uint8, uint16, uint32, etc.. But in general you want to simply use uint except in specific cases, which we'll talk about in later lessons.
### Math Operations
Math in Solidity is pretty straightforward. The following operations are the same as in most programming languages:

Addition: x + y
Subtraction: x - y,
Multiplication: x * y
Division: x / y
Modulus / remainder: x % y
### Structs
Structs allow you to create more complicated data types that have multiple properties.
```
struct Person {
  uint age;
  string name;
}
```
### Strings
Strings are used for arbitrary-length UTF-8 data. Ex:
```
string greeting = "Hello world!"
```
### Arrays
When you want a collection of something, you can use an array. There are two types of arrays in Solidity: fixed arrays and dynamic arrays:
```
// Array with a fixed length of 2 elements:
uint[2] fixedArray;
// another fixed Array, can contain 5 strings:
string[5] stringArray;
// a dynamic Array - has no fixed size, can keep growing:
uint[] dynamicArray;
```
You can also create an array of structs.
```
Person[] people; // dynamic Array, we can keep adding to it
```
Dynamic array of structs like this can be useful for storing structured data in your contract, kind of like a database.
### Public Arrays
You can declare an array as public, and Solidity will automatically create a getter method for it. The syntax looks like:
```
Person[] public people;
```
Other contracts would then be able to read from, but not write to, this array. So this is a useful pattern for storing public data in your contract.

