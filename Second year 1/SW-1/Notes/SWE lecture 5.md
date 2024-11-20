#sw-1 previous lesson: [[SWE lecture 4]]
# Class and Object Diagrams

#### Concepts Overview
1. **Objects and Classes**:
   - Objects represent real-world entities.
   - Classes serve as templates for objects and can include attributes and services.

2. **Inheritance and Message Passing**:
   - Classes can inherit properties from other classes.
   - Objects communicate using message passing, which in practice is implemented as procedure calls.

#### Diagramming Techniques
1. **Purpose**:
   - Represent static, structural aspects of object-oriented systems.
   - Core focus on object classes, their attributes, and relationships.

2. **Elements of Class Diagrams**:
   - **Classes**: Rectangles divided into three parts: name, attributes, and behavior.
   - **Stereotypes**: Indicate semantics or classify diagram elements (e.g., `<<entity>>`, `<<constructor>>`).
   - **Associations**: Represent relationships between classes, often annotated with multiplicity and roles.

3. **Visibility Indicators**:
   - Public: `+`
   - Protected: `#`
   - Private: `-`

4. **Types of Classes**:
   - **Entity Classes**: Model information requirements (e.g., `Person`).
   - **Boundary Classes**: Interact with external actors (e.g., UI components).
   - **Control Classes**: Manage other objects and encapsulate logic.

#### Iterative Class Diagram Creation
1. Identify classes and associations.
2. Allocate attributes and operations to classes.
3. Define generalization structures.




## Complementary Insights from Chapter 5 - Sommerville
#### System Modeling with UML
1. **Purpose**:
   - Provide abstract representations to understand, analyze, and communicate a system’s functionality and structure.

2. **Class Diagrams**:
   - Focus on system entities and their static relationships.
   - Core features:
     - **Attributes**: Represent data held by objects.
     - **Operations**: Define object behavior.
     - **Relationships**: Include associations, aggregation, and generalization.

3. **Best Practices**:
   - Start with high-level abstractions.
   - Refine into more detailed models as development progresses.

4. **Use in Development**:
   - Applied at multiple stages, from requirements specification to implementation.





# UML Class Diagrams 101

# What is a UML Class Diagram?
- A **class diagram** is a visual representation of the static structure of a system.
- It depicts:
	- **Classes**: Blueprint for objects in the system.
	- **Attributes**: Data the class stores.
	- **Methods/Operations**: Functions the class can perform.
	- **Relationships**: How classes are connected to one another.

# Basic Notation

## 1. Class Structure:
   - Represented as a rectangle divided into three sections:
     ```
     +------------------------+
     |       ClassName        |  (Class name, typically PascalCase)
     +------------------------+
     | -attributeName         |  (Attributes: Visibility + Name: Type)
     | +attributeName: Type   |
     +------------------------+
     | +methodName()          |  (Methods: Visibility + Name(params): ReturnType)
     | -setName(name: String) |
     +------------------------+
     ```
   - **Visibility Modifiers**:
     - `+` Public: Accessible everywhere.
     - `-` Private: Accessible only within the class.
     - `#` Protected: Accessible within the class and its subclasses.

## 2. Relationships:
Class relationships in object-oriented programming define how classes interact with each other. These relationships are often represented in **UML (Unified Modeling Language)** diagrams to visually communicate system designs. Here's a breakdown of the primary types of relationships, their UML notations, and when to use them:

---

### **1. Association**
#### **Definition**:
- A structural relationship where two classes are connected, meaning one class uses or interacts with the other.
- It represents a "uses-a" or "has-a" relationship.

#### **UML Notation**:
- A solid line connecting two classes, optionally labeled with a role name or multiplicity.

#### **Types**:
1. **Unidirectional**: One class knows about the other.  
   (e.g., A `Library` class knows about the `Book` class but not vice versa).
2. **Bidirectional**: Both classes know about each other.  
   (e.g., `Teacher` and `Student` interact both ways).

#### **When to Use**:
- Use when one class logically requires access to another.
- For example, a `Person` class associated with a `BankAccount` class.

---

### **2. Aggregation**
#### **Definition**:
- A specialized form of association where one class is a "whole" and another is a "part."
- The "part" can exist independently of the "whole."

#### **UML Notation**:
- A solid line with a white diamond pointing to the "whole" class.

#### **When to Use**:
- Use when the "part" can exist outside the "whole."
- Example: A `Department` class aggregates `Employee` objects. Employees can exist independently of departments.

---

### **3. Composition**
#### **Definition**:
- A stronger form of aggregation where the "part" class's lifecycle is tied to the "whole."
- If the "whole" is destroyed, the "part" is also destroyed.

#### **UML Notation**:
- A solid line with a black diamond pointing to the "whole" class.

#### **When to Use**:
- Use when the "part" cannot logically exist without the "whole."
- Example: A `House` class composed of `Room` objects. Rooms cannot exist without the house.

---

### **4. Inheritance (Generalization)**
#### **Definition**:
- A "is-a" relationship where a subclass inherits from a superclass.

#### **UML Notation**:
- A solid line with a hollow triangle pointing to the superclass.

#### **When to Use**:
- Use when one class is a specialized version of another.
- Example: A `Car` class inherits from a `Vehicle` class.

---

### **5. Dependency**
#### **Definition**:
- A weaker relationship indicating that one class depends on another for its behavior, often temporarily.

#### **UML Notation**:
- A dashed line with an arrow pointing to the depended-upon class.

#### **When to Use**:
- Use when a class only uses another class for a short time (e.g., via method parameters).
- Example: A `PaymentProcessor` class depends on a `CreditCard` class for payment processing.

---

### **6. Realization**
#### **Definition**:
- A relationship between an interface and a class that implements it.

#### **UML Notation**:
- A dashed line with a hollow triangle pointing to the interface.

#### **When to Use**:
- Use when a class fulfills the contract defined by an interface.
- Example: A `Dog` class realizes a `Pet` interface.

---

### **Choosing the Right Relationship**
1. **Association**: Use for general interactions.
2. **Aggregation**: Use when parts can exist independently.
3. **Composition**: Use for strong ownership relationships.
4. **Inheritance**: Use to model "is-a" hierarchies.
5. **Dependency**: Use for temporary or method-level interactions.
6. **Realization**: Use for interface implementation.


Imagine a system where:
- A `Library` contains many `Books` (Aggregation).
- A `Book` has `Pages` (Composition).
- A `Librarian` manages the `Library` (Association).
- A `DigitalLibrary` extends the `Library` (Inheritance).
- A `Searchable` interface is realized by `Library`.

Visualize this with appropriate UML symbols. Let me know if you'd like an illustration!


## Example Diagram
```plaintext
+------------------------------+               +---------------------------+
|           Person             |<>------------>|         Address           |
+------------------------------+               +---------------------------+
| -name: String                |               | -street: String           |
| -age: int                    |               | -city: String             |
+------------------------------+               +---------------------------+
| +getName(): String           |               | +getFullAddress(): String |
| +setName(name: String): void |               |                           |
+------------------------------+               +---------------------------+

- `<>` = Aggregation (a person has an address).
```



## Steps to Create a Class Diagram
1. **Identify Classes**: Break down your system into key objects.
2. **Determine Attributes and Methods**:
   - Attributes: What data each class stores.
   - Methods: What actions each class can perform.
3. **Define Relationships**:
   - Associations, generalization, aggregation, etc.
4. **Add Multiplicities and Stereotypes** (if applicable):
   - Multiplicities (e.g., `1..*`, `0..1`) clarify how many objects are involved.
   - Stereotypes (e.g., `<<entity>>`, `<<boundary>>`) add semantic meaning.



## Tips for Best Practice
1. **Simplify**: Start with a high-level abstraction, avoid unnecessary details initially.
2. **Focus on Key Relationships**: Highlight the most important connections.
3. **Iterate**: Refine the diagram as you gain clarity about the system.


In UML (Unified Modeling Language), **stereotypes** are a way to extend the vocabulary of UML by adding custom types or categories to elements. They allow developers and architects to add specific meanings or roles to model elements while remaining compliant with UML standards.


---

### **Common UML Stereotypes and Their Meanings**
Stereotypes are written within `«guillemets»` (double-angle brackets) above the element they apply to.

#### **1. Actor**
- **Meaning**: Represents an external entity interacting with the system.
- **Applies To**: Use case diagrams.
- **Example**: `«actor» Customer` in an e-commerce system.

#### **2. Boundary**
- **Meaning**: Denotes an interface between the system and its users or other systems.
- **Applies To**: Class diagrams.
- **Example**: `«boundary» LoginForm`.

#### **3. Control**
- **Meaning**: Represents logic that manages the flow of events or processes in a system.
- **Applies To**: Class diagrams, sequence diagrams.
- **Example**: `«control» PaymentProcessor`.

#### **4. Entity**
- **Meaning**: Represents persistent data or a business object in the system.
- **Applies To**: Class diagrams.
- **Example**: `«entity» Customer`.

#### **5. Interface**
- **Meaning**: Indicates that the class defines a contract or API for other classes.
- **Applies To**: Class diagrams.
- **Example**: `«interface» Searchable`.

#### **6. Realization**
- **Meaning**: Indicates a class or component implements an interface or abstraction.
- **Applies To**: Class diagrams.
- **Example**: A dashed line with a `«realize»` relationship.

#### **7. Component**
- **Meaning**: Represents a physical part of the system (e.g., a software module or a package).
- **Applies To**: Component diagrams.
- **Example**: `«component» UserManagement`.

#### **8. Node**
- **Meaning**: Represents a physical device or hardware in the system.
- **Applies To**: Deployment diagrams.
- **Example**: `«node» DatabaseServer`.

#### **9. Stereotypes for Dependencies**
- **Usage**: Applied to dependency relationships.
  - **«use»**: Indicates one element uses another.
  - **«call»**: Represents a call relationship between methods or components.
  - **«create»**: Indicates that one class creates instances of another.

#### **10. System**
- **Meaning**: Represents the system boundary in a use case diagram.
- **Applies To**: Use case diagrams.
- **Example**: `«system» E-commerce Platform`.

#### **11. Subsystem**
- **Meaning**: Indicates a logically grouped subset of the system.
- **Applies To**: Component and package diagrams.
- **Example**: `«subsystem» PaymentGateway`.

---

### **Custom Stereotypes**
You can define your own stereotypes to suit your domain needs by:
1. Naming the stereotype.
2. Optionally associating attributes or constraints.
3. Applying it consistently in the model.

**Example**: For a banking application:
- `«transaction»` for classes handling transactions.
- `«audit»` for classes handling logging and monitoring.

---

### **Why Use Stereotypes?**
- **Clarity**: They add specific semantic meaning to elements in your diagram.
- **Customization**: They allow for domain-specific modeling.
- **Reusability**: They standardize the model for team understanding.

Let me know if you'd like examples or explanations for a specific stereotype!