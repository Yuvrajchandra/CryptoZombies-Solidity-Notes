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
### array.push() Method
 array.push() adds something to the end of the array, so the elements are in the order we added them.
 ```
 uint[] numbers;
numbers.push(5);
numbers.push(10);
numbers.push(15);
// numbers is now equal to [5, 10, 15]
```
### Private / Public Functions
In Solidity, functions are public by default. This means anyone (or any other contract) can call your contract's function and execute its code.  

Obviously this isn't always desirable, and can make your contract vulnerable to attacks. Thus it's good practice to mark your functions as private by default, and then only make public the functions you want to expose to the world.

#### How to declare a private function
```
uint[] numbers;

function _addToArray(uint _number) private {
  numbers.push(_number);
}
```
This means only other functions within our contract will be able to call this function and add to the numbers array.
### Return Values in a function
To return a value from a function, the declaration looks like this:
```
string greeting = "What's up dog";

function sayHello() public returns (string memory) {
  return greeting;
}
```
In Solidity, the function declaration contains the type of the return value (in this case string).
### Function modifiers: view
View functions ensure that they will not modify the state. The view functions are read-only function.
```
function sayHello() public view returns (string memory) {
  return greeting;
}
```
### Function modifiers: pure
The pure functions do not read or modify the state variables, which returns the values only using the parameters passed to the function or local variables present in it.
```
function _multiply(uint a, uint b) private pure returns (uint) {
  return a * b;
}
```
> It may be hard to remember when to mark functions as pure/view. Luckily the Solidity compiler is good about issuing warnings to let you know when you should use one of these modifiers.
### Keccak256
Ethereum has the hash function keccak256 built in, which is a version of SHA3. A hash function basically maps an input into a random 256-bit hexadecimal number. A slight change in the input will cause a large change in the hash. It's useful for many purposes in Ethereum.

** keccak256** expects a single parameter of type **bytes**. This means that we have to "pack" any parameters before calling **keccak256**:
```
//6e91ec6b618bb462a4a6ee5aa2cb0e9cf30f7a052bb467b0ba58b8748c00d2e5
keccak256(abi.encodePacked("aaaab"));
//b1f078126895a1424524de5321b339ab00408010b7cf0e6ed451514981e58aa9
keccak256(abi.encodePacked("aaaac"));
```
> Secure random-number generation in blockchain is a very difficult problem. Our method here is insecure.
### Typecasting
Sometimes you need to convert between data types. Take the following example:
```
uint8 a = 5;
uint b = 6;
// throws an error because a * b returns a uint, not uint8:
uint8 c = a * b;
// we have to typecast b as a uint8 to make it work:
uint8 c = a * uint8(b);
```
In the above, **a * b** returns a **uint**, but we were trying to store it as a **uint8**, which could cause potential problems. By casting it as a **uint8**, it works and the compiler won't throw an error.
### Events
Events are a way for your contract to communicate that something happened on the blockchain to your app front-end, which can be 'listening' for certain events and take action when they happen.  
Example:
```
// declare the event
event IntegersAdded(uint x, uint y, uint result);

function add(uint _x, uint _y) public returns (uint) {
  uint result = _x + _y;
  // fire an event to let the app know the function was called:
  emit IntegersAdded(_x, _y, result);
  return result;
}
```
Your app front-end could then listen for the event. A javascript implementation would look something like:
```
YourContract.IntegersAdded(function(error, result) {
  // do something with result
})
```
### Address Data Type
The Ethereum blockchain is made up of accounts, which you can think of like bank accounts. An account has a balance of Ether (the currency used on the Ethereum blockchain), and you can send and receive Ether payments to other accounts, just like your bank account can wire transfer money to other bank accounts.

Each account has an **address**, which you can think of like a bank account number. It's a unique identifier that points to that account, and it looks like this:
```
0x0cE446255506E92DF41614C46F1d6df9Cc969183
```
### Mapping Data Type
Defining a mapping looks like this:
```
// For a financial app, storing a uint that holds the user's account balance:
mapping (address => uint) public accountBalance;
// Or could be used to store / lookup usernames based on userId
mapping (uint => string) userIdToName;
```
A mapping is essentially a key-value store for storing and looking up data. In the first example, the key is an address and the value is a uint, and in the second example the key is a uint and the value a string.
### msg.sender
In Solidity, there are certain global variables that are available to all functions. One of these is msg.sender, which refers to the address of the person (or smart contract) who called the current function.
> In Solidity, function execution always needs to start with an external caller. A contract will just sit on the blockchain doing nothing until someone calls one of its functions. So there will always be a msg.sender.
Here's an example of using msg.sender and updating a mapping:
```
mapping (address => uint) favoriteNumber;

function setMyNumber(uint _myNumber) public {
  // Update our `favoriteNumber` mapping to store `_myNumber` under `msg.sender`
  favoriteNumber[msg.sender] = _myNumber;
  // ^ The syntax for storing data in a mapping is just like with arrays
}

function whatIsMyNumber() public view returns (uint) {
  // Retrieve the value stored in the sender's address
  // Will be `0` if the sender hasn't called `setMyNumber` yet
  return favoriteNumber[msg.sender];
}
```
### require
Thus require is quite useful for verifying certain conditions that must be true before running a function. The function will throw an error and stop executing if some condition is not true:
```
function sayHiToVitalik(string memory _name) public returns (string memory) {
  // Compares if _name equals "Vitalik". Throws an error and exits if not true.
  // (Side note: Solidity doesn't have native string comparison, so we
  // compare their keccak256 hashes to see if the strings are equal)
  require(keccak256(abi.encodePacked(_name)) == keccak256(abi.encodePacked("Vitalik")));
  // If it's true, proceed with the function:
  return "Hi!";
}
```
If you call this function with sayHiToVitalik("Vitalik"), it will return "Hi!". If you call it with any other input, it will throw an error and not execute.
### Inheritance
```
contract Doge {
  function catchphrase() public returns (string memory) {
    return "So Wow CryptoDoge";
  }
}

contract BabyDoge is Doge {
  function anotherCatchphrase() public returns (string memory) {
    return "Such Moon BabyDoge";
  }
}
```
BabyDoge inherits from Doge. That means if you compile and deploy BabyDoge, it will have access to both catchphrase() and anotherCatchphrase() (and any other public functions we may define on Doge).
### Import
When you have multiple files and you want to import one file into another, Solidity uses the **import** keyword:
```
import "./someothercontract.sol";

contract newContract is SomeOtherContract {

}
```
### Storage vs Memory (Data location)
In Solidity, there are two locations you can store variables — in storage and in memory.  

Storage refers to variables stored permanently on the blockchain. Memory variables are temporary, and are erased between external function calls to your contract. Think of it like your computer's hard disk vs RAM.

Most of the time you don't need to use these keywords because Solidity handles them by default. State variables (variables declared outside of functions) are by default storage and written permanently to the blockchain, while variables declared inside functions are memory and will disappear when the function call ends.  

However, there are times when you do need to use these keywords, namely when dealing with structs and arrays within functions.

