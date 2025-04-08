#db1 
# ERD -> Relational model
![[5-ER_Mapping.pdf]]
Transforming an **Entity-Relationship (ER) Model** into a **Relational Model** involves mapping entities, relationships, and attributes into tables (relations) suitable for a relational database. Below is a step-by-step explanation of the process:

---

### 1. **Entities → Relations**

Each entity in the ER model becomes a table in the relational model.

- **Strong Entities**: For a strong entity, create a table with the same name as the entity. Each attribute of the entity becomes a column, and the primary key (PK) is chosen based on the unique identifier of the entity.
    
    **Example**:  
    Entity: `Student(StudentID, Name, Age)`  
    Relational Table:
    
    ```
    Student(
        StudentID PRIMARY KEY,
        Name,
        Age
    )
    ```
    
- **Weak Entities**: For a weak entity, create a table that includes all its attributes and the primary key of its related strong entity as a foreign key (FK). The combination of these keys forms the composite primary key.
    
    **Example**:  
    Weak Entity: `Dependent(Name, Age, EmpID)` (dependent of `Employee`)  
    Relational Table:
    
    ```
    Dependent(
        Name,
        Age,
        EmpID FOREIGN KEY REFERENCES Employee(EmpID),
        PRIMARY KEY (Name, EmpID)
    )
    ```
    

---

### 2. **Relationships → Relations**

Relationships between entities are represented based on their cardinality.

#### a) **1:1 Relationships**

- Add the primary key of one entity as a foreign key in the table of the other.
    
- Alternatively, combine the two entities into a single table if the relationship is mandatory on both sides.
    
    **Example**:  
    `Employee` (EmpID, Name)  
    `Department` (DeptID, DeptName)  
    Relationship: Each employee manages one department (and vice versa).
    
    ```
    Employee(
        EmpID PRIMARY KEY,
        Name,
        DeptID FOREIGN KEY REFERENCES Department(DeptID)
    )
    ```
    

#### b) **1:N Relationships**

- Add the primary key of the "1" side as a foreign key in the table of the "N" side.
    
    **Example**:  
    `Employee` (EmpID, Name)  
    `Department` (DeptID, DeptName)  
    Relationship: Each department has multiple employees.
    
    ```
    Employee(
        EmpID PRIMARY KEY,
        Name,
        DeptID FOREIGN KEY REFERENCES Department(DeptID)
    )
    ```
    

#### c) **M:N Relationships**

- Create a new table to represent the relationship. Include the primary keys of both participating entities as foreign keys and composite primary keys.
    
    **Example**:  
    `Student` (StudentID, Name)  
    `Course` (CourseID, Title)  
    Relationship: Students enroll in courses.
    
    ```
    Enrollment(
        StudentID FOREIGN KEY REFERENCES Student(StudentID),
        CourseID FOREIGN KEY REFERENCES Course(CourseID),
        EnrollmentDate,
        PRIMARY KEY (StudentID, CourseID)
    )
    ```
    

---

### 3. **Attributes**

- **Simple Attributes**: Map directly as columns in the corresponding table.
    
- **Composite Attributes**: Decompose into individual columns.
    
    **Example**:  
    Attribute: `FullName(FirstName, LastName)`  
    Table: `Student(FirstName, LastName, ...)`
    
- **Multivalued Attributes**: Create a separate table to store these values, including a foreign key to the original entity.
    
    **Example**:  
    Entity: `Employee(EmpID, Skills)`  
    Relational Tables:
    
    ```
    Employee(
        EmpID PRIMARY KEY,
        Name
    )
    
    EmployeeSkills(
        EmpID FOREIGN KEY REFERENCES Employee(EmpID),
        Skill,
        PRIMARY KEY (EmpID, Skill)
    )
    ```
    

---

### 4. **Generalization and Specialization**

- **Generalization**: Create a single table with all attributes of the parent and child entities. Use a discriminator column to identify the type.
    
- **Specialization**: Create separate tables for each specialized entity, including a copy of the primary key from the parent table.
    
    **Example**:  
    General Entity: `Person(PersonID, Name)`  
    Specialized Entities: `Student(PersonID, GPA)` and `Teacher(PersonID, Subject)`
    
    Relational Tables:
    
    ```
    Person(
        PersonID PRIMARY KEY,
        Name
    )
    
    Student(
        PersonID PRIMARY KEY FOREIGN KEY REFERENCES Person(PersonID),
        GPA
    )
    
    Teacher(
        PersonID PRIMARY KEY FOREIGN KEY REFERENCES Person(PersonID),
        Subject
    )
    ```
    

---

### 5. **Normalization**

After mapping the ER model to a relational model, normalize the tables (if needed) to eliminate redundancy and ensure the design adheres to 1NF, 2NF, 3NF, etc.

---

### Summary

- **Entities → Tables**
- **Attributes → Columns**
- **Relationships → Tables or Foreign Keys**
- **Multivalued Attributes → Separate Tables**
- **Normalization** ensures minimal redundancy and dependency issues.