# 🎓 Computer Science Graduation Master Checklist

> Obsidian‑friendly, checkbox‑based, practical. Not aspirational — _verifiable_.

---
```dataviewjs
const file = dv.current().file;
const tasks = file.tasks;
const done = tasks.where(t => t.completed).length;
const total = tasks.length;
const percent = total === 0 ? 0 : Math.round((done / total) * 100);

dv.paragraph(`
**Progress:** ${done}/${total} (${percent}%)
<div style="width:100%; background:#333; border-radius:6px; overflow:hidden;">
  <div style="width:${percent}%; background:#4ade80; padding:6px 0;"></div>
</div>
`);
```

## 🧠 Core CS Foundations

### Data Structures
- [x] Arrays & Strings (manual memory reasoning)
- [x] Linked Lists (singly, doubly)
- [x] Stacks & Queues (array + linked impl)
- [ ] Hash Tables (collision handling)
- [ ] Trees (BST, traversal, height, balance)
- [ ] Heaps / Priority Queues
- [ ] Graphs (adj list vs matrix)
- [ ] Tries (basic use cases) 

### Algorithms
- [ ] Big‑O time & space analysis
- [ ] Sorting (Bubble, Selection, Insertion, Merge, Quick, Heap)
- [x] Searching (Binary, Linear)
- [x] Recursion vs Iteration
- [x] Divide & Conquer
- [ ] Greedy algorithms
- [ ] Dynamic Programming (1D, 2D)
- [ ] Graph algorithms (BFS, DFS)
- [ ] Shortest paths (Dijkstra, Bellman‑Ford – conceptually)
- [ ] MST (Kruskal, Prim – conceptually) 

---

## 💻 Programming Competence

### At Least ONE Primary Language (Deep)
- [ ] Syntax mastery
- [ ] Memory model (stack vs heap)
- [ ] Error handling
- [ ] Writing idiomatic code
- [ ] Debugging without tutorials
- [ ] Implement DS from scratch 

### Secondary Language (Working Knowledge)
- [ ] Read & understand code
- [ ] Write small utilities
- [ ] Use core libraries 

---

## 🧱 Object-Oriented Programming
- [x] Encapsulation
- [x] Inheritance
- [x] Polymorphism
- [x] Abstraction
- [x] SOLID principles
- [x] Interfaces vs Abstract classes
- [x] Composition over inheritance 

---

## 🖥️ Operating Systems
- [ ] Processes vs Threads
- [ ] Context switching
- [ ] CPU scheduling basics
- [ ] Deadlocks (conditions + handling)
- [ ] Memory management
- [ ] Virtual memory
- [ ] Paging vs Segmentation
- [ ] File systems basics
- [ ] User vs Kernel mode 

---

## 🌐 Networking
- [ ] OSI vs TCP/IP models
- [ ] TCP vs UDP
- [ ] HTTP/HTTPS
- [ ] DNS basics
- [ ] IP, ports, sockets
- [ ] Client–server model
- [ ] REST basics 

---

## 🗄️ Databases

### SQL
- [x] SELECT / INSERT / UPDATE / DELETE
- [x] JOINs (INNER, LEFT)
- [x] GROUP BY / HAVING
- [ ] Indexes (why & when)
- [ ] Constraints
- [x] Transactions
- [x] ACID properties 

### Database Design
- [x] ER diagrams
- [x] Primary vs Foreign keys
- [x] Normalization (1NF → 3NF) 

---

## 🧪 Software Engineering
- [x] Requirements → design → implementation
- [x] UML (class, sequence – basic)
- [x] Clean code principles
- [x] Refactoring
- [ ] Design patterns (Singleton, Factory, Observer – conceptually)
- [ ] Testing mindset 

---

## 🔧 Tools Every Graduate Should Handle

### Version Control
- [x] Git init / clone
- [x] Commit discipline
- [x] Branching
- [ ] Merge vs Rebase (conceptual)
- [x] Resolve conflicts
- [ ] GitHub workflow 

### Development Tools
- [ ] Debugger usage
- [x] Build tools (basic)
- [x] Package managers
- [ ] Reading documentation 

---

## 🐧 Linux & Systems
- [x] File system navigation
- [x] Permissions
- [x] Environment variables
- [ ] Shell basics
- [ ] Process monitoring
- [x] Installing software
- [ ] SSH basics 

---

## 🔐 Security Fundamentals
- [x] Hashing vs Encryption
- [x] Authentication vs Authorization
- [x] SQL injection concept
- [x] Input validation
- [x] Secure password storage 

---

## 🧠 Problem Solving (Critical)
- [x] Break problems into subproblems
- [x] Write pseudocode first
- [ ] Edge‑case thinking
- [ ] Time/space tradeoffs
- [x] Solve unseen problems 

---

## 🏗️ Projects (Non‑Negotiable)

### Academic / Personal
- [x] One medium‑size project (multi‑file)
- [ ] One systems‑adjacent project (OS, networking, low‑level)
- [ ] One data‑driven or backend project 

### Project Quality
- [ ] README with clear explanation
- [ ] Clean repo structure
- [ ] Meaningful commits
- [ ] Can explain design decisions 

---

## 💼 Career Readiness
- [ ] CV focused on skills & impact
- [ ] GitHub with real projects
- [ ] Explain projects verbally
- [ ] Whiteboard problem solving
- [ ] Behavioral interview readiness 

---

## 🧭 Reality Check (Self‑Assessment)
- [ ] I can learn a new language independently
- [ ] I can read unfamiliar codebases
- [ ] I can debug without panic
- [ ] I understand _why_, not just _how_
- [ ] I can explain concepts clearly 

---

## ✅ Graduation Definition

> You are **ready** when missing knowledge feels _learnable_, not _overwhelming_.