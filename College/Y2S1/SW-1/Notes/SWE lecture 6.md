#sw-1 
# Use Case Diagrams
Use case diagrams are a visual representation of a system’s functional requirements and the interactions between the system and its users (actors). They focus on what the system does from the user’s perspective, making them useful for communicating requirements in a straightforward manner.
### Purpose
- Model processes and requirements in a temporal manner.
- Represent roles (actors), use cases (functionalities), and their relationships.
- Clarify interactions between users and the system without delving into implementation details.
### Components

1. **Actor**
    - Denoted by: Stick figure with the role name beneath.
    - Represents:
        - A person, external system, or hardware interacting with the system.
        - Examples: Customer, Administrator, Payment Gateway.

2. **Use Case**
    - Denoted by: An ellipse with the label inside or beneath.
    - Represents: A specific functionality or activity of the system.
    - Examples: "Place Order," "Login," "Generate Report."

3. **Association**
    - Denoted by: A solid line connecting an actor to a use case.
    - Represents: Communication between an actor and a use case.
    - Notes:
        - An actor can interact with multiple use cases.
        - A use case can involve multiple actors.

4. **Boundary** (Optional)
    - Denoted by: A rectangle enclosing related use cases.
    - Represents: The scope or boundary of the system.

5. **Generalization**
    - Allows specialization of actors or use cases.
    - Reduces complexity by grouping common functionalities.

6. **\<\<include\>\>**
    - Represents mandatory activities shared among use cases.
    - Example: "Generate Report" use case might include "Authenticate User."

7. **\<\<extend\>\>**
    - Represents optional or conditional functionality.
    - Example: A "Rent a Video" use case might extend to "Add New Member" when the user isn’t already registered.

### Steps to Create Use Case Diagrams

1. Identify actors: Who will use or interact with the system?
2. Identify use cases: What functionalities will the system provide?
3. Define relationships: Connect actors to relevant use cases.
4. Organize use cases into a use case model: Use boundaries and generalizations to simplify.

---

### Example: Self-Service Machine

**Actors:**

- Customer
- Supplier
- Collector

**Use Cases:**

- Buy a product: Customer selects and purchases a product.
- Restock: Supplier replenishes items in the machine.
- Collect Money: Collector retrieves cash from the machine.

**Interactions:**

- Customer interacts with "Buy a Product."
- Supplier interacts with "Restock."
- Collector interacts with "Collect Money."

---