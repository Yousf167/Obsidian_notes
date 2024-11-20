#pl2 
previous lesson: [[PL-2 Lecture 0]]
# Java Program Components
```java
public class Welcome {
	public static void main(String[] args) {
		System.out.println("Welcome to Java!");
	}
}
```
## 1. Class Name
• Every Java program must have at least one class.
• Each class has a name.
• By convention, class names start with an uppercase letter.
• In this example, the class name is Welcome.
## 2. Main method
• Line 2 defines the main method.
• In order to run a class, the class must contain a method named main.
• The program is executed from the main method.
## 3. Statements
• A statement represents an action or a sequence of actions.
• The statement `System.out.println("Welcome to Java!")` in the program displays the greeting "Welcome to Java!“.
## 4. Statement terminator
* statements must end with `;`
## 5. Reserved words(Keywords)
• Keywords are words that have a specific meaning to the compiler and cannot be used for other purposes in the program.
• For example, when the compiler sees the word class, it understands that the word after class is the name for the class.
## 6. Comments
## 7. Blocks

# Reading User input
1. Import Scanner class
2. Create a Scanner object
3. Use the methods `next(), nextLine(), nextByte(), nextShort(), nextInt(), nextLong(), nextFloat(), nextDouble(), or nextBoolean() to obtain to a string, byte, short, int, long, float, double, or boolean value`. 

```java
	import java.util.Scanner;
	
	System.out.print("Enter a double value: ");
	Scanner input = new Scanner(System.in);
	double d = input.nextDouble();
```
# Valid Identifiers
* An identifier is a sequence of characters that consists of letters, digits, underscores (`_`), and dollar signs ($).
* An identifier must start with a letter, an underscore (`_`), or a dollar sign ($). It cannot start with a digit.
* An identifier cannot be a reserved word.
* An identifier cannot be true, false, or null.
* An identifier can be of any length.

# Data Types
### Java is a strongly typed language
• This means that every variable and expression has a type when the program is compiled and
that you cannot arbitrarily assign values of one type to another.
### There are two categories of type in Java:
• _Primitive_ Data Types store data values.
• _Non- Primitive_ Data Types do not themselves store data values but are used to refer to
objects. such as Strings, Arrays, and Classes
### Data type sizes in Java are fixed
• to ensure portability across implementations of the language.
![[Screenshot 2024-10-15 114806.png|center]]

## Casting
• There are occasions where we want to be able to convert from one type to another. This can be done either:
* _Automatically_: Java does it for us.
* _By casting_: we have to specify a type conversion.
	• By writing the desired type of an expression in parentheses in front of the expression; for example, write (int) in front of an expression if we wanted it to be converted to an int.

• Note that the fractional parts of a float data type are lost if casting to an integer type.
```java
double x;
x = 2.8;
int intX = (int) x;
```

## Strings
• Strings are represented using the reference type called `String`
### The length method
* For example: `name.length()`.
	* This evaluates to the number of characters in the string referenced by name.
	* If this string were "Roderick", the length method would return the value 8.
	* The empty string has a length of zero.
### String concatenation (+)
• The concatenation operator, +, will _automatically turn any arguments
into strings_ before carrying out a concatenation.
![[Screenshot 2024-10-15 120136.png|center]]
![[Screenshot 2024-10-15 120258.png|center]]
### The String Pool
The String pool helps in saving a lot of space for Java Runtime although it takes more time to create the String. When we use double quotes to create a String, it first looks for a String with the same value in the String pool, if found it just _returns the reference_ else it creates a new String in the pool and then returns the reference. However, using _new_ operator, we force String class to create a new String object in heap space. So, if we have three strings:
```java
String str1 = "Cat"
String str2 = "Cat"
String str3 = new String(str1)

// str1 = str2, str1 != str3
```
![[Screenshot 2024-10-15 120939.png|center]]
* $\Large \text Java\ Strings\ Are\ Immutable.$
	• Objects in Java are created in heap memory. So String objects are also created in the heap. But here the thing is, there is a special memory area to store strings in Java, known as String Constant Pool. Assume we create a String variable as below.
	• String str1 = "Java"; 
	• This is how it is stored inside the memory.
![[Screenshot 2024-10-15 121531.png|center]]
* No matter how many variables are created with the same string object that is already contained in the string constant pool, _it will always refer to the same String object_.
* if you need to change the value of a string, you need to reassign it with the required value
```java
String str = "java";
str.concat(" python"); //wont work
str = str.concat(" python"); //works
```

### Mutable Strings
![[Screenshot 2024-10-15 122620.png|center]]

# Conditional Processing
```java
if(number % 2 == 0)
	even = true;
else
	even = false;
	
//is the same as:

boolean even = number % 2 == 0;

/////////////////////////////////////////////////

if(x > 0)
	y = 1
else
	y = -1

//is the same as:

y = (x > 0)? 1 : -1;
```


next lesson: [[PL-2 Lecture 2]]