<h1 align="center">CryptoZombies</h1>

![Untitled design (4)](https://user-images.githubusercontent.com/53931942/144187820-a4cc5096-9f88-4978-87bc-e6022279e4f7.png)

This repository contains codes and notes from CryptoZombies (Solidity Tutorial &amp; Etherium Blockchain Programming Course)

CryptoZombies is a free, open source, interactive code school that teaches you to build games on Ethereum. The course is designed for beginners to Solidity and starts off with the absolute basics.  
  
Link to the course: https://cryptozombies.io/en/course/

# Table of Contents
- [Contracts](#contracts)
- [Version Pragma](#version-pragma)
- [State Variables](#state-variables)
- [Unsigned Integers: uint](#unsigned-integers--uint)
- [Math Operations](#math-operations)
- [Structs](#structs)
- [Strings](#strings)
- [Arrays](#arrays)
- [Public Arrays](#public-arrays)
- [Function Declarations](#function-declarations)
  * [What is a reference type you ask?](#what-is-a-reference-type-you-ask-)
- [Working With Structs and Arrays](#working-with-structs-and-arrays)
  * [Creating New Structs](#creating-new-structs)
  * [How to create an object of struct and how to push the object to the array](#how-to-create-an-object-of-struct-and-how-to-push-the-object-to-the-array)
- [array.push() Method](#arraypush---method)
- [Private / Public Functions](#private---public-functions)
  * [How to declare a private function](#how-to-declare-a-private-function)
- [Return Values in a function](#return-values-in-a-function)
- [Function modifiers: view](#function-modifiers--view)
- [Function modifiers: pure](#function-modifiers--pure)
- [Keccak256](#keccak256)
- [Typecasting](#typecasting)
- [Events](#events)
- [Address Data Type](#address-data-type)
- [Mapping Data Type](#mapping-data-type)
- [msg.sender](#msgsender)
- [require](#require)
- [Inheritance](#inheritance)
- [Import](#import)
- [Storage vs Memory (Data location)](#storage-vs-memory--data-location-)
- [Internal and External](#internal-and-external)
- [Interacting with other contracts](#interacting-with-other-contracts)
- [Handling Multiple Return Values](#handling-multiple-return-values)
- [If statements](#if-statements)
- [Immutability of Contracts](#immutability-of-contracts)
- [Ownable Contracts](#ownable-contracts)
  * [Constructors](#constructors)
  * [Function Modifiers](#function-modifiers)
- [Function Modifiers](#function-modifiers-1)
- [Gas — the fuel Ethereum DApps run on](#gas---the-fuel-ethereum-dapps-run-on)
- [Why is gas necessary?](#why-is-gas-necessary-)
- [Time units](#time-units)
- [Passing structs as arguments](#passing-structs-as-arguments)
- [Function modifiers with arguments](#function-modifiers-with-arguments)
- [Saving Gas With 'View' Functions](#saving-gas-with--view--functions)
- [Storage is Expensive](#storage-is-expensive)
- [Declaring arrays in memory](#declaring-arrays-in-memory)
- [For Loops](#for-loops)

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

**keccak256** expects a single parameter of type **bytes**. This means that we have to "pack" any parameters before calling **keccak256**:
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
### Internal and External
In addition to public and private, Solidity has two more types of visibility for functions: internal and external.  

**internal** is the same as **private**, except that it's also accessible to contracts that inherit from this contract. 

**external** is similar to **public**, except that these functions can ONLY be called outside the contract — they can't be called by other functions inside that contract. 
### Interacting with other contracts
For our contract to talk to another contract on the blockchain that we don't own, first we need to define an **interface**.

Let's look at a simple example. Say there was a contract on the blockchain that looked like this:
```
contract LuckyNumber {
  mapping(address => uint) numbers;

  function setNum(uint _num) public {
    numbers[msg.sender] = _num;
  }

  function getNum(address _myAddress) public view returns (uint) {
    return numbers[_myAddress];
  }
}
```
This would be a simple contract where anyone could store their lucky number, and it will be associated with their Ethereum address. Then anyone else could look up that person's lucky number using their address.

Now let's say we had an external contract that wanted to read the data in this contract using the getNum function.

First we'd have to define an interface of the LuckyNumber contract:
```
interface NumberInterface {
  function getNum(address _myAddress) public view returns (uint);
}
```
Notice that this looks like defining a contract, with a few differences. For one, we're only declaring the functions we want to interact with — in this case getNum — and we don't mention any of the other functions or state variables.

Secondly, we're not defining the function bodies. Instead of curly braces ({ and }), we're simply ending the function declaration with a semi-colon (;).

So it kind of looks like a contract skeleton. This is how the compiler knows it's an interface.

By including this interface in our dapp's code our contract knows what the other contract's functions look like, how to call them, and what sort of response to expect.

After defining the interface, we can use it in a contract as follows:
```
contract MyContract {
  address NumberInterfaceAddress = 0xab38... 
  // ^ The address of the FavoriteNumber contract on Ethereum
  NumberInterface numberContract = NumberInterface(NumberInterfaceAddress);
  // Now `numberContract` is pointing to the other contract

  function someFunction() public {
    // Now we can call `getNum` from that contract:
    uint num = numberContract.getNum(msg.sender);
    // ...and do something with `num` here
  }
}
```
In this way, your contract can interact with any other contract on the Ethereum blockchain, as long they expose those functions as **public** or **external**.
### Handling Multiple Return Values
```
function multipleReturns() internal returns(uint a, uint b, uint c) {
  return (1, 2, 3);
}

function processMultipleReturns() external {
  uint a;
  uint b;
  uint c;
  // This is how you do multiple assignment:
  (a, b, c) = multipleReturns();
}

// Or if we only cared about one of the values:
function getLastReturnValue() external {
  uint c;
  // We can just leave the other fields blank:
  (,,c) = multipleReturns();
}
```
### If statements
If statements in Solidity look just like javascript:
```
function eatBLT(string memory sandwich) public {
  // Remember with strings, we have to compare their keccak256 hashes
  // to check equality
  if (keccak256(abi.encodePacked(sandwich)) == keccak256(abi.encodePacked("BLT"))) {
    eat();
  }
}
```
### Immutability of Contracts
After you deploy a contract to Ethereum, it’s immutable, which means that it can never be modified or updated again.

The initial code you deploy to a contract is there to stay, permanently, on the blockchain. This is one reason security is such a huge concern in Solidity. If there's a flaw in your contract code, there's no way for you to patch it later. You would have to tell your users to start using a different smart contract address that has the fix.

But this is also a feature of smart contracts. The code is law. If you read the code of a smart contract and verify it, you can be sure that every time you call a function it's going to do exactly what the code says it will do. No one can later change that function and give you unexpected results.
### Ownable Contracts
You can make contracts Ownable — meaning they have an owner (you) who has special privileges.

Below is the Ownable contract taken from the OpenZeppelin Solidity library. OpenZeppelin is a library of secure and community-vetted smart contracts that you can use in your own DApps.
```
/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {
  address private _owner;

  event OwnershipTransferred(
    address indexed previousOwner,
    address indexed newOwner
  );

  /**
   * @dev The Ownable constructor sets the original `owner` of the contract to the sender
   * account.
   */
  constructor() internal {
    _owner = msg.sender;
    emit OwnershipTransferred(address(0), _owner);
  }

  /**
   * @return the address of the owner.
   */
  function owner() public view returns(address) {
    return _owner;
  }

  /**
   * @dev Throws if called by any account other than the owner.
   */
  modifier onlyOwner() {
    require(isOwner());
    _;
  }

  /**
   * @return true if `msg.sender` is the owner of the contract.
   */
  function isOwner() public view returns(bool) {
    return msg.sender == _owner;
  }

  /**
   * @dev Allows the current owner to relinquish control of the contract.
   * @notice Renouncing to ownership will leave the contract without an owner.
   * It will not be possible to call the functions with the `onlyOwner`
   * modifier anymore.
   */
  function renounceOwnership() public onlyOwner {
    emit OwnershipTransferred(_owner, address(0));
    _owner = address(0);
  }

  /**
   * @dev Allows the current owner to transfer control of the contract to a newOwner.
   * @param newOwner The address to transfer ownership to.
   */
  function transferOwnership(address newOwner) public onlyOwner {
    _transferOwnership(newOwner);
  }

  /**
   * @dev Transfers control of the contract to a newOwner.
   * @param newOwner The address to transfer ownership to.
   */
  function _transferOwnership(address newOwner) internal {
    require(newOwner != address(0));
    emit OwnershipTransferred(_owner, newOwner);
    _owner = newOwner;
  }
}
```
#### Constructors
constructor() is an optional special function that has the same name as the contract. It will get executed only one time, when the contract is first created.
#### Function Modifiers
 modifier onlyOwner(). Modifiers are kind of half-functions that are used to modify other functions, usually to check some requirements prior to execution.
### Function Modifiers
A function modifier looks just like a function, but uses the keyword modifier instead of the keyword function. And it can't be called directly like a function can — instead we can attach the modifier's name at the end of a function definition to change that function's behavior.

Let's take a closer look by examining onlyOwner:
```
pragma solidity >=0.5.0 <0.6.0;

/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable {
  address private _owner;

  event OwnershipTransferred(
    address indexed previousOwner,
    address indexed newOwner
  );

  /**
   * @dev The Ownable constructor sets the original `owner` of the contract to the sender
   * account.
   */
  constructor() internal {
    _owner = msg.sender;
    emit OwnershipTransferred(address(0), _owner);
  }

  /**
   * @return the address of the owner.
   */
  function owner() public view returns(address) {
    return _owner;
  }

  /**
   * @dev Throws if called by any account other than the owner.
   */
  modifier onlyOwner() {
    require(isOwner());
    _;
  }

  /**
   * @return true if `msg.sender` is the owner of the contract.
   */
  function isOwner() public view returns(bool) {
    return msg.sender == _owner;
  }

  /**
   * @dev Allows the current owner to relinquish control of the contract.
   * @notice Renouncing to ownership will leave the contract without an owner.
   * It will not be possible to call the functions with the `onlyOwner`
   * modifier anymore.
   */
  function renounceOwnership() public onlyOwner {
    emit OwnershipTransferred(_owner, address(0));
    _owner = address(0);
  }

  /**
   * @dev Allows the current owner to transfer control of the contract to a newOwner.
   * @param newOwner The address to transfer ownership to.
   */
  function transferOwnership(address newOwner) public onlyOwner {
    _transferOwnership(newOwner);
  }

  /**
   * @dev Transfers control of the contract to a newOwner.
   * @param newOwner The address to transfer ownership to.
   */
  function _transferOwnership(address newOwner) internal {
    require(newOwner != address(0));
    emit OwnershipTransferred(_owner, newOwner);
    _owner = newOwner;
  }
}
```
Notice the onlyOwner modifier on the renounceOwnership function. When you call renounceOwnership, the code inside onlyOwner executes first. Then when it hits the _; statement in onlyOwner, it goes back and executes the code inside renounceOwnership.

So while there are other ways you can use modifiers, one of the most common use-cases is to add a quick require check before a function executes.

In the case of onlyOwner, adding this modifier to a function makes it so only the owner of the contract (you, if you deployed it) can call that function.
### Gas — the fuel Ethereum DApps run on
In Solidity, your users have to pay every time they execute a function on your DApp using a currency called gas. Users buy gas with Ether (the currency on Ethereum), so your users have to spend ETH in order to execute functions on your DApp.

How much gas is required to execute a function depends on how complex that function's logic is. Each individual operation has a gas cost based roughly on how much computing resources will be required to perform that operation (e.g. writing to storage is much more expensive than adding two integers). The total gas cost of your function is the sum of the gas costs of all its individual operations.

Because running functions costs real money for your users, code optimization is much more important in Ethereum than in other programming languages. If your code is sloppy, your users are going to have to pay a premium to execute your functions — and this could add up to millions of dollars in unnecessary fees across thousands of users.
### Why is gas necessary?
Ethereum is like a big, slow, but extremely secure computer. When you execute a function, every single node on the network needs to run that same function to verify its output — thousands of nodes verifying every function execution is what makes Ethereum decentralized, and its data immutable and censorship-resistant.

The creators of Ethereum wanted to make sure someone couldn't clog up the network with an infinite loop, or hog all the network resources with really intensive computations. So they made it so transactions aren't free, and users have to pay for computation time as well as storage.
### Time units
Solidity provides some native units for dealing with time.

The variable now will return the current unix timestamp of the latest block (the number of seconds that have passed since January 1st 1970). The unix time as I write this is 1515527488.
Solidity also contains the time units seconds, minutes, hours, days, weeks and years. These will convert to a uint of the number of seconds in that length of time. So 1 minutes is 60, 1 hours is 3600 (60 seconds x 60 minutes), 1 days is 86400 (24 hours x 60 minutes x 60 seconds), etc.

Here's an example of how these time units can be useful:
```
uint lastUpdated;

// Set `lastUpdated` to `now`
function updateTimestamp() public {
  lastUpdated = now;
}

// Will return `true` if 5 minutes have passed since `updateTimestamp` was 
// called, `false` if 5 minutes have not passed
function fiveMinutesHavePassed() public view returns (bool) {
  return (now >= (lastUpdated + 5 minutes));
}
```
### Passing structs as arguments
You can pass a storage pointer to a struct as an argument to a private or internal function. This is useful, for example, for passing around our Zombie structs between functions.

The syntax looks like this:
```
function _doStuff(Zombie storage _zombie) internal {
  // do stuff with _zombie
}
```
This way we can pass a reference to our zombie into a function instead of passing in a zombie ID and looking it up.
### Function modifiers with arguments
Function modifiers can also take arguments. 
For example:
```
// A mapping to store a user's age:
mapping (uint => uint) public age;

// Modifier that requires this user to be older than a certain age:
modifier olderThan(uint _age, uint _userId) {
  require(age[_userId] >= _age);
  _;
}

// Must be older than 16 to drive a car (in the US, at least).
// We can call the `olderThan` modifier with arguments like so:
function driveCar(uint _userId) public olderThan(16, _userId) {
  // Some function logic
}
```
You can see here that the olderThan modifier takes arguments just like a function does. And that the driveCar function passes its arguments to the modifier.
### Saving Gas With 'View' Functions
view functions don't cost any gas when they're called externally by a user.

This is because view functions don't actually change anything on the blockchain – they only read the data. So marking a function with view tells web3.js that it only needs to query your local Ethereum node to run the function, and it doesn't actually have to create a transaction on the blockchain (which would need to be run on every single node, and cost gas).
> Note: If a view function is called internally from another function in the same contract that is not a view function, it will still cost gas. This is because the other function creates a transaction on Ethereum, and will still need to be verified from every node. So view functions are only free when they're called externally.
### Storage is Expensive
One of the more expensive operations in Solidity is using storage — particularly writes.

This is because every time you write or change a piece of data, it’s written permanently to the blockchain. Forever! Thousands of nodes across the world need to store that data on their hard drives, and this amount of data keeps growing over time as the blockchain grows. So there's a cost to doing that.

In order to keep costs down, you want to avoid writing data to storage except when absolutely necessary. Sometimes this involves seemingly inefficient programming logic — like rebuilding an array in memory every time a function is called instead of simply saving that array in a variable for quick lookups.

In most programming languages, looping over large data sets is expensive. But in Solidity, this is way cheaper than using storage if it's in an external view function, since view functions don't cost your users any gas. (And gas costs your users real money!).
### Declaring arrays in memory
You can use the memory keyword with arrays to create a new array inside a function without needing to write anything to storage. The array will only exist until the end of the function call, and this is a lot cheaper gas-wise than updating an array in storage — free if it's a view function called externally.

Here's how to declare an array in memory:
```
function getArray() external pure returns(uint[] memory) {
  // Instantiate a new array in memory with a length of 3
  uint[] memory values = new uint[](3);

  // Put some values to it
  values[0] = 1;
  values[1] = 2;
  values[2] = 3;

  return values;
}
```
> Note: memory arrays must be created with a length argument (in this example, 3). They currently cannot be resized like storage arrays can with array.push(), although this may be changed in a future version of Solidity.
### For Loops
The syntax of for loops in Solidity is similar to JavaScript.

Let's look at an example where we want to make an array of even numbers:
```
function getEvens() pure external returns(uint[] memory) {
  uint[] memory evens = new uint[](5);
  // Keep track of the index in the new array:
  uint counter = 0;
  // Iterate 1 through 10 with a for loop:
  for (uint i = 1; i <= 10; i++) {
    // If `i` is even...
    if (i % 2 == 0) {
      // Add it to our array
      evens[counter] = i;
      // Increment counter to the next empty index in `evens`:
      counter++;
    }
  }
  return evens;
}
```
This function will return an array with the contents [2, 4, 6, 8, 10].
### Visibility Modifiers
Visibility modifiers controls when and where the function can be called from.  

**Private:** Private means it's only callable from other functions inside the contract.  
**Internal:** Internal is like private but can also be called by contracts that inherit from this one.  
**External:** External can only be called outside the contract.  
**Public:** Public can be called anywhere, both internally and externally.  
### State Modifiers
State Modifiers tells us how the function interacts with the BlockChain. 

**View:** View tells us that by running the function, no data will be saved/changed. They are read-only functions.  
**Pure:** Pure tells us that not only does the function not save any data to the blockchain, but it also doesn't read any data from the blockchain.  
Both of these don't cost any gas to call if they're called externally from outside the contract (but they do cost gas if called internally by another function).
### Custom Modifiers
For these we can define custom logic to determine how they affect a function. Ex- onlyOwner.  
### The payable Modifier
payable functions are part of what makes Solidity and Ethereum so cool — they are a special type of function that can receive Ether.  

In Ethereum, because both the money (Ether), the data (transaction payload), and the contract code itself all live on Ethereum, it's possible for you to call a function and pay money to the contract at the same time.
```
contract OnlineStore {
  function buySomething() external payable {
    // Check to make sure 0.001 ether was sent to the function call:
    require(msg.value == 0.001 ether);
    // If so, some logic to transfer the digital item to the caller of the function:
    transferThing(msg.sender);
  }
}
```
Here, **msg.value** is a way to see how much Ether was sent to the contract, and **ether** is a built-in unit.

What happens here is that someone would call the function from web3.js (from the DApp's JavaScript front-end) as follows:
```
// Assuming `OnlineStore` points to your contract on Ethereum:
OnlineStore.buySomething({from: web3.eth.defaultAccount, value: web3.utils.toWei(0.001)})
```
Notice the value field, where the javascript function call specifies how much ether to send (0.001). If you think of the transaction like an envelope, and the parameters you send to the function call are the contents of the letter you put inside, then adding a value is like putting cash inside the envelope — the letter and the money get delivered together to the recipient.
> If a function is not marked payable and you try to send Ether to it as above, the function will reject your transaction.
After you send Ether to a contract, it gets stored in the contract's Ethereum account, and it will be trapped there — unless you add a function to withdraw the Ether from the contract.
### Withdraw
You can write a function to withdraw Ether from the contract as follows:
```
contract GetPaid is Ownable {
  function withdraw() external onlyOwner {
    address payable _owner = address(uint160(owner()));
    _owner.transfer(address(this).balance);
  }
}
```
It is important to note that you cannot transfer Ether to an address unless that address is of type address payable. But the _owner variable is of type uint160, meaning that we must explicitly cast it to address payable.

Once you cast the address from uint160 to address payable, you can transfer Ether to that address using the transfer function, and address(this).balance will return the total balance stored on the contract. So if 100 users had paid 1 Ether to our contract, address(this).balance would equal 100 Ether.

You can use transfer to send funds to any Ethereum address. For example, you could have a function that transfers Ether back to the msg.sender if they overpaid for an item:
```
uint itemFee = 0.001 ether;
msg.sender.transfer(msg.value - itemFee);
```
### So how do we generate random numbers safely in Ethereum?
You can read this [StackOverflow thread](https://ethereum.stackexchange.com/questions/191/how-can-i-securely-generate-a-random-number-in-my-smart-contract) for some ideas. One idea would be to use an oracle to access a random number function from outside of the Ethereum blockchain.
### Tokens on Ethereum
A token on Ethereum is basically just a smart contract that follows some common rules — namely it implements a standard set of functions that all other token contracts share, such as transferFrom(address _from, address _to, uint256 _tokenId) and balanceOf(address _owner).  

Internally the smart contract usually has a mapping, mapping(address => uint256) balances, that keeps track of how much balance each address has.

So basically a token is just a contract that keeps track of who owns how much of that token, and some functions so those users can transfer their tokens to other addresses.
#### Why does it matter?
Since all ERC20 tokens share the same set of functions with the same names, they can all be interacted with in the same ways.

This means if you build an application that is capable of interacting with one ERC20 token, it's also capable of interacting with any ERC20 token. That way more tokens can easily be added to your app in the future without needing to be custom coded. You could simply plug in the new token contract address, and boom, your app has another token it can use.

One example of this would be an exchange. When an exchange adds a new ERC20 token, really it just needs to add another smart contract it talks to. Users can tell that contract to send tokens to the exchange's wallet address, and the exchange can tell the contract to send the tokens back out to users when they request a withdraw.

The exchange only needs to implement this transfer logic once, then when it wants to add a new ERC20 token, it's simply a matter of adding the new contract address to its database.
### ERC721 tokens
ERC721 tokens are not interchangeable since each one is assumed to be unique, and are not divisible. You can only trade them in whole units, and each one has a unique ID. 
### ERC721 Standard
```
contract ERC721 {
  event Transfer(address indexed _from, address indexed _to, uint256 indexed _tokenId);
  event Approval(address indexed _owner, address indexed _approved, uint256 indexed _tokenId);

  function balanceOf(address _owner) external view returns (uint256);
  function ownerOf(uint256 _tokenId) external view returns (address);
  function transferFrom(address _from, address _to, uint256 _tokenId) external payable;
  function approve(address _approved, uint256 _tokenId) external payable;
}
```
### Multiple Inheritance
In Solidity, your contract can inherit from multiple contracts as follows:
```
contract SatoshiNakamoto is NickSzabo, HalFinney {
  // Omg, the secrets of the universe revealed!
}
```
As you can see, when using multiple inheritance, you just separate the multiple contracts you're inheriting from with a comma, ,. 
### ERC721: Transfer Logic
The ERC721 spec has 2 different ways to transfer tokens:
```
function transferFrom(address _from, address _to, uint256 _tokenId) external payable;
```
and
```
function approve(address _approved, uint256 _tokenId) external payable;

function transferFrom(address _from, address _to, uint256 _tokenId) external payable;
```
1. The first way is the token's owner calls transferFrom with his address as the _from parameter, the address he wants to transfer to as the _to parameter, and the _tokenId of the token he wants to transfer.

2. The second way is the token's owner first calls approve with the address he wants to transfer to, and the _tokenID . The contract then stores who is approved to take a token, usually in a mapping (uint256 => address). Then, when the owner or the approved address calls transferFrom, the contract checks if that msg.sender is the owner or is approved by the owner to take the token, and if so it transfers the token to him.  

Notice that both methods contain the same transfer logic. In one case the sender of the token calls the transferFrom function; in the other the owner or the approved receiver of the token calls it.
### Contract security enhancements: Overflows and Underflows
What's an **overflow**?

Let's say we have a uint8, which can only have 8 bits. That means the largest number we can store is binary 11111111 (or in decimal, 2^8 - 1 = 255).

Take a look at the following code. What is number equal to at the end?
```
uint8 number = 255;
number++;
```
In this case, we've caused it to **overflow** — so number is counterintuitively now equal to 0 even though we increased it. (If you add 1 to binary 11111111, it resets back to 00000000, like a clock going from 23:59 to 00:00).

An **underflow** is similar, where if you subtract 1 from a uint8 that equals 0, it will now equal 255 (because uints are unsigned, and cannot be negative).

While we're not using uint8 here, and it seems unlikely that a uint256 will overflow when incrementing by 1 each time (2^256 is a really big number), it's still good to put protections in our contract so that our DApp never has unexpected behavior in the future.
#### Using SafeMath
To prevent overflow and underflow, OpenZeppelin has created a library called SafeMath that prevents these issues by default. One of the things it is useful for is to attach functions to native data types.

For example, with the SafeMath library, we'll use the syntax using SafeMath for uint256. The SafeMath library has 4 functions — add, sub, mul, and div. And now we can access these functions from uint256 as follows:
```
using SafeMath for uint256;

uint256 a = 5;
uint256 b = a.add(3); // 5 + 3 = 8
uint256 c = a.mul(2); // 5 * 2 = 10
```
SafeMath's add, sub, mul, and div are functions that do the basic 4 math operations, but throw an error if an overflow or underflow occurs.
### Library
Libraries are similar to Contracts but are mainly intended for reuse. A Library contains functions which other contracts can call. 
### assert vs require
assert is similar to require, where it will throw an error if false. The difference between assert and require is that require will refund the user the rest of their gas when a function fails, whereas assert will not. So most of the time you want to use require in your code; assert is typically used when something has gone horribly wrong with the code (like a uint overflow).
### Comments 
Commenting in Solidity is just like JavaScript. 
#### Single-Line Comments
```
// This is a single-line comment. It's kind of like a note to self (or to others)
```
#### Multi-Line Comments
```
contract CryptoZombies {
  /* This is a multi-lined comment. I'd like to thank all of you
    who have taken your time to try this programming course.
    I know it's free to all of you, and it will stay free
    forever, but we still put our heart and soul into making
    this as good as it can be.

    Know that this is still the beginning of Blockchain development.
    We've come very far but there are so many ways to make this
    community better. If we made a mistake somewhere, you can
    help us out and open a pull request here:
    https://github.com/loomnetwork/cryptozombie-lessons

    Or if you have some ideas, comments, or just want to say
    hi - drop by our Telegram community at https://t.me/loomnetworkdev
  */
}
```
### natspec standard
```
/// @title A contract for basic math operations
/// @author H4XF13LD MORRIS 💯💯😎💯💯
/// @notice For now, this contract just adds a multiply function
contract Math {
  /// @notice Multiplies 2 numbers together
  /// @param x the first uint.
  /// @param y the second uint.
  /// @return z the product of (x * y)
  /// @dev This function does not currently check for overflows
  function multiply(uint x, uint y) returns (uint z) {
    // This is just a normal comment, and won't get picked up by natspec
    z = x * y;
  }
}
```
@title and @author are straightforward.

@notice explains to a user what the contract / function does. 

@dev is for explaining extra details to developers.

@param and @return are for describing what each parameter and return value of a function are for.

Note that you don't always have to use all of these tags for every function — all tags are optional. But at the very least, leave a @dev note explaining what each function does.
