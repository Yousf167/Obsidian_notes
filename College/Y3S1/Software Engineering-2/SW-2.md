## PDFs
1. [[Lecture-1---All-Clean-Code.pdf]]
2. [[Lecture-3--SOLID.pdf]]
3. [[Lecture-4---DesignPattern.pdf]]
4. [[Lecture-5---OCL.pdf]]
5. [[Lecture-6---AOP.pdf]]
6. [[Lecture-7--Cloud.pdf]]
7. [[Lecture-8--UnitTest.pdf]]

## Project Files
* [[DB Architecture]]


# Clean Code

## Meaningful Names

### 1. Use Intention-Revealing Names

- Variable/function/class names should answer: why it exists, what it does, how it is used
- If a name requires a comment, it doesn't reveal intent
- Choosing good names takes time but saves more

**Minesweeper Example:**

```java
// Bad - implicit
public List<int[]> getThem() {
    List<int[]> list1 = new ArrayList<int[]>();
    for (int[] x : theList)
        if (x[0] == 4) list1.add(x);
    return list1;
}

// Better
public List<int[]> getFlaggedCells() {
    List<int[]> flaggedCells = new ArrayList<int[]>();
    for (int[] cell : gameBoard)
        if (cell[STATUS_VALUE] == FLAGGED)
            flaggedCells.add(cell);
    return flaggedCells;
}

// Best - with Cell class
public List<Cell> getFlaggedCells() {
    List<Cell> flaggedCells = new ArrayList<Cell>();
    for (Cell cell : gameBoard)
        if (cell.isFlagged())
            flaggedCells.add(cell);
    return flaggedCells;
}
```

### 2. Avoid Disinformation

- Don't use keywords, ambiguous words, inconsistent spellings, disinformative names
- Avoid names that vary in small ways (XYZControllerForEfficientHandlingOfStrings vs XYZControllerForEfficientStorageOfStrings)
- Don't use lower-case L or uppercase O as variables

### 3. Use Meaningful Distinctions

- Don't add number series (a1, a2) or noise words just to satisfy compiler
- Names should mean something different if they are different

```java
// Bad
public static void copyChars(char a1[], char a2[]) {
    for (int i = 0; i <= a1.length; i++)
        a2[i] = a1[i];
}

// Good
public static void copyChars(char source[], char destination[]) {
    for (int i = 0; i <= source.length; i++)
        destination[i] = source[i];
}
```

### 4. Eliminate Noise

- Noise words are redundant
- Don't use "variable" in variable names, "table" in table names
- NameString isn't better than Name

### 5. Use Searchable Names

- Single-letter names and numeric constants are hard to find
- MAX_CLASSES_PER_STUDENT vs 50
- Give search-friendly names to variables used in multiple places
- Single-letter names only for local variables in short methods
- Name length should correspond to scope size

```java
// Bad
for (int j=0; j<7; j++)
    s += t[j];

// Good
int NUMBER_OF_SUBJECTS = 7;
int TotalGrade = 0;
for (int j=0; j < NUMBER_OF_SUBJECTS; j++)
    TotalGrade += Student_grade[j];
```

### 6. Class Names

- Should answer "WHO?"
- Use noun or noun phrase: Customer, WikiPage, Account, AddressParser
- Avoid: Manager, Processor, Data, Info
- Not a verb

### 7. Method Names

- Should answer "What does it do?"
- Use verb or verb phrase: postPayment, deletePage, save
- For overloaded constructors, use static factory methods describing arguments

```java
// Good
Address shortAddress = Address.createShortAddress(1, "tahrir", "helwan");
Address fullAddress = Address.createFullAddress(1, 4, 4, "tahrir", "helwan", "cairo", "Egypt");

// Less clear
Address Address1 = new Address(1, "tahrir", "helwan");
Address Address2 = new Address(1, 4, 4, "tahrir", "helwan", "cairo", "Egypt");
```

### 8. Avoid Encodings

- Encoding type/scope info adds difficulty
- Hungarian Notation is outdated and confusing (e.g., int iAge)
- Microsoft stopped recommending it in 2008
- For interfaces/implementations: prefer ShapeFactory (interface) and ShapeFactoryImp (implementation) over IShapeFactory

### 9. Use Pronounceable Names

```java
// Bad
private Date genymdhms;
private Date modymdhms;
private final String pszqint = "102";

// Good
private Date generationTimestamp;
private Date modificationTimestamp;
private final String recordId = "102";
```

### 10. Avoid Mental Mapping

- Readers shouldn't translate names into other names they know
- Don't use r, t, p for complex meanings
- Exception: standard conventions like i, j for iteration

### 11. Don't Be Cute

- Avoid clever names that require shared humor/context
- Don't use whack() for kill(), eatMyShorts() for abort()
- Say what you mean

### 12. Pick One Word Per Concept

- Don't mix fetch, retrieve, get for same concept
- Don't mix controller, manager, driver in same codebase
- Consistent lexicon helps programmers

```java
// Bad - inconsistent
getArticles()
fetchUsers()
retrievePages()

// Good - consistent
getArticles()
getUsers()
getPages()
```

### 13. Add Meaningful Context

- Use context to clarify variable meaning
- firstName, lastName, street, city, state clearly form an address
- Can add prefixes: addrFirstName, addrLastName, addrState
- Better: create Address class

## Functions

### 1. Keep Simple, Small Functions with Meaningful Names

- Functions should be small, then smaller
- Easier to read and understand
- Long methods (>10 lines) need questioning
- Use Extract Method to reduce length

**Example - Before:**

```java
public static void addDataToFile(String path, Person person) {
    FileInputStream readData = new FileInputStream(path);
    ObjectInputStream readStream = new ObjectInputStream(readData);
    ArrayList people = (ArrayList<Person>) readStream.readObject();
    readStream.close();
    people.add(person);
    FileOutputStream writeData = new FileOutputStream(path);
    ObjectOutputStream writeStream = new ObjectOutputStream(writeData);
    writeStream.writeObject(people);
    writeStream.flush();
    writeStream.close();
    System.out.println(people.toString());
}
```

**After Extraction:**

```java
private static ArrayList readDataFromFile(String path) {
    FileInputStream readData = new FileInputStream(path);
    ObjectInputStream readStream = new ObjectInputStream(readData);
    ArrayList people = (ArrayList<Person>) readStream.readObject();
    readStream.close();
    return people;
}

private static void writeDataTofile(String path, ArrayList people) {
    FileOutputStream writeData = new FileOutputStream(path);
    ObjectOutputStream writeStream = new ObjectOutputStream(writeData);
    writeStream.writeObject(people);
    writeStream.flush();
    writeStream.close();
}

private static void PrintPersonDataFile(ArrayList people) {
    System.out.println(people.toString());
}

public static void addDataToFile(String path, Person person) {
    ArrayList people = readDataFromFile(path);
    people.add(person);
    writeDataTofile(path, people);
    PrintPersonData(people);
}
```

**Final Refactoring:**

```java
public static ArrayList addDataToList(Person person, ArrayList people) {
    people.add(person);
    return people;
}

public static void addDataToFile(String path, ArrayList people) {
    writeDataTofile(path, people);
}

// Main usage
public static void main(String[] args) {
    Person p3 = new Person("ahmed", "hesham", 1990);
    String filePath = "peopledata.ser";
    ArrayList people = readDataFromFile(filePath);
    addDataToList(p3, people);
    addDataToFile(filePath, people);
    ArrayList afterAddpeople = readDataFromFile(filePath);
    PrintPersonDataFile(afterAddpeople);
}
```

### 2. Do One Thing

- Functions should do one thing, do it well, do it only
- Guarantees small functions
- Function's purpose should be in its name
- Test: try extracting another function with different name - if possible, it should be separate

### 3. One Level of Abstraction per Function

- Single Level of Abstraction Principle (SLAP)
- All statements within function should be at same abstraction level
- Mixing levels is confusing

**Example:**

```java
// Bad - mixed abstraction levels
private static void printNumbersOneToThirtyFive() {
    printNumbersOneToTen(); //high level
    for(int i=11; i<21; i++) { //low level
        System.out.println(i);
    }
    System.out.println(21);
    if(22 % 11 == 0) {
        System.out.println(22);
        for(int i=23; i<31; i++) {
            System.out.println(i);
            if(i == 30) {
                for(int j=31; j<36; j++) {
                    System.out.println(j);
                }
            }
        }
    }
}

// Good - same abstraction level
private static void printNumbersOneToThirtyFive() {
    printNumbersOneToTen();
    printNumbersElevenToTwenty();
    printNumberTwentyOne();
    printNumbersTwentyTwoToThirtyFive();
}
```

### 4. The Fewer Function Arguments

- Zero arguments best, then one, then two
- Avoid three arguments; never use more
- writeText(text) easier than writeText(outputStream, text)
- outputStream can be class field
- Too many arguments suggest need for separate class

```java
// Bad
public void sendRequest(String ip, int port, String user, String password, String body);

// Good
public void sendRequest(Request request);
```

**Flag Arguments:**

- Flag arguments are ugly
- Boolean means function does two things (one if true, another if false)
- Split into two functions

```java
// Bad
public void printAddress(Boolean longFormat) {
    if(longFormat)
        //print long address
    else
        //print short address
}

// Good
public void printShortAddress() {
    //print short address
}

public void printLongAddress() {
    //print long address
}
```

### 5. Keep Small Blocks in if-else

- Blocks in if/else/while should be one line (probably function call)
- Keeps enclosing function small
- Adds documentary value through descriptive function names
- Functions shouldn't hold nested structures
- Indent level should not exceed one or two

### 6. Replace Conditional With Polymorphism

- Code with if/switch based on limited values violates Open Closed Principle
- To add new flow, must modify class
- Conditional checks often duplicated
- Use polymorphism instead

**Example - Before:**

```java
public class Vehicle {
    private Type type;
    enum Type {BICYCLE, BIKE, CAR, BUS}
    enum ParkingSpotSize {SMALL, MEDIUM, LARGE, XL}
    
    public ParkingSpotSize spaceRequiredForParking() {
        switch (type) {
            case BICYCLE: return ParkingSpotSize.SMALL;
            case BIKE: return ParkingSpotSize.MEDIUM;
            case CAR: return ParkingSpotSize.LARGE;
            case BUS: return ParkingSpotSize.XL;
        }
    }
    
    public BigDecimal parkingCharges() {
        switch (type) {
            case BICYCLE: return BigDecimal.valueOf(10.00);
            case BIKE: return BigDecimal.valueOf(20.00);
            case CAR: return BigDecimal.valueOf(50.00);
            case BUS: return BigDecimal.valueOf(100.00);
        }
    }
}
```

**After - With Polymorphism:**

```java
public interface Vehicle {
    ParkingSpotSize spaceRequiredForParking();
    BigDecimal parkingCharges();
    enum ParkingSpotSize {SMALL, MEDIUM, LARGE, XL}
}

public class Car implements Vehicle {
    @Override
    public ParkingSpotSize spaceRequiredForParking() {
        return ParkingSpotSize.LARGE;
    }
    
    @Override
    public BigDecimal parkingCharges() {
        return BigDecimal.valueOf(50.00);
    }
}
```

## Objects and Data Structures

### 1. Data Abstraction

- Abstraction means hiding implementation
- Not just private variables with getters/setters
- Provide abstract interfaces to manipulate data without knowing implementation
- Express data in abstract terms, not concrete details

**Example:**

```java
// Not abstraction - just accessors
public interface Vehicle {
    double getFuelTankCapacityInGallons();
    double getGallonsOfGasoline();
}

// Abstraction - uses percentage
public interface Vehicle {
    double getPercentFuelRemaining();
}
```

### 2. Data/Object Anti-Symmetry

**Objects:** Hide data (private), have functions operating on data **Data Structures:** Show data (public), have no functions

**Procedural (Data Structures):**

```java
public class Geometry {
    public double area(Object shape) throws NoSuchShapeException {
        if (shape instanceof Square) {
            Square s = (Square) shape;
            return s.side * s.side;
        }
        else if (shape instanceof Circle) {
            Circle c = (Circle) shape;
            return PI * c.radius * c.radius;
        }
    }
}
```

- Easy to add new functions without changing data structures
- Hard to add new data structures (all functions must change)

**Object-Oriented:**

```java
public interface Shape {
    double area();
}

public class Square implements Shape {
    public double area() {
        return side * side;
    }
}

public class Circle implements Shape {
    public double area() {
        return PI * radius * radius;
    }
}
```

- Hard to add new functions (all classes must change)
- Easy to add new classes without changing functions

**When to use each:**

- OO: Complex systems where adding data types is more common
- Procedural: When adding new functions more common than data types

### 3. The Law of Demeter (LoD)

- Principle of least knowledge
- Module should not know inner details of objects it manipulates
- "Only talk to your immediate friends" / "Don't talk to strangers"

**Method M of class C should only call methods of:**

1. C itself
2. M's parameters
3. Objects created within M
4. C's direct component objects
5. Global variables accessible by C in M's scope (static fields)

**Example - Violation:**

```java
// Violates LoD - chained calls
employee.getDepartment().getManager().approveExpense(expenses);
```

**Fixed:**

```java
class Employee {
    private Manager manager;
    
    Employee(Manager manager) {
        this.manager = manager;
    }
    
    void submitExpense(Expenses expenses) {
        manager.approveExpense(expenses);
    }
}

// Usage
Manager mgr = new Manager();
Employee emp = new Employee(mgr);
emp.submitExpense(expenses);
```

## Key Principles Summary

**Clean Code Characteristics:**
- Easy to understand structure and logic
- Readable, maintainable, extendable
- Decisions are documented
- Can be read and enhanced by other developers

**Why Readability Matters:**
- Saves time
- Improves maintenance
- Increases extendibility
- Most time spent reading vs writing code

**Code Review Process:**
- Reduce WTF/minute metric
- Have others review code
- Standardize and stick with standards
- Practice, learn from mistakes, learn from seniors

__Rules Summary__
1. Use Intention-Revealing Names
2. Avoid Disinformation
3. Use Meaningful Distinctions
4. Eliminate Noise
5. Use Searchable Names
6. Class Names
7. Method Names
8. Avoid Encodings
9. Use Pronounceable Names
10. Avoid Mental Mapping
11. Don't Be Cute
12. Pick One Word Per Concept
13. Add Meaningful Context

# SOLID Principles

## Single Responsibility Principle (SRP)

**Definition:** "Every software component should have one and only one responsibility."

- Component can be a class, method, or module
- Advocates higher cohesion and loose coupling

### Cohesion

- Degree to which various parts of a software component are related
- Higher cohesion = easier to follow SRP
- Example: Segregated waste bins have high cohesion; unsegregated bin has low cohesion

**Square Class Example - Low Cohesion:**

```java
public class Square {
    private boolean highResolutionMonitor = true;
    private int side = 5;
    
    public int calculateArea() {
        return side * side;
    }
    
    public int calculatePerimeter() {
        return side * 4;
    }
    
    public void draw() {
        if (highResolutionMonitor) {
            // Render high-resolution image
        } else {
            // Render normal image
        }
    }
    
    public void rotate() {
        // Rotate image and re-render
    }
}
```

**Analysis:**

- calculateArea() and calculatePerimeter() are closely related (measurements)
- draw() and rotate() are closely related (rendering)
- But all methods together have low cohesion
- calculatePerimeter() not closely related to draw()

**Refactored - High Cohesion:**

```java
// Responsibility: Measurements of squares
public class Square {
    int side = 5;
    
    public int calculateArea() {
        return side * side;
    }
    
    public int calculatePerimeter() {
        return side * 4;
    }
}

// Responsibility: Rendering images of squares
public class SquareUI {
    public void draw() {
        if (highResolutionMonitor) {
            // Render high-resolution image
        } else {
            // Render normal image
        }
    }
    
    public void rotate() {
        // Rotate image and re-render
    }
}
```

### Coupling

- Level of inter-dependency between software components
- Degree of interdependence between modules (class, package, microservice)
- About how changing one thing requires changing another
- Tight coupling is undesirable in software

**Tight Coupling Example:**

```java
public class Student {
    private String id;
    private String name;
    private String address;
    
    public void save() {
        Connection connection = null;
        Statement statement = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/MyDB", "root", "password");
            statement = connection.createStatement();
            statement.execute("INSERT INTO student VALUES (" + this.getId() + ", " + this.getAddress() + ", " + this.getBirth() + ")");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public String getId() { return this.id; }
    public void setId(String id) { this.id = id; }
    // other getters/setters
}
```

**Problems:**

- Student class tightly coupled to database layer
- Changing database (MySQL to MongoDB) requires changing Student class
- Student class deals with low-level database details instead of just student functionalities
- Tight coupling is bad

**Loose Coupling Solution:**

```java
// Responsibility: Handle core student profile data
public class Student {
    private String id;
    private String address;
    private String name;
    
    public void save() {
        new StudentRepository().save(this);
    }
    
    public String getId() { return this.id; }
    public void setId(String id) { this.id = id; }
    // other getters/setters
}

// Responsibility: Handle database operations for students
public class StudentRepository {
    public void save(Student student) {
        Connection connection = null;
        Statement statement = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/MyDB", "root", "password");
            statement = connection.createStatement();
            statement.execute("INSERT INTO student VALUES (" + student.getId() + ", '" + student.getName() + "', '" + student.getAddress() + "')");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
```

**Benefits:**

- Removed tight coupling, made it loose
- Changing database only requires changing Repository class
- Student class doesn't need recompilation
- Each class has single responsibility

### Uncle Bob Definition - SRP

**"Every software component should have one and only one reason to change."**

**Student Class Example - Reasons to Change:**

Before modification (tightly coupled Student class):

1. Change in student id format
2. Change in student name format
3. Change in database backend

After splitting into Student and StudentRepository:

- Student class: 2 reasons (id format, name format) → Combined as "changes to student profile"
- StudentRepository class: 1 reason (database changes)

**Note:** Closely related reasons can be combined into one

---

## Open Closed Principle (OCP)

**Definition:** Software entities should be open to extension but closed to modification.

- **Open to extension:** Design classes so new functionality can be added for new requirements
- **Closed for modification:** Once developed, never modify class except to correct bugs

**Goals:**

- Modules open to extension → can adapt to customer needs with new features
- Modules closed for modifications → depend on well-defined, stable behaviors
- **Code should be both flexible and stable**

### How to Achieve Flexibility and Stability

- Refer to abstractions (interfaces/abstract classes) for dependencies, not concrete classes
- Add functionality by creating new classes implementing interfaces
- Reduces risk of introducing bugs to existing code

### Football Match Example

**Scenario:**

- Football match: Al Ahly (Attack strategy) vs Al Zamalek (Defend strategy)
- Bonus: Attack +2, Defend +1
- Match has two teams and score
- Welcome messages based on team strategy

**Violates OCP:**

```java
class Match {
    private int score;
    private Team team1;
    private Team team2;
    
    public void setTeam1() { }
    public void setTeam2() { }
    public int getScore() { }
    
    public void play() {
        if (team1 is Ahly)
            // Ahly is attacker
        else if (team1 is Zamalek)
            // Zamalek is defender
    }
    
    public void welcome() {
        if (team1 is Ahly)
            // Welcome Ahly attacker
        else if (team1 is Zamalek)
            // Welcome Zamalek defensive
    }
    
    public void setScore(winner) {
        if (winner is Ahly)
            team1.bonus + 2
        else if (winner is Zamalek)
            team1.bonus + 1
    }
}

class Team {
    private String name;
    private int bonus;
    // getters/setters
}

class Attack extends Strategy {
    public void play() { }
}

class Defend extends Strategy {
    public void play() { }
}

abstract class Strategy {
    private String name;
    public void play() { }
}
```

**Problems:**

- Many conditionals (hard for readability)
- Violates Open-Close Principle
- Must change Match class when new vehicle type added
- Violates "do one thing" rule

**Solution - Follows OCP:**

```java
class Match {
    private int score;
    private Team team1;
    private Team team2;
    
    public void setTeam1(Strategy s) { }
    public void setTeam2(Strategy s) { }
    
    public void play() {
        team1.play();
        team2.play();
    }
    
    public void welcome() {
        team1.welcome();
        team2.welcome();
    }
    
    public void setScore(winner) {
        team1.setBonus();
        team2.setBonus();
    }
}

class Team {
    private String name;
    private int bonus;
    private Strategy strategy;
    
    public void setStrategy(Strategy s) { }
    
    public void welcome() {
        System.out.println("Hello " + this.name + " " + strategy.name());
    }
    
    public void setBonus() {
        strategy.setScorePoint();
    }
}

abstract class Strategy {
    private String name;
    private int scorePoint;
    
    public abstract void play();
    public abstract void setScorePoint();
}

class Attack extends Strategy {
    public void play() { 
        // Attack logic
    }
    
    public void setScorePoint() { 
        // +2
    }
}

class Defend extends Strategy {
    public void play() { 
        // Defend logic
    }
    
    public void setScorePoint() { 
        // +1
    }
}
```

### Strategy Design Pattern

- Context (Match) maintains reference to concrete strategies
- Communicates via strategy interface only
- Strategy interface common to all concrete strategies
- Declares method context uses to execute strategy
- Concrete Strategies implement different algorithm variations

---

## Liskov Substitution Principle (LSP)

**Definition:** Objects of a superclass should be replaceable with objects of its subclasses without breaking the system.

- Introduced by Barbara Liskov (1987)
- If class B is subclass of class A, then wherever A is expected, B can be used instead
- Subclass should not be more restrictive than behavior specified by superclass

**Purpose:** Ensures inheritance is used correctly

**Violation Signs:**

- Override method does nothing or throws exception
- Applies to inheritance or interfaces

### Four Conditions for LSP

**Condition 1 - Contravariance:**

- Method signatures must match
- Parameters of overriding methods should be same or more generic than parent's method parameters
- Not allowed in Java but allowed in PHP

**Condition 2 - Preconditions Cannot Be Strengthened:**

- Preconditions for method can't be greater than parent's
- Inherited method shouldn't have more conditionals changing return (e.g., throwing Exception)
- Example: Parent accepts integer, child only accepts positive integer → violates LSP

**Condition 3 - Postconditions Cannot Be Weakened:**

- Postconditions must be at least equal to parent's
- Inherited methods should return same type as parent
- Example: Parent closes DB connection at end, child keeps it open → violates LSP

**Condition 4 - Exception Types Must Match:**

- If method returns FileNotFoundException on error, inherited method must return FileNotFoundException too

### Vehicle Example - Violates LSP

```java
class Vehicle {
    String name;
    String getName() { }
    void setName(String n) { }
    double speed;
    double getSpeed() { }
    void setSpeed(double d) { }
    Engine engine;
    Engine getEngine() { }
    void setEngine(Engine e) { }
    void startEngine() { }
}

class Car extends Vehicle {
    @Override
    void startEngine() { 
        // Works fine
    }
}

class Bicycle extends Vehicle {
    @Override
    void startEngine() {
        throw new Exception("Not supported");
    }
    // Problem! Bicycle has no engine
}
```

**Usage Problem:**

```java
public class Before_LiskovSubstitutionPrinciple {
    public static void main(String[] args) {
        ArrayList<Vehicle> vehicleList = new ArrayList();
        Vehicle BMW = new Car();
        vehicleList.add(BMW);
        Vehicle bike = new Bicycle();
        vehicleList.add(bike);
        
        for(Vehicle v : vehicleList) {
            v.startEngine(); // Car works, Bicycle throws exception
        }
    }
}
```

**Solution - Follows LSP:**

```java
class Vehicle {
    String name;
    String getName() { }
    void setName(String n) { }
    double speed;
    double getSpeed() { }
    void setSpeed(double d) { }
}

class VehicleWithoutEngines extends Vehicle {
    void startMoving() { }
}

class VehicleWithEngines extends Vehicle {
    Engine engine;
    Engine getEngine() { }
    void setEngine(Engine e) { }
    void startEngine() { }
}

class Car extends VehicleWithEngines {
    @Override
    void startEngine() { }
}

class Bicycle extends VehicleWithoutEngines {
    @Override
    void startMoving() { }
}
```

### OOD Violates LSP When:

- Subclass returns completely different object from superclass
- Subclass throws exception not defined in superclass
- Subclass methods have side effects not in superclass definition

---

## Interface Segregation Principle (ISP)

**Definition:** "Clients should not be forced to depend upon interfaces that they do not use." - Robert C. Martin

**Goals:**

- Reduce side effects of using larger interfaces by breaking into smaller ones
- Like SRP, each interface serves single purpose

**Two Key Points:**

1. No class forced to implement methods they don't use
2. Create multiple smaller interfaces instead of large fat interfaces

### Printer Example - Violates ISP

```java
public interface PrinterTasks {
    void Print(String PrintContent);
    void Scan(String ScanContent);
    void Fax(String FaxContent);
    void PrintDuplex(String PrintDuplexContent);
}

public class HPLaserJetPrinter implements PrinterTasks {
    @Override
    public void Print(String PrintContent) {
        System.out.println(PrintContent);
    }
    
    @Override
    public void Scan(String ScanContent) {
        System.out.println(ScanContent);
    }
    
    @Override
    public void Fax(String FaxContent) {
        System.out.println(FaxContent);
    }
    
    @Override
    public void PrintDuplex(String PrintDuplexContent) {
        System.out.println(PrintDuplexContent);
    }
}

public class LiquidInkjetPrinter implements PrinterTasks {
    @Override
    public void Print(String PrintContent) {
        System.out.println(PrintContent);
    }
    
    @Override
    public void Scan(String ScanContent) {
        System.out.println(ScanContent);
    }
    
    @Override
    public void Fax(String FaxContent) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
    @Override
    public void PrintDuplex(String PrintDuplexContent) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}
```

**Problem:** LiquidInkjetPrinter doesn't need Fax and PrintDuplex but must implement them

### Printer Example - Follows ISP

**Split into smaller interfaces:**

```java
public interface PrintingTasks {
    public void Print(String PrintContent);
}

public interface ScanTasks {
    void Scan(String ScanContent);
}

public interface FaxTasks {
    void Fax(String FaxContent);
}

public interface DuplexTasks {
    void PrintDuplex(String PrintDuplexContent);
}
```

**Implementations:**

```java
public class HPLaserJetPrinter implements PrintingTasks, ScanTasks, FaxTasks, DuplexTasks {
    @Override
    public void Print(String PrintContent) {
        System.out.println(PrintContent);
    }
    
    @Override
    public void Scan(String ScanContent) {
        System.out.println(ScanContent);
    }
    
    @Override
    public void Fax(String FaxContent) {
        System.out.println(FaxContent);
    }
    
    @Override
    public void PrintDuplex(String PrintDuplexContent) {
        System.out.println(PrintDuplexContent);
    }
}

public class LiquidInkjetPrinter implements PrintingTasks, ScanTasks {
    @Override
    public void Print(String PrintContent) {
        System.out.println(PrintContent);
    }
    
    @Override
    public void Scan(String ScanContent) {
        System.out.println(ScanContent);
    }
}
```

---

## Dependency Inversion Principle (DIP)

**Definition:** High-level modules should not depend on low-level modules; both should depend on abstractions. Abstractions should not depend on details. Details should depend upon abstractions.

**Why Follow This Principle?** Code violating DIP becomes too coupled, making it hard to maintain, unreadable, and prone to side effects.

### Manager Example - Violates DIP

**Scenario:** Manager has developers, designers, and testers as employees

```python
class Manager():
    developers = []
    designers = []
    testers = []
    
    addDeveloper(self, dev):
        developers.append(dev)
    
    addDesigners(self, design):
        designers.append(design)
    
    addTesters(self, testers):
        testers.append(testers)

class Developer():
    Developer():
        print "developer added"

class Designer():
    Designer():
        print "designer added"

class Testers():
    Testers():
        print "tester added"

Main():
    a = Manager()
    a.addDeveloper(Developer())
    a.addDesigners(Designer())
```

**Problems:**

- Exposed everything about lower layer to upper layer (no abstraction)
- Manager must know about all worker types beforehand

**Solution - Follows DIP:** Manager doesn't need to know worker types beforehand, making code truly decoupled

### Store App Example - Violates DIP

**Scenario:** E-commerce app needs payment gateway (Stripe or PayPal)

```java
public class Store {
    Stripe stripe;
    
    Store() {
        this.stripe = new Stripe();
    }
    
    public void sellItem() {
        this.stripe.processpayment();
    }
}

public class Stripe {
    public void processpayment() {
        System.out.println("Earned $10 through Stripe");
    }
}
```

**Problems:**

- Higher-level module (Store) depends on lower-level module (Stripe)
- If Stripe goes under maintenance, must implement PayPal
- Must change Store class (higher-level module)
- In bigger applications, many instances use 'stripe' variable → lots of time, convoluted code, potential errors

### Store App - Follows DIP

**Set up abstraction layer:**

```java
public class Store {
    PaymentGateway paymentGateway;
    
    Store() { }
    
    public void setPaymentGateway(PaymentGateway pg) {
        this.paymentGateway = pg;
    }
    
    public void sellItem() {
        this.paymentGateway.processpayment();
    }
}

interface PaymentGateway {
    public void processpayment();
}

public class Stripe implements PaymentGateway {
    @Override
    public void processpayment() {
        System.out.println("Earned $10 through Stripe");
    }
}

public class Paypal implements PaymentGateway {
    @Override
    public void processpayment() {
        System.out.println("Earned $10 through Paypal");
    }
}
```

### Key Points

- One way to achieve Open-Close Principle is using Dependency Inversion Principle
- Code not following DIP is too coupled → hard to manage project

---

## Dependency Injection (DI)

**Definition:** When class ClassA uses method of class ClassB, ClassB is dependency of ClassA.

**Problem:**

- To replace ClassB with ClassC (optimized version), must recompile ClassA
- Dependency is hardcoded inside ClassA

**Solution:** Pass (inject) dependencies when required instead of initializing inside recipient class

**Benefits:**

- Resolves dependencies at runtime rather than compile time
- Considered design pattern, not framework
- Implements Inversion of Control (IoC)
- IoC inverts additional responsibilities of class rather than main responsibility

### Store App - Violates DI

```java
public class Store {
    Stripe stripe;
    
    class Store() {
        this.stripe = new Stripe();
    }
    
    public void sellItem() {
        this.stripe.processpayment();
    }
}

public class Stripe {
    public void processpayment() {
        System.out.println("Earned $10 through Stripe");
    }
}
```

**Problems:**

- Store dependent on Stripe
- Hard-coded dependency introduces drawbacks:
    - **Inflexible:** Change to depending class may require change to dependent class; impossible to change later without updating/recompiling
    - **Hard for unit testing:** Must test depending classes when testing one class
    - **Hard to reuse:** Classes tightly coupled

**Solution:** Dependency injection makes code flexible to changes, easy for unit testing, truly reusable

### Three Types of Dependency Injection

**1. Constructor Injection:**

- Dependency passed via constructor accepting interface
- Concrete class object bound to interface handle
- Used if dependent object must use same concrete class for lifetime

**2. Interface Injection:**

- Interface provides injector method for injecting dependency
- Client class must implement interface and override injector method
- Clients implement interface exposing setter method accepting dependency

**3. Setter Injection:**

- Dependent class has public setter method for dependency injection

### Store App - Setter Injection

```java
public class Store {
    PaymentGateway paymentGateway;
    
    Store() { }
    
    public void setPaymentGateway(PaymentGateway pg) {
        this.paymentGateway = pg;
    }
    
    public void sellItem() {
        this.paymentGateway.processpayment();
    }
}

interface PaymentGateway {
    public void processpayment();
}

public class Stripe implements PaymentGateway {
    @Override
    public void processpayment() {
        System.out.println("Earned $10 through Stripe");
    }
}

public class Paypal implements PaymentGateway {
    @Override
    public void processpayment() {
        System.out.println("Earned $10 through Paypal");
    }
}
```

**Inject PaymentGateway object to Store via setter method setPaymentGateway()**

### Store App - Constructor Injection

```java
public class Store {
    PaymentGateway paymentGateway;
    
    Store(PaymentGateway pg) {
        this.paymentGateway = pg;
    }
    
    public void sellItem() {
        this.paymentGateway.processpayment();
    }
}

interface PaymentGateway {
    public void processpayment();
}

public class Stripe implements PaymentGateway {
    @Override
    public void processpayment() {
        System.out.println("Earned $10 through Stripe");
    }
}

public class Paypal implements PaymentGateway {
    @Override
    public void processpayment() {
        System.out.println("Earned $10 through Paypal");
    }
}
```

**Inject PaymentGateway object to Store via constructor Store()**

### Store App - Interface Injection

```java
public class Store implements PaymentGatewayInjector {
    PaymentGateway paymentGateway;
    
    Store() { }
    
    @Override
    public void setPaymentGateway(PaymentGateway pg) {
        this.paymentGateway = pg;
    }
    
    public void sellItem() {
        this.paymentGateway.processpayment();
    }
}

interface PaymentGateway {
    public void processpayment();
}

public class Stripe implements PaymentGateway {
    @Override
    public void processpayment() {
        System.out.println("Earned $10 through Stripe");
    }
}

public class Paypal implements PaymentGateway {
    @Override
    public void processpayment() {
        System.out.println("Earned $10 through Paypal");
    }
}

interface PaymentGatewayInjector {
    public void setPaymentGateway(PaymentGateway pg);
}
```

**Inject PaymentGateway object to Store via implementing setPaymentGateway() method from PaymentGatewayInjector interface**

### Advantages of Dependency Injection

- Makes testing easier
- Reduces coupling between client and dependency classes
- Code easier to maintain, reuse, and extend

### Key Points Summary

- DI allows client code to be independent of services it relies on
- Client doesn't control how service objects are created
- Works with service implementation through interface
- Inverse to trivial programming → called inversion of control
- Used DI technique to implement DIP, to apply OCP