#sw-1 
previous: [[SW lecture 1]]
# Introduction
Software systems are abstract and intangible. They are not constrained by the properties of materials, governed by physical laws, or by manufacturing processes. This simplifies software engineering, as there are no natural limits to the potential of software. However, because of the lack of physical constraints, software systems can quickly become extremely complex, difficult to understand, and expensive to change. There are many different types of software systems, from simple embedded systems to complex, worldwide information systems. It is pointless to look for universal notations, methods, or techniques for software engineering because different types of software require different approaches. Developing an organizational information system is completely different from developing a controller for a scientific instrument. Neither of these systems has much in common with a graphics-intensive computer game. All of these applications need software engineering; they do not all need the same software engineering techniques.
 software failures are a consequence of two factors: 
 1. _Increasing demands_ As new software engineering techniques help us to build larger, more complex systems, the demands change. Systems have to be built and delivered more quickly; larger, even more complex systems are required; systems have to have new capabilities that were previously thought to be impossible. Existing software engineering methods cannot cope and new software engineering techniques have to be developed to meet new these new demands. 
 2. _Low expectations_ It is relatively easy to write computer programs without using software engineering methods and techniques. Many companies have drifted into software development as their products and services have evolved. They do not use software engineering methods in their everyday work. Consequently, their software is often more expensive and less reliable than it should be. We need better software engineering education and training to address this problem.

* Many people think that software is simply another word for computer programs. However, when we are talking about software engineering, _software is not just the programs themselves but also all associated documentation and configuration data that is required to make these programs operate correctly._
* _Professional Software_ must have these dependencies along with it to explain its operation. _Amateur Software_, which is used for personal reasons, doesn't have these dependencies as only the developer is using it; Which leads us to this table:
![[Screenshot 2024-10-15 085059.png|center]]
# Characteristics of good Software:
![[Screenshot 2024-10-15 085803.png|center]]
# Problems with software
there are many different types of software. There is no universal software engineering method or technique that is applicable for all of these. However, there are three general issues that affect many different types of software:
 1. _Heterogeneity_ Increasingly, systems are required to operate as distributed systems across networks that include different types of computer and mobile devices. As well as running on general-purpose computers, software may also have to execute on mobile phones. You often have to integrate new software with older legacy systems written in different programming languages. The challenge here is to develop techniques for building dependable software that is flexible enough to cope with this heterogeneity. 
 2. _Business and social change_ Business and society are changing incredibly quickly as emerging economies develop and new technologies become available. They need to be able to change their existing software and to rapidly develop new software. Many traditional software engineering techniques are time consuming and delivery of new systems often takes longer than planned. They need to evolve so that the time required for software to deliver value to its customers is reduced. 
 3. _Security and trust_ As software is intertwined with all aspects of our lives, it is essential that we can trust that software. This is especially true for remote software systems accessed through a web page or web service interface. We have to make sure that malicious users cannot attack our software and that information security is maintained.

# SWE vs CS vs System Engineering

| Aspect                    | Computer Science (CS)                                                                                 | Software Engineering (SWE)                                                                    | System Engineering                                                                               |
| ------------------------- | ----------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------ |
| **Focus**                 | Theories and methods underlying computing and software systems.                                       | Practical issues related to producing and maintaining software.                               | Development and evolution of complex systems (hardware, software, etc.).                         |
| **Scope**                 | Primarily software, focusing on algorithms, computation, and data structures.                         | Software development lifecycle from design to maintenance.                                    | Entire system lifecycle, including hardware, software, processes, and policies.                  |
| Theoretical Foundation    | Strong emphasis on theoretical concepts like algorithms, computation models, and formal methods.      | Requires understanding of CS theory but focuses on real-world implementation and scalability. | Concerned with overall system behavior, minimal focus on theoretical aspects.                    |
| Primary Objective         | Explore computational theories, optimization, and innovations in software and hardware understanding. | Develop reliable, maintainable, scalable, and efficient software solutions.                   | Ensure overall system integration and functionality across multiple components.                  |
| Scale of Application      | Typically more applicable to small or medium-sized programs.                                          | Focuses on both small-scale and large-scale software systems.                                 | Deals with large, complex systems involving multiple subsystems (software, hardware).            |
| Key Activities            | Research, algorithm design, and development of new computing methods.                                 | Software design, development, testing, and maintenance.                                       | System specification, architecture definition, integration of subsystems.                        |
| Involvement with Hardware | Minimal to none.                                                                                      | Some involvement when software interacts with hardware (e.g., embedded systems).              | Direct involvement with both hardware and software, including system deployment and policies.    |
| Interdisciplinary Work    | Mostly within computing and mathematical disciplines.                                                 | Collaboration with various fields (e.g., project management, testing, design).                | High interdisciplinary focus, working with mechanical, electrical, software, and policy experts. |
| **Output**                | Theories, algorithms, software libraries, and optimizations.                                          | Software products and systems.                                                                | Complex, integrated systems composed of multiple parts (software, hardware, etc.).               |
| **Primary Challenges**    | Exploring computational limits, solving theoretical problems, optimization.                           | Managing software complexity, ensuring reliability and maintainability in large codebases.    | Balancing between system components, ensuring integration and overall functionality.             |
| **Real-world Example**    | Creating algorithms for search engines, data compression, or cryptography.                            | Developing an e-commerce platform, mobile application, or operating system.                   | Building a spacecraft's control system, a smart grid, or an airport control system.              |
# Types of Applications
1. _Stand-alone applications_. These are application systems that run on a local computer, such as a PC. They include all necessary functionality and do not need to be connected to a network. Examples of such applications are __office applications__ on a PC, __CAD programs__, __photo manipulation software__, etc. 
2. _Interactive transaction-based applications_. These are applications that execute on a remote computer and that are accessed by users from their own PCs or terminals. Obviously, these include web applications such as __e-commerce applications__ where you can interact with a remote system to buy goods and services. This class of application also includes __business systems__, where a business provides access to its systems through a web browser or special-purpose client program and cloud-based services, __such as mail and photo sharing__. Interactive applications often incorporate a large data store that is accessed and updated in each transaction. 
2. _Embedded control systems_. These are software control systems that control and manage hardware devices. Numerically, there are probably more embedded systems than any other type of system. Examples of embedded systems include the __software in a mobile (cell) phone, software that controls anti-lock braking in a car, and software in a microwave oven to control the cooking process.__ 
3. _Batch processing systems_. These are business systems that are designed to process data in large batches. They process large numbers of individual inputs to create corresponding outputs. Examples of batch systems include __periodic billing systems__, such as phone billing systems, and __salary payment systems__. 
4. _Entertainment systems_. These are systems that are primarily for personal use and which are intended to entertain the user. Most of these systems are games of one kind or another. The quality of the user interaction offered is the most important distinguishing characteristic of entertainment systems. 
5. _Systems for modeling and simulation_. These are systems that are developed by scientists and engineers to model physical processes or situations, which include many, separate, interacting objects. These are often computationally intensive and require high-performance parallel systems for execution. 
6. _Data collection systems_. These are systems that collect data from their environment using a set of sensors and send that data to other systems for processing. The software has to interact with sensors and often is installed in a hostile environment such as inside an engine or in a remote location.
7. _Systems of systems_. These are systems that are composed of a number of other software systems. Some of these may be generic software products, such as a spreadsheet program. Other systems in the assembly may be specially written for that environment. 

Of course, the boundaries between these system types are blurred. If you develop a game for a mobile (cell) phone, you have to take into account the same constraints (power, hardware interaction) as the developers of the phone software.

The key software engineering fundamentals applicable to all types of software systems are:

1. *Managed Development Process*: Software should be developed using a planned, organized process with clear goals and timelines. Different types of software may require different processes.
2. *Dependability and Performance*: Software should be reliable, secure, efficient, and available when needed, minimizing failures and resource waste.
3. *Requirements Management*: Understanding and managing customer and user expectations is essential to deliver a useful, timely, and budget-friendly system.
4. *Effective Resource Use*: Reuse existing software where possible to save time and resources, instead of creating new solutions from scratch.
# The Software Development Life Cycle
![[Screenshot 2024-11-12 145918.png|center]]
The **Software Development Life Cycle (SDLC)** is a process used to plan, create, test, and deploy software systems. It typically consists of several stages that guide software development from initial concept to deployment and maintenance. Here’s a summary of each stage:

1. **Planning**: Define project goals, gather requirements, assess feasibility, and create a roadmap for development.
2. **Requirements Analysis**: Identify and document functional and non-functional requirements for the software. Stakeholders and developers work together to clarify what the system should do.
3. **Design**: Design the architecture and software components based on requirements. This includes defining databases, interfaces, and system structure.
4. **Implementation (or Coding)**: Write the code for the system according to the design specifications.
5. **Testing**: Validate the software against requirements, perform bug fixes, and ensure that it functions correctly through various testing methods (unit, integration, system, etc.).
6. **Deployment**: Release the software to users or a production environment. This might involve installation, configuration, or making the software available for download.
7. **Maintenance**: After deployment, ongoing updates, bug fixes, and improvements are performed to ensure the software remains functional and relevant.

SDLC helps ensure a systematic and organized approach to software development, improving quality, reducing risks, and managing timelines and costs. Various models (e.g., Waterfall, Agile, V-Model) exist within SDLC to suit different project needs.
![[Screenshot 2024-10-17 180248.png|center]]
![[Screenshot 2024-10-17 180343.png|center]]
# Requirements Engineering
![[Screenshot 2024-10-17 181202.png|center]]
The **Requirements Engineering Process** is a critical part of software development that involves defining, documenting, and maintaining the requirements for a system. It ensures that the software meets the needs of stakeholders and functions as intended. Here’s a summary of the main steps:

1. **Requirements Elicitation**: This is the process of gathering information from stakeholders (clients, users, business analysts, etc.) about what they need from the system. Techniques like interviews, surveys, workshops, and observation are often used.
2. **Requirements Analysis**: After gathering requirements, they are analyzed to resolve conflicts, clarify any ambiguities, and ensure they are complete, consistent, and feasible. This step ensures that the requirements align with business goals and technical constraints.
3. **Requirements Specification**: The requirements are documented in a formal way, usually in the form of a Software Requirements Specification (SRS) document. This includes both functional requirements (what the system should do) and non-functional requirements (performance, security, usability, etc.).
4. **Requirements Validation**: The documented requirements are reviewed with stakeholders to ensure that they accurately represent their needs. Techniques like reviews, prototyping, or testing can be used to confirm that the system requirements are correct.
5. **Requirements Management**: This involves tracking, prioritizing, and managing changes to requirements over time. As the project evolves, new requirements may emerge, and existing requirements may need to be updated, so managing these changes is crucial to project success.

This process ensures that the right system is built and that it meets user and business needs effectively.
# Software Design and Implementation
![[Screenshot 2024-10-17 181850.png|center]]
**Software Design and Implementation** is the phase in software development where the conceptualized system is transformed into a functional product. Here’s a breakdown of both aspects:
## Software Design

1. **High-Level Design (Architecture)**: This involves defining the system’s overall structure, including components, modules, and their interactions. It lays out the system architecture and major components like databases, user interfaces, and external integrations.
2. **Low-Level Design (Detailed Design)**: Focuses on the internal structure of individual modules or components. It includes defining algorithms, data structures, workflows, and the design of specific functions or classes within the system.
3. **Design Patterns**: During the design process, developers may use standardized solutions, called design patterns, to solve common software problems (e.g., MVC, Singleton, Observer patterns).
## Software Implementation

1. **Coding**: The actual writing of code based on the design specifications. Developers implement the functionality using a programming language. Tools such as version control systems (e.g., Git) are used to manage code.
2. **Integration**: Once different modules or components are coded, they are integrated into a cohesive system. This may involve combining different subsystems, interfaces, or external services to ensure they work together.
3. **Code Reviews & Debugging**: During or after the coding process, peer reviews and debugging are performed to catch errors, ensure code quality, and make sure the implementation aligns with the design.
4. **Unit Testing**: At the implementation stage, developers test individual components or units of code to ensure that each part of the system works correctly.

In a nutshell, **Software Design** is about planning and structuring the system, while **Implementation** is about translating that design into working code.
# Software Validation
* Verification and validation (V&V) is intended to show that a system conforms to its specification and meets the requirements of the system customer.
* Involves checking and review processes and system testing.
* System testing involves executing the system with test cases that are derived from the specification of the real data to be processed by the system.
* Testing is the most commonly used V&V activity.

# Stages of Testing 
## 1. Component Testing (or Unit Testing)
- **Scope**: Tests individual components or units of the software, such as functions, methods, classes, or modules.
- **Objective**: Verify that each part works as expected in isolation, independent of other components.
- **Performed By**: Usually by developers during the coding phase.
- **Focus**: Ensures that inputs to the component produce the correct outputs. It often involves testing edge cases and error handling.
## 2. System Testing
- **Scope**: Tests the entire integrated system as a whole, after all components have been combined.
- **Objective**: Validate that the system meets its specified requirements and works correctly across all modules and interfaces.
- **Performed By**: QA teams or testers.
- **Focus**: Ensures that the entire system functions correctly as a complete product. It includes testing interactions between components, overall functionality, and system behavior under various scenarios.
## 3. Acceptance Testing
- **Scope**: Tests the system from the user's perspective, based on the original requirements and real-world scenarios.
- **Objective**: Ensure the software meets the business needs and is ready for deployment to users.
- **Performed By**: End-users or customer representatives.
- **Focus**: Validates that the system delivers the desired outcomes, solves the problem it was intended for, and satisfies the acceptance criteria defined by the client or business. It’s the final step before going live.

In short:
- **Component Testing** ensures that **individual parts** work.
- **System Testing** checks that the **entire system** works together.
- **Acceptance Testing** confirms that the **system works for the user’s needs**.
# K E Y P O I N T S 
* Software engineering is an engineering discipline that is concerned with all aspects of software production. 
* Software is not just a program or programs but also includes documentation. Essential software product attributes are maintainability, dependability, security, efficiency, and acceptability. 
* The software process includes all of the activities involved in software development. The high-level activities of specification, development, validation, and evolution are part of all software processes. 
* The fundamental notions of software engineering are universally applicable to all types of system development. These fundamentals include software processes, dependability, security, requirements, and reuse. 
* There are many different types of systems and each requires appropriate software engineering tools and techniques for their development. There are few, if any, specific design and implementation techniques that are applicable to all kinds of systems. 
* The fundamental ideas of software engineering are applicable to all types of software systems. These fundamentals include managed software processes, software dependability and security, requirements engineering, and software reuse. 
* Software engineers have responsibilities to the engineering profession and society. They should not simply be concerned with technical issues. 
* Professional societies publish codes of conduct that set out the standards of behavior expected of their members.


Next lesson: [[SW Lecture 3]]