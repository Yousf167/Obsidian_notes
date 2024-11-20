#db1 
![[3--Relational-Data-Model.pdf]]
In relational databases, keys are crucial for organizing, structuring, and maintaining data integrity. Here are the main types:

1. **Primary Key**  
   - Uniquely identifies each row in a table.
   - Cannot contain `NULL` values.
   - Each table typically has only one primary key.

2. **Foreign Key**  
   - Enforces a link between two tables.
   - Points to a primary key in another table, establishing a relationship.
   - Used to maintain referential integrity.

3. **Candidate Key**  
   - A minimal set of columns that can uniquely identify each row.
   - A table can have multiple candidate keys, but one of them will be chosen as the primary key.

4. **Alternate Key**  
   - A candidate key that is not chosen as the primary key.
   - Helps maintain data integrity and can be used in querying.

5. **Composite Key**  
   - Consists of two or more columns to uniquely identify rows.
   - Used when a single column is insufficient to ensure uniqueness.

6. **Unique Key**  
   - Ensures all values in a column or group of columns are unique across rows.
   - Allows only one `NULL` value (differs from the primary key, which allows none).

7. **Surrogate Key**  
   - A synthetic key, often an auto-incrementing number.
   - Has no business meaning and is typically used as a unique identifier for each row.

These keys form the foundation of relational database structure, ensuring efficient data retrieval, consistency, and integrity.

Here’s how each of these keys might look in a simple table:

| EmployeeID (Primary Key) | DepartmentID (Foreign Key) | EmployeeNumber (Unique Key) | FirstName | LastName | Email (Alternate Key) | Country | StartDate |
|--------------------------|----------------------------|-----------------------------|-----------|----------|-----------------------|---------|-----------|
| 1                        | 10                         | 1001                        | John      | Doe      | john.doe@example.com  | USA     | 2023-01-01 |
| 2                        | 20                         | 1002                        | Jane      | Smith    | jane.smith@example.com| UK      | 2023-02-10 |
| 3                        | 10                         | 1003                        | Sam       | Johnson  | sam.johnson@example.com| Canada  | 2023-03-15 |

### Explanation:
- **Primary Key**: `EmployeeID` uniquely identifies each employee in the table.
- **Foreign Key**: `DepartmentID` links to a primary key in a separate `Departments` table, establishing a relationship between employees and departments.
- **Unique Key**: `EmployeeNumber` ensures a unique identifier across all rows and allows only one `NULL` (if NULLs are allowed).
- **Alternate Key**: `Email` is unique and could serve as another candidate for the primary key.
  
This table could also have a **Composite Key** if, for example, `FirstName` and `LastName` together uniquely identified employees. A **Surrogate Key** could be added (like an auto-incremented `RecordID`) if a simple unique identifier is needed without business context.
# The Super Key
A **Super Key** is essentially any combination of columns that can uniquely identify a row in a table. It includes all candidate keys and primary keys but is not limited to the minimal columns required for uniqueness.

### How it fits in:

- **Super Key**: Any set of one or more columns that can uniquely identify a row. This includes:
  - Primary Key (e.g., `EmployeeID`)
  - Candidate Keys (e.g., `EmployeeNumber` or `Email` in our previous example)
  - Composite Keys (like `FirstName` + `LastName` if they’re unique)

In practice, a super key can contain extra, non-essential columns. For instance, if `EmployeeID` is the primary key, then both `{EmployeeID, DepartmentID}` and `{EmployeeID, Email}` are also super keys since they still uniquely identify each row. However, only `EmployeeID` (the minimal identifier) is a candidate key and primary key.

### Key Distinctions:
- **Primary Key**: Minimal, unique identifier (and a super key).
- **Candidate Key**: Minimal subset of a super key that can uniquely identify each row.
- **Super Key**: Broadest type; any set of columns (including extras) that can uniquely identify each row.

So, super keys are helpful in theory for understanding all possible ways to uniquely identify rows, while candidate keys and primary keys are typically the ones implemented in database design to enforce data integrity with minimal redundancy.


# Constraints
## 1. Categories of Constraints
- **Inherent Model-Based Constraints** (Implicit)
     - No two tuples can have the same values.
- **Schema-Based Constraints** (Explicit)
     - Domain constraints
     - Key constraints
     - Constraints on NULL
     - Entity integrity constraints
     - Referential integrity constraints
- **Application-Based Constraints** (Semantic/Business Rules)
     - Example: Different salary ranges for employees vs. managers.

## 2. Schema-Based Constraints
- **Domain Constraints**
	- Each attribute must be an atomic value from its specified domain.
	- Can be enforced through:
	- Data types (e.g., numeric, boolean, character).
	- Sub-range of values.
	- Enumerated types listing all possible values.
- **Key Constraints**
	- *Superkey*: Unique values for a set of attributes, may contain redundant attributes.
	- *Key*: A minimal superkey without redundant attributes.
	- *Candidate Key*: A relation schema can have multiple keys.
	- *Primary Key*: Chosen from candidate keys, must not contain NULL.
	- *Unique Key*: Other candidate keys besides the primary key.
- **Entity Integrity Constraints**
     - Primary key values cannot be NULL.
- **Referential Integrity Constraints**    
	- Defined between two relations using foreign keys.
- **Foreign Key Rules**:
	- FK attributes have the same domain as PK attributes.
	- FK value in one tuple must appear as PK in another or be NULL.

## 3. Constraints Violations and Operations
- **Insert Operation**
	- Violations: Domain, Key, Entity Integrity, Referential Integrity.
- **Delete Operation**
	- Violations: Referential Integrity (can restrict, cascade, or set NULL/default).
- **Update Operation**
	- Violations: Similar issues as insert/delete, depending on attribute type (e.g., primary/foreign key).

# terms and concepts

1. **Relation**: In a relational model, a "relation" is essentially a table in a database, consisting of rows and columns. Each _row (tuple)_ represents a unique entry, and each _column (attribute)_ holds data about that entry.
2. **Attribute**: An attribute is a _column_ in a table, representing a specific piece of data (like "Name" or "Age").
3. **Tuple**: A tuple is a single row in a table, representing a complete _record_ (for example, all data related to one student or employee).
5. __Degree__: The number of attributes
6. **Domain**: This is the set of possible values that an attribute can have. For example, a "Gender" attribute might have a domain of {"Male", "Female", "Other"}.
7. **Primary Key**: A unique identifier for each row in a table. For example, a "Student ID" that is unique for each student ensures no two rows are identical.
8. **Foreign Key**: An attribute in one table that links to the primary key of another table, establishing a relationship between the two tables.
9. **Entity Integrity**: Ensures that each row has a unique primary key and that no primary key is null.
10. **Referential Integrity**: Ensures that a foreign key value in one table corresponds to a valid primary key in another table, maintaining consistency across relations.
11. **Schema**: The blueprint or structure of a database, defining how data is organized, including tables, attributes, and relationships.
12. **Insert, Update, Delete Operations**: Basic actions that change data in tables—adding new data (insert), modifying existing data (update), and removing data (delete).

| **Formal Term** | **Alternative 1** | **Alternative 2** |
| --------------- | ----------------- | ----------------- |
| Relation        | Table             | File              |
| Tuple           | Row               | Record            |
| Attribute       | Column            | Field             |
