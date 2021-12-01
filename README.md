<h1 align="center">CryptoZombies</h1>

![Untitled design (4)](https://user-images.githubusercontent.com/53931942/144187820-a4cc5096-9f88-4978-87bc-e6022279e4f7.png)

This repository contains codes and notes from CryptoZombies (Solidity Tutorial &amp; Etherium Blockchain Programming Course)

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
### Function Declarations
A function declaration in solidity looks like the following:
```
function eatHamburgers(string memory _name, uint _amount) public {

}
```
This is a function named eatHamburgers that takes 2 parameters: a string and a uint. Note that we're specifying the function visibility as **public**. We're also providing instructions about where the _name variable should be stored- in **memory**. This is required for all reference types such as arrays, structs, mappings, and strings.
  
#### What is a reference type you ask?
Well, there are two ways in which you can pass an argument to a Solidity function:

- **By value**, which means that the Solidity compiler creates a new copy of the parameter's value and passes it to your function. This allows your function to modify the value without worrying that the value of the initial parameter gets changed.
- **By reference**, which means that your function is called with a... reference to the original variable. Thus, if your function changes the value of the variable it receives, the value of the original variable gets changed.
> It's convention (but not required) to start function parameter variable names with an underscore (_) in order to differentiate them from global variables.
### Working With Structs and Arrays
#### Creating New Structs
```
struct Person {
  uint age;
  string name;
}

Person[] public people;
```
Here we are creating a new struct(Person) and defining an array of struct(people).
#### How to create an object of struct and how to push the object to the array
```
// create a New Person:
Person satoshi = Person(172, "Satoshi");

// Add that person to the Array:
people.push(satoshi);
```
In one line of code:
```
people.push(Person(172, "Satoshi"));
```
