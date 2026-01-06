$$
\def\ojoin{\rule[-.02ex]{.25em}{.4pt}\llap{\rule[.45em]{.25em}{.4pt}}}
\def\leftouterjoin{\mathbin{\ojoin\mkern-5.8mu\bowtie}}
\def\rightouterjoin{\mathbin{\bowtie\mkern-5.8mu\ojoin}}
\def\fullouterjoin{\mathbin{\ojoin\mkern-5.8mu\bowtie\mkern-5.8mu\ojoin}}
$$
this subject is based on [[Database-1]]

## PDFs
### Lectures
1.  [[1.-Recap-of-database.pdf]]
2. [[2.-EERD.pdf]]
3. [[3-Disk-Storage-and-Basic-File-Structures.pdf]]
4. [[4-Indexing-Structures-for-Files.pdf]]
5. [[5-Relational-Algebra-I.pdf]]
6. [[6.-Relational-Algebra-II.pdf]]
7. [[7.-Strategies-for-Query-Processing.pdf]]
8. [[8.-Query-Optimization.pdf]]
9. [[9.-Transaction-Processing.pdf]]
10. [[10.-Recoverability-and-serializability.pdf]]
11. [[11.-Distributed-Databases.pdf]]

---

# Chapter 3
### **I. Storage Hierarchy & Characteristics**

- **Primary Storage:** Fastest, most expensive, and **volatile** (data lost on power off). Includes **Cache** (Static RAM) and **Main Memory** (DRAM).
- **Secondary Storage:** Non-volatile. Includes **Flash Memory** (SSD/USB), **Magnetic Disks** (HDD), and **Solid-state drives**.
- **Tertiary Storage:** Used for offline archiving; larger capacity but slowest access. Includes **Optical Disks** and **Magnetic Tapes**.

### **II. Physical Disk Structure**

- **Organization:** Disks are divided into concentric circles called **tracks**, which are further subdivided into **blocks or sectors**.
- **Cylinder:** Formed by the set of tracks at the same radius across a disk pack.
- **Data Transfer:** Data is transferred in units of **disk blocks**. **Formatting** divides tracks into equal-sized blocks separated by **interblock gaps**.
- **Buffering:** A reserved area in RAM used to store copies of disk blocks to speed up processing.
    - **Buffer Manager:** If a requested block is in the buffer, it provides the memory address; if not, it allocates space and reads the block from the disk.
    - **Replacement Strategies:** To free buffer space, managers use **LRU** (Least Recently Used), **FIFO** (First-In-First-Out), or the **Clock policy**.

### **III. Record & File Organization**

- **Record Blocking:**
    - **Unspanned:** Records are not allowed to cross block boundaries.
    - **Spanned:** Used if a record is larger than a single block; a pointer at the end of the first block points to the remainder of the record in the next block.
- **Basic File Organizations:**
    - **Heap (Unordered):** Records are placed in order of insertion. Searching requires a **linear search**, accessing an average of **$b/2$ blocks**.
    - **Sorted (Ordered):** Records are sorted by an **ordering field**. Finding a specific record can use **binary search**, requiring **$log_2 b$ blocks**.
    - **Hashed:** A **hash function** maps a search key to a disk block address.

### **IV. Hashing & Collision Resolution**

- **Collision:** Occurs when a new record hashes to a block that is already full.
- **Resolution Techniques:**
    - **Progressive Overflow (Open Addressing):** Checks subsequent positions in order until an empty spot is found.
    - **Chaining:** Uses pointers to link a full primary location to an overflow area.
    - **Multiple Hashing:** Applies a second hash function to find an overflow address if the first is occupied.

### **V. RAID Technology (Redundant Array of Independent Disks)**

**Goal:** To improve disk speed, access time, and reliability through **data striping** and **redundancy**.

- **Level 0:** Data striping for speed; no redundancy.
- **Level 1:** **Mirroring** (shadowing); data is duplicated on two disks.
- **Level 2:** Hamming codes for error detection and correction.
- **Level 3:** Single parity disk.
- **Levels 4 & 5:** Block-level striping; Level 5 uses **distributed parity** across all disks.
- **Level 6:** Uses **P+Q redundancy** to protect against up to two disk failures.

---

# Chapter 4
### **I. Fundamentals of Indexing**

- **Purpose:** Indexes are auxiliary files used to make searching for records in a data file more efficient.
- **Structure:** An index is a file of entries containing a **<field value, pointer to record/block>** pair.
- **Storage:** Index files are usually much smaller than the data file, occupying fewer disk blocks.
- **Search Method:** Performing a **binary search** on the index yields a pointer to the actual data record.
- **Index Density:**
    - **Dense Index:** Contains an entry for **every search key value** (and thus every record) in the data file.
    - **Sparse (Non-dense) Index:** Contains entries for only **some** of the search values.

### **II. Types of Single-Level Ordered Indexes**

|Index Type|Data File Ordering|Indexing Field|Density|Block Anchoring|
|:--|:--|:--|:--|:--|
|**Primary**|Ordered|Key Field|Sparse|Yes|
|**Clustering**|Ordered|Non-key Field|Sparse|Yes/No|
|**Secondary**|Unordered|Key/Non-key|Dense|No|

- **Primary Index:** Defined on an ordered data file's **primary key**. It uses a **block anchor** (the key value of the first record in a block) for each entry.
- **Clustering Index:** Defined on an ordered data file's **non-key** field (where multiple records can share the same value). It contains one entry for each **distinct value** of the field, pointing to the first block containing that value.
- **Secondary Index:** Provides an additional access path for fields that are **not** the ordering field of the data file. It includes one entry for every record, making it a **dense** index.

### **III. Multilevel Indexes**

- **Concept:** If an index file is large and occupies many blocks, a **primary index to the index itself** is created.
- **Hierarchy:** The original index becomes the **first-level** index, and the index to that file is the **second-level** (top-level) index.
- **Constraint:** This process repeats until the top-level index fits into a **single disk block**.

### **IV. Dynamic Multilevel Indexes (B-Trees & B+ Trees)**

These structures are used because standard multilevel indexes face performance issues during insertions and deletions.

- **Node Rules:** Each node corresponds to one **disk block** and is kept between **half-full and completely full**.
- **B-Tree:**
    - Pointers to data records exist at **all levels** of the tree.
    - Internal nodes contain search values, data pointers, and tree pointers.
- **B+ Tree:**
    - **All pointers to data records** exist only in the **leaf-level nodes**.
    - Internal nodes only contain search values and tree pointers to guide the search.
    - Leaf nodes are typically linked together (Pnext) for efficient sequential scanning.
    - **Advantage:** B+ Trees often have **fewer levels** and higher search value capacity than B-Trees.
- **Dynamic Changes:** If a node is full, an insertion causes a **split** into two nodes; if a deletion leaves a node less than half-full, it is **merged** with neighbors.

---

# Chapter 5, 6
### **I. Fundamental Concepts**

- **Definition:** Relational algebra is a basic set of operations for the relational model that enables users to specify **retrieval requests**.
- **Result of Operations:** Each operation produces a **new relation**, allowing for the nesting of operations into complex **relational algebra expressions**.
- **Unary vs. Binary:** Unary operations apply to a single relation (e.g., SELECT, PROJECT), while binary operations involve two relations (e.g., JOIN, UNION).

### **II. Unary Relational Operations**

- **SELECT ($\sigma$):** Used to filter a subset of tuples from a relation that satisfy a specific **Boolean selection condition**.
    - **Properties:** It is **commutative**, meaning $\sigma_{c1}(\sigma_{c2}(R)) = \sigma_{c2}(\sigma_{c1}(R))$. Cascaded selects can be combined into a single selection using **AND**.
- **PROJECT ($\pi$):** Selects specific columns and discards others, creating a **vertical partition**.
    - **Duplicate Elimination:** This operation automatically **removes duplicate tuples** to ensure the result is a valid set.
    - **Properties:** If the projection list includes a **primary key**, the number of resulting tuples will equal the original relation; otherwise, it may be less.
- **RENAME ($\rho$):** Used to provide names for intermediate relations or to change attribute names within a relation.

### **III. Operations from Set Theory**

- **Type Compatibility:** For UNION, INTERSECTION, and SET DIFFERENCE, relations must have the **same number of attributes** and **compatible domains** for corresponding attributes.
- **UNION ($\cup$):** Includes all tuples that are in either relation R, relation S, or both; duplicates are removed.
- **INTERSECTION ($\cap$):** Includes only those tuples that are present in **both** relations.
- **SET DIFFERENCE ($- $):** Includes tuples in R that are **not** in S; unlike union and intersection, this operation is **not commutative**.
- **CARTESIAN PRODUCT ($\times$):** Combines every tuple of R with every tuple of S. If R has $n$ tuples and S has $m$ tuples, the result has **$n \times m$** tuples.

### **IV. Join Operations**

- **JOIN ($\Join$):** Combines related tuples from two relations into single tuples; it is essentially a **Cartesian product followed by a selection**.
- **THETA JOIN ($\Large \Join_{\ \theta}$):** Uses a general join condition (e.g., $<, >, \le, \ge, \neq$) to combine tuples.
- **EQUI-JOIN:** A specific theta join where the only comparison operator used is **equality (=)**.
- **NATURAL JOIN ($*$):** An equijoin that automatically **removes redundant (superfluous) attributes**; it requires join attributes to have the same name in both relations.

### **V. Additional Relational Operations**

- **Aggregate Functions ($\mathfrak{F}$):** Used for statistical queries to summarize information. Common functions include **SUM, AVERAGE, MAXIMUM, MINIMUM, and COUNT**.
- **Grouping:** The $\mathfrak{F}$ operator can be prefixed with a grouping attribute to partition tuples (e.g., calculating the average salary **per department**).
- **OUTER JOINS:** Used to keep all tuples from one or both relations even if they have no matching tuple in the other relation.
    - **Left Outer Join ($\large \rtimes$):** Keeps all tuples from the left relation, padding missing right-side data with **null values**.
    - **Right Outer Join ($\large \ltimes$):** Keeps all tuples from the right relation.
    - **Full Outer Join ($\large \times$):** Keeps all tuples from both relations.

there us no supported latex for the symbols. imagine that the open ends extend horizontally
![[b7014ee220833a6c0d5db3c2e18854a7_MD5.jpg|center]]

---

# Chapter 7

### **I. Query Processing Overview**

- **Definition:** The process of developing algorithms to analyze queries and generate a "good" **execution plan**.
- **Basic Pipeline:**
    1. **Parser:** Checks syntax and verifies relations.
    2. **Query Rewrite:** Translates the query into an internal representation (Query Tree or Graph).
    3. **Query Optimizer:** Selects a suitable execution strategy.
    4. **Code Generator:** Produces the execution plan.
    5. **Execution Engine:** Executes the plan and returns results.
- **Query Blocks:** SQL queries are decomposed into basic units called query blocks (single SELECT-FROM-WHERE expressions), which are then translated into algebraic operators.

### **II. Algorithms for SELECT Operations**

The optimizer chooses a search method based on available indexes and file ordering:

- **S1—Linear Search:** Brute force; applies to any condition or ordering.
- **S2—Binary Search:** For equality comparisons on an **ordered attribute**.
- **S3—Primary Index:** Retrieves a single record for an equality condition on a search-key.
- **S4—Secondary Index:** Retrieves a single record (if a candidate key) or multiple records.
- **S5—Clustering Index:** Used to retrieve multiple records sharing a non-key value.
- **S7—B+ Tree Index:** Efficient for equality comparisons.
- **Selectivity:** The ratio of records satisfying a condition to the total number of records, used by the optimizer to estimate cost.

### **III. Implementing JOIN Operations**

Join is often the most time-consuming operation.

- **J1—Nested-loop Join:** Interleaves records from an outer loop and inner loop.
- **J2—Index-based Nested-loop Join:** Uses an index for the inner input to speed up matching.
- **J3—Sort-merge Join:** Sorts both inputs on the join attribute and then merges them.
- **J4—Hash Join:**
    - **Build Phase:** Creates a hash table for the first table.
    - **Probe Phase:** Hashes the second table's join columns to find matches in the table.
- **Join Selection Factor:** The fraction of records in one file that will join with another, depending on the equijoin condition.

### **IV. Query Optimization: Cost-Based vs. Heuristic**

The goal is to select an execution plan where the **Total Cost ($I/O$ + CPU)** is minimized.

#### **1. Cost-Based Optimization**

- **Primary Cost Measure:** Disk access (number of seeks, blocks read/written) is the predominant and easiest-to-estimate cost.
- **Catalog Statistics:** The optimizer uses metadata like the number of tuples and distinct attribute values to estimate costs.
- **Equivalence Rules:** Used to generate logically equivalent expressions (e.g., commutativity of $\sigma$ and $\pi$) to find cheaper alternatives.

#### **2. Heuristic Optimization**

Uses general rules to improve performance without calculating exact costs:

- **Push Down SELECT/PROJECT:** Perform these as early as possible (move them down the query tree) to reduce the size of intermediate results.
- **Restrictive Operations First:** Execute the most restrictive SELECT and JOIN operations before others.
- **Left-Deep Join Orders:** Favored because they are well-suited for **pipelining**, where intermediate results are passed directly to the next operation rather than written to temporary files.

### **V. Internal Representations**

- **Query Tree:** A tree structure representing a relational algebra expression. Leaf nodes are input relations; internal nodes are operations.
- **Query Evaluation Plan (QEP):** An annotated query tree that specifies the exact algorithm used for each operation (e.g., specifying "use Index 1" for a selection).

---

# Chapter 8
### **I. Fundamentals of Query Optimization**

- **Definition:** The process of choosing a suitable execution strategy to minimize the **Total Cost**, which is the sum of **I/O Cost** (disk access) and **CPU Cost**.
- **Predominant Cost:** Disk access is generally the most significant cost factor and is measured by the number of seeks, blocks read, and blocks written.
- **Search Space:** For a query with $m$ operations, each having $k$ evaluation methods, the search space can reach $(m!) \cdot k$ different execution plans.
- **Internal Representations:**
    - **Query Tree:** A tree structure where **leaf nodes are input relations** and **internal nodes are relational algebra operations**.
    - **Query Graph:** A graph-based representation of the query.
    - **Query Evaluation Plan (QEP):** A specific plan that defines exactly which algorithm is used for each operation (e.g., specifying "use index 1" or "hash join") and how execution is coordinated.

### **II. Heuristic Optimization Rules**

Heuristics improve performance by transforming query trees into equivalent, more efficient versions using general rules of thumb:

1. **Perform SELECT and PROJECT early:** Move these operations as far **down the tree** as possible to reduce the size of intermediate results (reducing the number of tuples and attributes early).
2. **Restrictive Operations First:** Execute the most restrictive SELECT and JOIN operations (those with the smallest result sizes) before others.
3. **Combine Operations:** Convert sequences of Cartesian Product ($\times$) and SELECT ($\sigma$) into **JOIN** ($\bowtie$) operations whenever possible.
4. **Left-Deep Join Orders:** Favor left-deep trees because they are particularly suited for **pipelining**, allowing intermediate results to be passed between operations without being written to temporary files on disk.

### **III. Cost-Based Optimization**

This approach systematically generates equivalent expressions and estimates their costs to find the "cheapest" plan.

- **Catalog Statistics:** The optimizer uses metadata such as the number of tuples in a relation and the number of distinct values for attributes to estimate selectivity and intermediate result sizes.
- **Equivalence Rules:** These rules allow the optimizer to swap operations while maintaining the same result:
    - **Commutativity:** SELECT, JOIN, UNION, and INTERSECTION are commutative (order of operands/conditions doesn't change the result).
    - **Cascading:** Multiple SELECT or PROJECT operations can be combined or split.
    - **Associativity:** JOIN, Cartesian Product, UNION, and INTERSECTION are associative.
- **Join Ordering:** Determining the best order for joins is critical; for $n$ relations, the number of possible join orders grows exponentially (e.g., $n=7$ results in 665,280 possible orders).

### **IV. Summary of Execution Strategies**

- **Pipelining:** A method where the output of one operation is passed directly as input to the next, reducing the need for temporary disk storage.
- **Search Strategies:** Because generating all plans is expensive, optimizers may use **Dynamic Programming** (computing the least-cost order for subsets only once) or **Greedy techniques**.

---

# Chapter 9
### **I. Transaction Basics & Operations**

- **Definition:** A **Transaction** is a process that includes one or more database access operations, such as **Read** (retrieval) or **Write** (modification).
- **Boundaries:** Transactions are marked by **Begin** and **End** boundaries. They can be standalone SQL statements or embedded within a program.
- **Concurrency Modes:**
    - **Interleaved Processing:** Concurrent execution is interleaved on a single CPU.
    - **Parallel Processing:** Processes are executed concurrently across multiple CPUs.
    - **Note:** Basic transaction processing theory generally assumes interleaved concurrency.
- **Basic Operations:**
    - **read_item(X):** Reads item X into a program variable.
    - **write_item(X):** Writes the value of a program variable into database item X.
- **Transaction Types:** A transaction is **read-only** if it does not update the database; otherwise, it is a **read/write** transaction.

### **II. ACID Properties**

All transactions in relational databases must follow the **ACID** properties to ensure data integrity:

- **Atomicity:** The transaction is an atomic unit; it is performed in its entirety or not at all.
- **Consistency Preservation:** A correct execution must take the database from one consistent state to another.
- **Isolation:** Concurrent transactions should appear as if each was executed in isolation from start to finish.
- **Durability (Permanency):** Once committed, changes applied to the database must never be lost due to subsequent failure.

### **III. Transaction States & The System Log**

- **States of Execution:**
    1. **Active:** The initial state where read and write operations are executed.
    2. **Partially Committed:** Operations are finished, but the actual output may still reside in main memory (volatile), making it vulnerable to failure.
    3. **Committed:** Execution concludes successfully, and all changes are permanently recorded.
    4. **Failed:** Reached if the system determines the transaction can no longer proceed; it must be rolled back.
    5. **Terminated:** The transaction leaves the system.
- **System Log:** An append-only file on disk that tracks all operations to permit recovery from failures. It includes entries for **start**, **read**, **write** (storing both old and new values), **commit**, and **abort**.
- **Commit Point:** Reached when all operations have been executed successfully and recorded in the log file on disk.

### **IV. Concurrency Control Problems**

Without proper control, concurrent transactions can lead to several errors:

- **Lost Update Problem:** Occurs when two transactions update the same item, but one update overwrites the other because they both read the original value before updating.
- **Temporary Update (Dirty Read):** Occurs when $T_2$ reads a value updated by $T_1$, but $T_1$ subsequently fails and its update is undone, leaving $T_2$ with incorrect data.
- **Incorrect Summary Problem:** Occurs when a transaction calculates an aggregate function (like SUM) while other transactions are updating the involved records.
- **Unrepeatable Read Problem:** Occurs when a transaction reads the same item twice and receives different values because another transaction updated the item in between the two reads.

### **V. Why Recovery is Needed**

Recovery mechanisms are essential to handle various failure types:

- **System Crashes:** Hardware or software errors that cause the loss of main memory contents.
- **Transaction/System Errors:** Logical errors (division by zero), integer overflow, or user interruptions.
- **Local Errors:** Conditions where data for a transaction cannot be found.
- **Concurrency Control Enforcement:** Aborting a transaction to resolve a **deadlock** or serializability violation.
- **Physical Failures:** Disk head crashes, power failures, or catastrophic events like fire or theft.

---

# Chapter 10
### **I. Fundamentals of Schedules**

- **Schedule:** A sequence of operations from a set of concurrent transactions that **preserves the order of operations** within each individual transaction.
- **Serial Schedule:** A schedule where operations of each transaction are executed consecutively without any interleaved operations from other transactions. These are always considered **correct** because they preserve database consistency.
- **Non-Serial Schedule:** A schedule where operations from concurrent transactions are **interleaved**.
- **Serializable Schedule:** A non-serial schedule is serializable if it produces the **same results as some serial execution**. Non-serializable schedules likely lead to inconsistent database states.

### **II. Characterizing Schedules by Recoverability**

Recoverability ensures that the **Durability** property of the ACID model is not violated; specifically, once a transaction commits, it must never be rolled back.

- **Non-Recoverable Schedule:** A schedule where a committed transaction may have to be rolled back during recovery. For example, if $T_2$ reads a value written by $T_1$ and commits before $T_1$ commits or aborts, the schedule is non-recoverable.
- **Recoverable Schedule:** A schedule is recoverable if no transaction $T$ commits until all transactions $T'$ that wrote an item $T$ reads have committed.
- **Cascadeless Schedule:** A schedule where a transaction $T_2$ cannot **read** an item $X$ until the transaction $T_1$ that last wrote $X$ has committed. This is a subset of recoverable schedules.
- **Strict Schedule:** A schedule where a transaction $T_2$ can **neither read nor write** an item $X$ until the transaction $T_1$ that last wrote $X$ has committed.
    - **Blind Write:** A write operation ($w_2(X)$) not preceded by a read ($r_2(X)$).
    - **Note:** If blind writes are not allowed, all cascadeless schedules are also strict.

### **III. Concurrency Control & Locking**

The purpose of concurrency control is to maintain the **Isolation** property and preserve consistency by ensuring schedules are serializable and resolving read-write/write-write conflicts.

- **Locks:** A variable associated with a data item describing its status regarding possible operations. A transaction must request a lock before an operation and release it upon finishing.
- **Lock Manager:** A DBMS subsystem that manages locks using a **Lock Table** (often implemented as a linked list) to store data item IDs, transaction IDs, and lock modes.
- **Binary Locks:** Can have two states: **locked (1)** or **unlocked (0)**. It enforces **mutual exclusion**, but is considered too restrictive for practical database use.
- **Shared/Exclusive (Read/Write) Locks:**
    - **Shared (Read) Lock:** Several transactions can hold this simultaneously on the same item because read operations do not conflict.
    - **Exclusive (Write) Lock:** Only one transaction can hold this at a time; no other transaction can hold any lock on that item.
- **Lock Conversion:**
    - **Upgrade:** Converting an existing read lock to a write lock (possible only if no other transaction holds a read lock on that item).
    - **Downgrade:** Converting an existing write lock to a read lock.

### **IV. Two-Phase Locking (2PL)**

Simply using locks does not guarantee serializability; transactions must follow a specific protocol regarding the positioning of lock and unlock operations.

- **2PL Protocol:** All locking operations (read_lock, write_lock) must **precede the first unlock operation** in the transaction.
- **Two Phases:**
    1. **Locking (Growing) Phase:** A transaction applies locks one at a time and can upgrade locks; no unlocking is allowed.
    2. **Unlocking (Shrinking) Phase:** A transaction releases locks one at a time and can downgrade locks; no new locks or upgrades are allowed.
- **Theorem:** If every transaction in a schedule follows the 2PL rules, the schedule is **guaranteed to be serializable**.

### **V. Deadlocks**

- **Deadlock:** A "dead end" where two or more transactions are each waiting for locks held by the other.
- **Timeouts:** A practical solution where a transaction waits for a lock only for a system-defined period. If the lock is not granted, the request times out, and the DBMS **aborts and restarts** the transaction.


---
# Chapter 11
### **I. Fundamentals of Distributed Databases (DDB)**

- **Definition:** A DDB is a **collection of multiple logically related databases** distributed over a computer network.
- **DDBMS:** The software that manages a DDB while making the distribution **transparent to the user**, who should see the data as one logical pool.
- **Why Distribute?** Distribution is used to **minimize communication costs**, maintain security, increase **availability** during failures, and handle data sets that are too large for a single machine.
- **Parallel vs. Distributed:**
    - **Parallel systems** focus on improving performance through parallel execution on machines physically close to each other, often sharing memory or disks.
    - **Distributed systems** focus on sharing data and increasing availability across sites that may be globally distant and typically use a **shared-nothing architecture**.

### **II. Distributed Database Design**

Design involves three key issues: **Fragmentation**, **Replication**, and **Allocation**.

- **Fragmentation Types:**
    - **Horizontal:** A subset of tuples (rows) satisfying a selection condition (e.g., all employees in Dept 5).
    - **Vertical:** A subset of columns; every fragment **must include the primary key** to allow for reconstruction.
    - **Mixed:** A combination of both horizontal and vertical methods.
- **Reconstruction Rules:** To rebuild the original relation, a **UNION** is used for horizontal fragments and an **OUTER JOIN** is used for vertical fragments.
- **Fragmentation Rules:**
    1. **Completeness:** All data from the original relation must appear in at least one fragment.
    2. **Reconstruction:** It must be possible to rebuild the original relation using relational operations.
    3. **Disjointness:** Data should not appear in multiple fragments, except for primary keys in vertical fragmentation.

### **III. Data Replication & Allocation**

- **Replication:** Can be **Full** (entire database at every site) or **Partial** (selective parts).
- **Advantages of Replication:** Increases **availability** (if one site fails, others are usable), improves **parallelism**, and reduces data transfer by keeping data local to the user.
- **Disadvantages:** Increases the **cost of updates** (every replica must be updated) and the complexity of concurrency control.
- **Allocation Schema:** This describes the specific distribution of fragments or replicas to various sites.

### **IV. DDBMS Types and Architectures**

DDBMS are differentiated by three factors: **Autonomy** (distribution of control), **Distribution** (physical location of data), and **Heterogeneity** (differences in hardware or data models).

- **Autonomy Levels:** Ranges from tight integration (0) to isolation (2).
- **Distribution Levels:** Includes Client-Server architectures (data at servers, interface at clients) and **Peer-to-Peer** systems where every machine has full DBMS functionality.
- **Heterogeneous Databases:**
    - **Federated:** Different database systems managed through a **single conceptual schema**; sites have minimum local autonomy.
    - **Multi-database:** No global schema; the access schema is **constructed dynamically** as needed by application software.

### **V. Advantages of Distributed Systems**

- **Reliability & Availability:** Reliability refers to system "live time," while availability is the probability that data is accessible at any given interval.
- **Improved Performance:** Data is kept closer to where it is needed most, significantly reducing access time.
- **Scalability:** Allows for **easier expansion** by adding new nodes without changing the entire configuration.
