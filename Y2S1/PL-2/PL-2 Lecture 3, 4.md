#pl2  References: [[CS213 - Programming Language 2- Lecture 3–  OOP Part 1.pdf]], [[CS213 - Programming Language 2- Lecture 3–  OOP.pdf]],[[CS213 - Programming Language 2- Lecture 4 –  OOP.pdf]] 
previous lesson: [[PL-2 Lecture 2]]
# Object Oriented Programming


* Object-oriented programming (OOP) involves programming using objects.
* An object represents an entity in the real world that can be uniquely identified. For example, a student, a desk, a circle, a button, and even a loan can all be viewed as objects.
* An object has a unique identity, state, and behavior.
* The state of an object consists of a set of data fields (also known as properties) with their current values.
* The behavior of an object is defined by a set of methods. 
* _An Object_ has both a state and behavior. The state defines the object, and the behavior defines what the object does.
* _Classes_ are constructs that define objects of the same type.
* A Java class uses variables to define data fields and methods to define behaviors.
* Additionally, a class provides a special type of method, known as constructors, which are invoked to construct objects from the class.
## Why classes and not structs

* Struct data variables and methods are defined as public by default.
* Class data variables and method are defined as private by default (in C++).
* Classes can have relationship between each other.
* Classes can have concepts like overloading, inheritance, and polymorphism.
* Classes have a new access levels for its members called protected, default.
* Classes Provide public interface, while hiding the implementation details (Encapsulation)
* Class: when implementation is hidden, any change do not affect programmers that use the object.

Class Example:
```java
public class User
{
	private String userID;
	private String emailAddress;
	private int numOfAccess;
	//constructors
	
	//methods
}

public class main
{
	public static void main(String[] args)
	{
		User john;	
	} 

```
![[fuckyou1.png|center]]
![[fuckyou2.png|center]]

```java
class SimpleCircle 
{
	double radius;
	SimpleCircle() 
	{
		radius = 1;
	}
	
/* Construct a circle with a specified radius */
	SimpleCircle(double newRadius) 
	{
		radius = newRadius;
	}
	
/** Return the area of this circle */
	double getArea() 
	{
		return radius * radius * Math.PI;
	}

/** Return the perimeter of this circle */
	double getPerimeter() 
	{
		return 2 * radius * Math.PI;
	}

/** Set a new radius for this circle */
	void setRadius(double newRadius)
	{
		radius = newRadius;
	}
}
```

## Constructors

* Constructors are methods that construct objects. it can have no parameters(no-arg constructor) and it doesn't have a return type. 
* Constructors __must NOT__ have a return type and they __MUST__ have the same name as the class.
* Constructors are invoked using the `new` operator when an object is created. Constructors play the role of initializing objects.
* `className varName` creates a class reference variable.
*  A class may be defined without constructors. In this case, a no-arg constructor with an empty body is implicitly defined in the class. This constructor, called a _default constructor_, is provided automatically only _if no constructors are explicitly defined in the class_.
* _java assigns_ **NO** _default value to local variables inside a method_

## `static` Keyword

* The `static` keyword is used for memory management and helps create class-level variables and methods.
* The **static keyword** in Java is mainly used for memory management. The static keyword in Java is used to share the same variable or method of a given class. The users can apply static keywords with variables, methods, blocks, and nested classes. The static keyword belongs to the class rather than an instance of the class. The static keyword is used for a constant variable or a method that is the same for every instance of a class.

## Visibility modifiers and Accessor/Mutator Methods

• By default, the class, variable, or method can be accessed by any class in the same package.
Here’s a table summarizing all Java access modifiers:

| **Modifier**             | **Class** | **Package** | **Subclass** | **World (different package)** | **Description**                                                                 |
| ------------------------ | --------- | ----------- | ------------ | ----------------------------- | ------------------------------------------------------------------------------- |
| **`private`**            | Yes       | No          | No           | No                            | Accessible only within the same class.                                          |
| **No modifier(default)** | Yes       | Yes         | No           | No                            | Also called "package-private"; accessible within the same package.              |
| **`protected`**          | Yes       | Yes         | Yes          | No                            | Accessible within the same package and subclasses (even in different packages). |
| **`public`**             | Yes       | Yes         | Yes          | Yes                           | Accessible from any class.                                                      |

### Notes:
1. **No Modifier:** If no access modifier is specified, Java applies "default" or "package-private" access.
2. **Hierarchy:** The modifiers control access in increasing order: `private` → default → `protected` → `public`.
3. **Where It Applies:** These modifiers can be applied to classes, methods, fields, and constructors, but `protected` and `private` cannot be used for top-level classes.
- **`public`**: Accessible from **anywhere**, even in other packages.
- **`private`**: Only accessible **within the same class**. No other class, even in the same package, can access it.
- **`default`** (no modifier): Accessible within the **same package** but not from other packages, even if it's a subclass.
![[Screenshot 2024-10-22 123526.png|center]]

## Array of objects

In Java, an **array of objects** is a collection of references to instances of a class. Just like you can have an array of primitive types (e.g., `int[]`, `double[]`), you can also have an array that holds references to objects.

### Declaring and Creating an Array of Objects

1. **Declare an Array of Objects**: You specify the class type in the array declaration.
   ```java
   ClassName[] arrayName;
   ```

2. **Instantiate the Array**: You create an array using the `new` keyword, specifying the size of the array.
   ```java
   arrayName = new ClassName[size];
   ```

3. **Create Individual Objects**: The array holds references to objects, so you need to initialize each element in the array.

### Example: Array of Objects

Let’s create an array of `Car` objects.

```java
class Car {
    String model;
    int year;

    // Constructor
    Car(String model, int year) {
        this.model = model;
        this.year = year;
    }

    // Method to display car details
    void display() {
        System.out.println("Model: " + model + ", Year: " + year);
    }
}

public class Main {
    public static void main(String[] args) {
        // Step 1: Declare and create an array of 3 Car objects
        Car[] cars = new Car[3];
        
        // Step 2: Initialize each object in the array
        cars[0] = new Car("Toyota", 2020);
        cars[1] = new Car("Honda", 2019);
        cars[2] = new Car("Ford", 2021);
        
        // Step 3: Access and use the objects
        for (int i = 0; i < cars.length; i++) {
            cars[i].display();  // Output the car details
        }
    }
}
```

### Breakdown of the Example:
1. **`Car[] cars = new Car[3];`**: Creates an array `cars` that can hold 3 `Car` objects.
2. **`cars[0] = new Car("Toyota", 2020);`**: Initializes the first element in the array by creating a new `Car` object.
3. **`for` loop**: Iterates through the array and calls the `display()` method for each `Car` object.

### Output:
```
Model: Toyota, Year: 2020
Model: Honda, Year: 2019
Model: Ford, Year: 2021
```

### Important Notes:
- The array holds **references** to objects, not the objects themselves.
- Initially, when the array is created, each element contains the default value `null` (because they are references to objects, not primitive values).
- You can access and manipulate the objects using array indices.

### Accessing Specific Elements
You can access a specific object in the array using its index, just like with any array.
```java
Car firstCar = cars[0];
System.out.println(firstCar.model);  // Outputs: Toyota
```
## Getters and Setters
* A getter method (also called an 'accessor' method):
	* It is one that accesses some attribute of an object.
	* A getter method should not change the state of the object.

* A setter method (also called a 'mutator' method)
	* It is one that changes the state of an object by setting the value of an instance variable.
	* Setter methods do not normally return a value.

![[Screenshot 2024-10-22 131910.png|center]]

## `this` Keyword
* The this keyword is the name of a reference that refers to an object itself. One common use of the this keyword is reference a class’s hidden data fields.
* Another common use of the this keyword to enable a constructor to invoke another constructor of the same class. (Calling Overloaded Constructor)
```java
public class three 
{
	private int a,b,c;
	
	public three(int a,int b,int c)
	{
		this.a=a;
		this.b=b;
		this.c=c;
	}
	
	public three()
	{
		this(0,0,0);
	}
	
	public three(int a)
	{
		this(a,0,0);
	}
	
	public three(int a,int b)
	{
		this(a,b,0);
	}
}
```
## Class Abstraction and Encapsulation
Class abstraction means to separate class implementation from the use of the class. The creator of the class provides a description of the class and let the user know how the class can be used. The user of the class does not need to know how the class is implemented. The detail of implementation is encapsulated and hidden from the user.
# Class Relationships
In Java, understanding class relationships is fundamental to writing clean, organized, and maintainable code. Java classes can interact in several ways, and these relationships determine how classes depend on each other and communicate. Here’s a rundown of the main types:

## 1. Association
   - **Definition**: Association is a general relationship between two classes, where one class uses or interacts with another. It reflects a "has-a" relationship.
   - **Example**: A `Library` class might be associated with a `Book` class because a library "has" books.
   - **Types of Association**:
     - **Unidirectional**: One class knows about the other but not vice versa.
     - **Bidirectional**: Both classes know about each other.

```
public class Library 
{
    private Book book;  // Association: Library has a Book   
}
```
## 2. Aggregation
   - **Definition**: Aggregation is a type of association where one class is a collection or container of other classes. It indicates a "whole-part" relationship, where parts can exist independently.
   - **Example**: A `Department` class might aggregate `Employee` objects because a department has employees, but if the department is removed, employees still exist.

```java
public class Department {
	private List<Employee> employees;  // Aggregation: Department has Employees
}
```

## 3. Composition
   - **Definition**: Composition is a strong form of aggregation, where the contained object’s lifecycle is dependent on the container’s lifecycle. If the container is destroyed, so is the contained object.
   - **Example**: A `House` class and `Room` class. If a house is destroyed, its rooms no longer exist.

   ```java
   public class House {
       private List<Room> rooms = new ArrayList<>();  // Composition: House contains Rooms
   }
   ```

## 4. Inheritance
   - **Definition**: Inheritance is an "is-a" relationship where one class (the subclass) derives from another (the superclass). This is useful for code reuse and is implemented using the `extends` keyword in Java.
   - **Example**: A `Dog` class might inherit from an `Animal` class because a dog "is an" animal.

   ```java
   public class Animal {
       // Common properties for all animals
   }

   public class Dog extends Animal {
       // Dog-specific properties and methods
   }
   ```

## 5. Dependency
   - **Definition**: Dependency is a weaker form of association where one class uses another temporarily, typically as a parameter in a method.
   - **Example**: A `Driver` class might use a `Car` class only for the duration of driving.

   ```java
   public class Driver {
       public void drive(Car car) {  // Dependency: Driver uses Car temporarily
           // Driving code
       }
   }
   ```
see [[SWE lecture 5]] for more info
These relationships help manage code complexity and define clear roles and interactions among classes in a Java application.

# Object Casting

```java
public class PolymorphismDemo { public static void main(String[] args) 
{ 
	m(new GraduateStudent()); 
	m(new Student()); 
	m(new Person()); 
	m(new Object()); 
} 
	public static void m(Object x) 
	{ 
		System.out.println(x.toString()); 
	}
} 

class GraduateStudent extends Student { } 

class Student extends Person 
{ 
	public String toString() 
	{ 
		return "Student"; 
	} 
} 

class Person extends Object 
{ 
	public String toString() 
	{ 
		return "Person"; 
	} 
}

.......

Object o = new Student;
m(o); //works

Student b = o; //doesnt work
// Student is always an instance of Object, Object is not necessarily an instance of Student
// to make it work:
Student b = (Student)o;// explicit casting

```
when casting from Superclass to Subclass, Explicit casting must be used. This type of casting may not always succeed.
```java
Apple x = (Apple) fruit;
Orange x = (Orange) fruit;
```
### Why?
When casting from a **superclass** to a **subclass** in Java, **explicit casting** must be used because the object being cast might not actually be an instance of the subclass. This is a potential issue because while a subclass is always a type of its superclass (upcasting is safe and implicit), the reverse is not necessarily true.

### Reasons Why Casting May Not Succeed:

1. **The Actual Object Type Does Not Match the Subclass:**
   Even though the reference variable has the type of the superclass, the object it refers to might not be an instance of the subclass. For example:
   ```java
   class Animal {}
   class Dog extends Animal {}

   Animal a = new Animal(); // 'a' refers to an Animal object
   Dog d = (Dog) a;         // Compilation is fine, but at runtime: ClassCastException
   ```
   The object `a` is of type `Animal`, and you cannot cast it to `Dog` because it is not an instance of `Dog`.

2. **Polymorphism in Action:**
   When a superclass reference is used to point to a subclass object, the compiler sees only the type of the reference, not the actual type of the object. The runtime type of the object determines whether the cast is valid.
   ```java
   Animal a = new Dog(); // 'a' refers to a Dog object
   Dog d = (Dog) a;      // This will succeed because the actual object is a Dog
   ```

3. **Class Hierarchy and Object Compatibility:**
   The superclass and subclass might have no relationship to one another beyond inheritance, and casting to an unrelated type will fail. 

4. **Runtime Check with `ClassCastException`:**
   At runtime, Java verifies the actual type of the object being cast. If the object is not an instance of the subclass (or its subclasses), it throws a `ClassCastException`.

### How to Avoid Errors:
1. **Use the `instanceof` Operator:**
   Before casting, check whether the object is an instance of the target class.
   ```java
   if (a instanceof Dog) {
       Dog d = (Dog) a;
   } else {
       System.out.println("Cannot cast to Dog");
   }
   ```

2. **Favor Composition Over Casting:**
   Instead of relying heavily on casting, use polymorphism and method overriding to achieve behavior specific to subclasses.

### Example:
```java
class Animal {
    void speak() {
        System.out.println("Animal speaks");
    }
}

class Dog extends Animal {
    void bark() {
        System.out.println("Dog barks");
    }
}

public class Main {
    public static void main(String[] args) {
        Animal a = new Dog(); // Upcasting: implicit and safe
        a.speak();            // Works because speak() is in Animal

        if (a instanceof Dog) {
            Dog d = (Dog) a;  // Downcasting: explicit but safe after instanceof check
            d.bark();         // Now you can call Dog-specific methods
        }
    }
}
```
### Key Takeaway:
Downcasting is **explicit** because it carries the risk of runtime failure (`ClassCastException`). Always ensure the object is an instance of the subclass before performing a cast.

# Non access Modifiers

| **Modifier**       | **Applicable To**                   | **Effect**                                                                                                                                                                                                               |
| ------------------ | ----------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **`final`**        | Classes, Methods, Variables         | - **Class**: Cannot be extended. <br>- **Method**: Cannot be overridden. <br>- **Variable**: Value cannot be reassigned.                                                                                                 |
| **`static`**       | Methods, Variables, Blocks, Classes | - **Methods/Variables**: Belong to the class rather than instances. <br>- **Block**: Executes only once when the class is loaded. <br>- **Class**: Creates a nested class not tied to an instance (static nested class). |
| **`abstract`**     | Classes, Methods                    | - **Class**: Cannot be instantiated; must be extended. <br>- **Method**: Declares a method without implementation (only in abstract classes).                                                                            |
| **`synchronized`** | Methods, Blocks                     | Ensures that only one thread can access the method/block at a time.                                                                                                                                                      |
| **`volatile`**     | Variables                           | Ensures that changes to the variable are visible to all threads immediately (no caching).                                                                                                                                |
| **`transient`**    | Variables                           | Prevents a variable from being serialized.                                                                                                                                                                               |
| **`strictfp`**     | Classes, Interfaces, Methods        | Forces floating-point operations to adhere to IEEE 754 standards (maintains platform-independent precision).                                                                                                             |
| **`native`**       | Methods                             | Indicates the method is implemented in native code (outside Java, e.g., C/C++).                                                                                                                                          |

### Notes:
1. **Non-Access Modifiers Purpose:** Unlike access modifiers, these keywords modify behavior or define special properties of Java elements.
2. **Reserved Keywords (`const` and `goto`):** Reserved for future use but currently unused in Java.
3. **Combinations:** Non-access modifiers can often be combined. For example, a `final static` variable is a class constant. 

# Abstract Classes and Methods
In Java, **abstract classes** and **abstract methods** are used to define a blueprint for other classes. They provide a way to define methods that must be implemented by derived (subclass) classes, while also allowing the abstract class itself to have fully implemented methods.

### **Abstract Class**
An abstract class:
1. **Cannot be instantiated.** It serves as a base class for other classes.
2. Can have both:
   - **Abstract methods:** Declared without a body (implementation is provided by subclasses).
   - **Concrete methods:** Fully implemented methods with a body.
3. Can have instance variables, constructors, and static methods.

**Syntax:**
```java
abstract class ClassName {
    // Instance variables
    int x;

    // Abstract method (no body)
    abstract void abstractMethod();

    // Concrete method (has body)
    void concreteMethod() {
        System.out.println("This is a concrete method.");
    }
}
```



### **Abstract Method**
An abstract method:
1. **Does not have a body** (implementation is deferred to subclasses).
2. Must be declared within an abstract class.
3. Must be implemented by all concrete (non-abstract) subclasses unless the subclass is also abstract.

**Syntax:**
```java
abstract void methodName();
```



### Example:

#### Abstract Class and Abstract Method:
```java
// Abstract class
abstract class Animal {
    // Abstract method (no implementation)
    abstract void sound();

    // Concrete method (has implementation)
    void sleep() {
        System.out.println("Sleeping...");
    }
}

// Subclass
class Dog extends Animal {
    // Providing implementation of the abstract method
    void sound() {
        System.out.println("Woof! Woof!");
    }
}

// Main class
public class Main {
    public static void main(String[] args) {
        // Animal a = new Animal(); // Error: Cannot instantiate abstract class

        Animal myDog = new Dog(); // Upcasting
        myDog.sound();            // Calls the Dog's implementation
        myDog.sleep();            // Calls the concrete method from Animal
    }
}
```

**Output:**
```
Woof! Woof!
Sleeping...
```



### **Key Points:**
1. An **abstract class** can have constructors and static methods, unlike interfaces.
2. If a class contains at least one abstract method, it **must** be declared abstract.
3. Abstract classes allow partial implementation, unlike interfaces which provide full abstraction (prior to Java 8).
4. If a subclass does not implement all abstract methods, it must also be declared **abstract**.

### **What is an Interface in Java?**

An **interface** in Java is a blueprint for a class that specifies a set of methods that must be implemented by any class that **implements** the interface. It is a mechanism for achieving full abstraction (before Java 8) and multiple inheritance.



### **Key Characteristics of an Interface:**

1. **Methods in an Interface:**
   - Prior to Java 8, interfaces could only contain **abstract methods** (no method body).
   - From Java 8 onwards:
     - **Default methods**: Can have a body and provide default behavior.
     - **Static methods**: Can have a body and are accessible without an instance.
   - From Java 9 onwards:
     - **Private methods**: Can have a body and be used within the interface for helper logic.

2. **Variables in an Interface:**
   - All variables are **public**, **static**, and **final** by default (constants).

3. **Multiple Inheritance:**
   - A class can implement multiple interfaces, allowing for multiple inheritance in Java.

4. **Instantiation:**
   - Interfaces cannot be instantiated directly, like abstract classes.



### **Syntax of an Interface:**
```java
interface InterfaceName {
    // Abstract method (no body)
    void abstractMethod();

    // Default method (has a body)
    default void defaultMethod() {
        System.out.println("Default method in an interface.");
    }

    // Static method (has a body)
    static void staticMethod() {
        System.out.println("Static method in an interface.");
    }
}
```



### **Example:**
```java
interface Animal {
    // Abstract method
    void sound();

    // Default method
    default void sleep() {
        System.out.println("Sleeping...");
    }
}

class Dog implements Animal {
    // Providing implementation for abstract method
    public void sound() {
        System.out.println("Woof! Woof!");
    }
}

public class Main {
    public static void main(String[] args) {
        Dog dog = new Dog();
        dog.sound();  // Calls Dog's implementation
        dog.sleep();  // Calls default method from the interface
    }
}
```

**Output:**
```
Woof! Woof!
Sleeping...
```


### **Differences Between Interface and Abstract Class**

| **Feature**                 | **Abstract Class**                                                                     | **Interface**                                                                              |
| --------------------------- | -------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ |
| **Inheritance**             | A class can inherit only one abstract class (single inheritance).                      | A class can implement multiple interfaces (multiple inheritance).                          |
| **Methods**                 | Can have both abstract and concrete methods.                                           | Can have abstract, default, static, and private methods.                                   |
| **Fields/Variables**        | Can have instance variables.                                                           | Can only have public, static, final constants.                                             |
| **Access Modifiers**        | Methods and variables can have any access modifier (public, protected, private, etc.). | Methods are public by default; variables are public, static, and final by default.         |
| **Constructors**            | Can have constructors.                                                                 | Cannot have constructors.                                                                  |
| **Use Case**                | Used for creating a base class with shared behavior and partial implementation.        | Used for defining a contract that classes must adhere to without providing implementation. |
| **Instantiation**           | Cannot be instantiated directly.                                                       | Cannot be instantiated directly.                                                           |
| **Java Version Dependency** | Fully supported from Java 1.0.                                                         | Enhanced with default and static methods in Java 8; private methods introduced in Java 9.  |
![[Screenshot 2024-11-18 085837.png|center]]

### **When to Use What?**

| **Use an Abstract Class When:**                  | **Use an Interface When:**                    |
| ------------------------------------------------ | --------------------------------------------- |
| You want to provide partial implementation.      | You want to define a contract or behavior.    |
| There’s a shared state or code among subclasses. | Classes need to work with unrelated classes.  |
| You need constructors or instance variables.     | Multiple inheritance of behavior is required. |

All classes share a single root, the Object class, but there is no single root for interfaces. Like a class, an interface also defines a type. A variable of an interface type can reference any instance of the class that implements the interface. If a class extends an interface, this interface plays the same role as a superclass. You can use an interface as a data type and cast a variable of an interface type to its  subclass, and vice versa.
![[Screenshot 2024-11-18 090434.png|center]]


# Interface Implementation
In Java, the `implements` keyword is used when a class wants to **implement** an interface. It signifies that the class agrees to provide concrete implementations for all the methods declared in the interface.
### **Key Points About `implements`:**
1. A class can implement **one or more interfaces**, separating their names with commas.
2. When a class implements an interface, it must provide implementations for all the **abstract methods** in the interface unless the class itself is declared as `abstract`.
3. A class can extend a class and implement an interface simultaneously.



### **Syntax:**
```java
interface InterfaceName {
    void method1();
    void method2();
}

class ClassName implements InterfaceName {
    public void method1() {
        // Implementation of method1
    }

    public void method2() {
        // Implementation of method2
    }
}
```

---

### **Example: Single Interface Implementation**
```java
interface Animal {
    void sound(); // Abstract method
    void sleep(); // Abstract method
}

class Dog implements Animal {
    public void sound() {
        System.out.println("Woof! Woof!");
    }

    public void sleep() {
        System.out.println("Dog is sleeping...");
    }
}

public class Main {
    public static void main(String[] args) {
        Dog dog = new Dog();
        dog.sound(); // Output: Woof! Woof!
        dog.sleep(); // Output: Dog is sleeping...
    }
}
```

---

### **Example: Implementing Multiple Interfaces**
```java
interface Animal {
    void eat();
}

interface Pet {
    void play();
}

class Dog implements Animal, Pet {
    public void eat() {
        System.out.println("Dog is eating...");
    }

    public void play() {
        System.out.println("Dog is playing...");
    }
}

public class Main {
    public static void main(String[] args) {
        Dog dog = new Dog();
        dog.eat();  // Output: Dog is eating...
        dog.play(); // Output: Dog is playing...
    }
}
```

---

### **Class Extending and Implementing**
A class can extend another class and implement an interface simultaneously. The `extends` keyword must come before `implements`.

```java
class Animal {
    void sleep() {
        System.out.println("Animal is sleeping...");
    }
}

interface Pet {
    void play();
}

class Dog extends Animal implements Pet {
    public void play() {
        System.out.println("Dog is playing...");
    }
}

public class Main {
    public static void main(String[] args) {
        Dog dog = new Dog();
        dog.sleep(); // Output: Animal is sleeping...
        dog.play();  // Output: Dog is playing...
    }
}
```

---

### **Key Notes:**
1. _If a class does not implement all the methods in the interface, it must be declared `abstract`._
2. Interfaces support multiple inheritance, while classes do not.