#sw-1 
previous lesson: [[SWE Lecture 2]]
# Requirements Engineering
The requirements for a system are the *descriptions of what the system should do*; the services that it provides and the constraints on its operation. These requirements reflect the needs of customers for a system that serves a certain purpose such as controlling a device, placing an order, or finding information. The process of finding out, analyzing, documenting and checking these services and constraints is called requirements engineering (RE).
The term ‘requirement’ is not used consistently in the software industry. In some cases, a requirement is simply a high-level, abstract statement of a service that a system should provide or a constraint on a system. At the other extreme, it is a detailed, formal definition of a system function.

For large software development contracts, a company must define its needs abstractly to allow multiple contractors to propose different solutions. Once a contractor is selected, they provide a detailed system definition that the client can validate. Both high-level and detailed requirements documents are referred to as _requirements_.

The difference between user and system requirements is important in requirements engineering. _User requirements_ are high-level descriptions, often in natural language, outlining what the system should do and its constraints. _System requirements_ are detailed descriptions of the system's functions, services, and operational constraints, usually included in a contract between the buyer and developers.

Different levels of requirements are useful because they communicate information about the system to different types of readers.
![[Screenshot 2024-10-20 164441.png|center]]
# Functional and non-Functional Requirements

| **Aspect**              | **Functional Requirements**                                              | **Non-Functional Requirements**                                                              |
| ----------------------- | ------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------- |
| **Definition**          | Describes specific behaviors or functions the system must perform        | Describes the system's qualities or attributes, such as performance and usability            |
| **Examples**            | - User login functionality <br>- Payment processing <br>- Search feature | - Performance (response time) <br>- Security <br>- Scalability                               |
| **Focus**               | What the system should do                                                | How the system should perform or behave                                                      |
| **Type of Requirement** | Action-oriented (focuses on services or operations)                      | Quality-oriented (focuses on system properties)                                              |
| **Evaluation**          | Verified by testing specific outputs for given inputs                    | Verified by measuring system attributes like speed or reliability                            |
| **Measurement**         | Easily measurable (e.g., does the feature work?)                         | Harder to measure (e.g., how secure or fast is the system?)                                  |
| **Priority**            | Often considered high priority for system functionality                  | Can vary in importance but critical for system quality and user satisfaction                 |
| **Dependence**          | Essential for system operation and achieving user goals                  | Influences user experience and system performance but doesn’t directly affect specific tasks |
| **Impact of Omission**  | The system may fail to meet core objectives or functionality             | The system may work but might not meet performance or quality expectations                   |
| **Documentation**       | Found in functional specification documents                              | Found in quality, performance, or security specifications                                    |
In reality, the distinction between different types of requirement is not as clear-cut as these simple definitions suggest. A user requirement concerned with security, such as a statement limiting access to authorized users, may appear to be a non-functional requirement. However, when developed in more detail, this requirement may generate other requirements that are clearly functional, such as the need to include user authentication facilities in the system. 
This shows that requirements are not independent and that one requirement often generates or constrains other requirements. The system requirements therefore do not just specify the services or the features of the system that are required; they also specify the necessary functionality to ensure that these services/features are delivered properly

_Imprecision in the requirements specification is the cause of many software engineering problems_. It is natural for a system developer to interpret an ambiguous requirement in a way that simplifies its implementation. Often, however, this is not what the customer wants. New requirements have to be established and changes made to the system. Of course, this delays system delivery and increases costs.
## Functional Requirements
_In principle, the functional requirements specification of a system should be both complete and consistent. Completeness means that all services required by the user should be defined. Consistency means that requirements should not have contradictory definitions._ In practice, for large, complex systems, it is practically impossible to achieve requirements consistency and completeness. One reason for this is that it is easy to make mistakes and omissions when writing specifications for complex systems. Another reason is that there are many stakeholders in a large system. A stakeholder is a person or role that is affected by the system in some way. Stakeholders have different—and often inconsistent—needs. These inconsistencies may not be obvious when the requirements are first specified, so inconsistent requirements are included in the specification. The problems may only emerge after deeper analysis or after the system has been delivered to the customer.

## Non-Functional Requirements
Non-functional requirements (NFRs) are not directly related to the specific services a system provides, but rather to _overall system properties like reliability, performance, and security, or constraints such as hardware capabilities_. NFRs are critical because, while users can often work around inadequate functional requirements, unmet NFRs can render the entire system unusable. For example, an unreliable aircraft system may not be certified as safe, and an embedded system with poor performance may fail to operate correctly.

Unlike functional requirements, _NFRs often impact the system's overall architecture rather than individual components_. For instance, performance requirements might dictate minimizing communication between components. Additionally, NFRs like security may introduce new functional requirements and restrict others.
![[Screenshot 2024-10-20 171419.png|center]]
The figure above shows the classification of non-functional requirements. They can come from different sources:
1. _Product requirements_ These requirements specify or constrain the behavior of the software. __Examples__ include performance requirements on how fast the system must execute and how much memory it requires, reliability requirements that set out the acceptable failure rate, security requirements, and usability requirements. 
2. _Organizational requirements_ These requirements are broad system requirements derived from policies and procedures in the customer’s and developer’s organization. __Examples__ include operational process requirements that define how the system will be used, development process requirements that specify the programming language, the development environment or process standards to be used, and environmental requirements that specify the operating environment of the system. 
3. _External requirements_ This broad heading covers all requirements that are derived from factors external to the system and its development process. __These may include__ regulatory requirements that set out what must be done for the system to be approved for use by a regulator, such as a central bank; legislative requirements that must be followed to ensure that the system operates within the law; and ethical requirements that ensure that the system will be acceptable to its users and the general public.

A common problem with non-functional requirements is that users or customers often propose these requirements as general goals, such as ease of use, the ability of the system to recover from failure, or rapid user response. Goals set out good intentions but cause problems for system developers as they leave scope for interpretation and subsequent dispute once the system is delivered.

# The Software Requirements Document (SRS)
The software requirements document (also called the Software Requirements Specification or SRS) is an official statement outlining what system developers should implement. It includes both user and system requirements, either integrated into a single document or presented separately if the requirements are extensive. This document is essential when an external contractor is developing the system.

Agile development methods, however, argue that requirements change too quickly for formal documentation to remain relevant, with approaches like Extreme Programming collecting requirements incrementally as user stories. While this approach works well in dynamic business environments, a brief supporting document outlining business and dependability requirements is still useful to ensure key system-wide requirements are not overlooked.

The requirements document serves a wide range of users, from senior management funding the system to engineers developing the software, each using it in different ways:
![[Screenshot 2024-10-20 173433.png|center]]
The diversity of possible users means that the requirements document has to be a compromise between communicating the requirements to customers, defining the requirements in precise detail for developers and testers, and including information about possible system evolution. Information on anticipated changes can help system designers avoid restrictive design decisions and help system maintenance engineers who have to adapt the system to new requirements. The level of detail that you should include in a requirements document depends on the type of system that is being developed and the development process used. Critical systems need to have detailed requirements because safety and security have to be analyzed in detail. When the system is to be developed by a separate company (e.g., through outsourcing), the system specifications need to be detailed and precise. If an in- house, iterative development process is used, the requirements document can be much less detailed and any ambiguities can be resolved during development of the system. A possible organization for a requirements document is based on an IEEE standard for requirements documents (IEEE, 1998). This standard is a generic standard that can be adapted to specific uses. In this case, the standard was extended to include information about predicted system evolution. This information helps the maintainers of the system and allows designers to include support for future system features:

| Chapter                           | Description                                                                                                                                                                                                                                                                                                                                                          |
| --------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Preface                           | This should define the expected readership of the document and describe its version history, including a rationale for the creation of a new version and a summary of the changes made in each version.                                                                                                                                                              |
| Intro                             | This should describe the need for the system. It should briefly describe the system’s functions and explain how it will work with other systems. It should also describe how the system fits into the overall business or strategic objectives of the organization commissioning the software                                                                        |
| Glossary                          | This should define the technical terms used in the document. You should not make assumptions about the experience or expertise of the reader                                                                                                                                                                                                                         |
| User Requirements definition      | Here, you describe the services provided for the user. The non-functional system requirements should also be described in this section. This description may use natural language, diagrams, or other notations that are understandable to customers. Product and process standards that must be followed should be specified                                        |
| System Arch.                      | This chapter should present a high-level overview of the anticipated system architecture, showing the distribution of functions across system modules. Architectural components that are reused should be highlighted                                                                                                                                                |
| System requirements Specification | This should describe the functional and non-functional requirements in more detail. If necessary, further detail may also be added to the non-functional requirements. Interfaces to other systems may be defined.                                                                                                                                                   |
| System Models                     | This might include graphical system models showing the relationships between the system components, the system, and its environment. Examples of possible models are object models, data-flow models, or semantic data models                                                                                                                                        |
| System Evolution                  | This should describe the fundamental assumptions on which the system is based, and any anticipated changes due to hardware evolution, changing user needs, and so on. This section is useful for system designers as it may help them avoid design decisions that would constrain likely future changes to the system                                                |
| Appendices                        | These should provide detailed, specific information that is related to the application being developed; for example, hardware and database descriptions. Hardware requirements define the minimal and optimal configurations for the system. Database requirements define the logical organization of the data used by the system and the relationships between data |
| Index                             | Several indexes to the document may be included. As well as a normal alphabetic index, there may be an index of diagrams, an index of functions, and so on                                                                                                                                                                                                           |
requirements document will leave out many of detailed chapters suggested above. The focus will be on defining the user requirements and high-level, non-functional system requirements. In this case, the designers and programmers use their judgment to decide how to meet the outline user requirements for the system. However, when the software is part of a large system project that includes interacting hardware and software systems, it is usually necessary to define the requirements to a fine level of detail. This means that the requirements documents are likely to be very long and should include most if not all of the chapters shown in the table. For long documents, it is particularly important to include a comprehensive table of contents and document index so that readers can find the information that they need
# Requirements Specification
The **requirements specification** process involves documenting user and system requirements in a way that is clear, unambiguous, and understandable. Ideally, the requirements should be complete and consistent, though this is challenging due to different interpretations and conflicts between stakeholders. 

- **User requirements** should outline both functional and non-functional requirements in a way that is understandable to non-technical users, focusing only on the external behavior of the system without using technical jargon or detailed system architecture. Natural language, simple tables, forms, and diagrams are recommended for clarity.
  
- **System requirements** are more detailed versions of user requirements and are used by engineers as the basis for system design. They describe the system's behavior and constraints and may be part of the contractual agreement for implementation. While the system requirements ideally focus only on external behavior, in practice, design information is often included due to the complexity of the system. 

Three reasons for including design details in the system requirements:
1. An initial architecture may be needed to structure the requirements and facilitate reuse of components.
2. Systems often need to integrate with existing systems, which imposes design constraints.
3. Specific architectures may be required to meet non-functional requirements, such as reliability or safety, especially when mandated by external regulators.

# Requirements Engineering Processes
![[Screenshot 2024-10-20 175911.png|center]]
Requirements engineering involves four key activities: 

1. **Feasibility study**: Assessing if the system is useful to the business.
2. **Elicitation and analysis**: Discovering requirements.
3. **Specification**: Converting the requirements into a standard form.
4. **Validation**: Ensuring the requirements accurately reflect what the customer wants.

Although these activities are often presented as sequential, requirements engineering is actually an iterative process where they are interleaved. The spiral model illustrates this, with each iteration focusing on different aspects of the system. Early stages prioritize high-level business, non-functional, and user requirements, while later stages delve into detailed system requirements. The number of iterations varies depending on the project and development approach.

Structured methods, such as object-oriented analysis, help define system models like use cases that specify system behavior. However, requirements engineering involves more than just structured methods, as requirements elicitation is a human-centered process that may resist rigid modeling constraints. Additionally, requirements often change due to evolving user understanding, organizational shifts, or system changes, necessitating **requirements management** to handle these adjustments.
# Requirements Elicitation and Analysis
The **requirements elicitation and analysis** phase is the second stage of the requirements engineering process, following the initial feasibility study. During this phase, software engineers collaborate with stakeholders (including customers, end-users, engineers, and others) to gather and analyze the system's needs, its application domain, required services, and performance constraints. Stakeholders influence the system's requirements directly or indirectly, and their input is essential for capturing both functional and non-functional requirements.
![[Screenshot 2024-10-20 180821 1.png|center]]
The elicitation and analysis process involves four key activities:

1. *Requirements Discovery*: This involves interacting with stakeholders to identify their needs and expectations for the system, including domain-specific requirements. Various techniques can be used to uncover these requirements.
   
2. *Requirements Classification and Organization*: After gathering requirements, they are grouped and structured into coherent clusters. This often involves using a system architecture model to assign requirements to different sub-systems.

3. *Requirements Prioritization and Negotiation*: Conflicts between stakeholder requirements are common. This activity focuses on prioritizing the requirements and resolving conflicts through negotiation and compromise between stakeholders.

4. *Requirements Specification*: The agreed-upon requirements are documented. This is an iterative process, and feedback from each step informs further rounds of discovery and clarification until a complete requirements document is created.

**Challenges in requirements elicitation** include:
- Stakeholders often struggle to articulate specific requirements.
- Stakeholders may express requirements based on implicit knowledge, which requirements engineers may not fully understand.
- Different stakeholders may have conflicting requirements or express them in various ways.
- Political factors and changing business environments can complicate the process, with new stakeholders or requirements emerging over time.

To address conflicts and changing priorities, stakeholder negotiations are essential to ensure compromise and alignment. At the specification stage, requirements are documented, either in an early version of the system requirements document or using more flexible methods like cards, which are easy to handle, modify, and organize for further refinement.
# Requirements Validation
**Requirements validation** ensures that the system’s requirements accurately reflect what the customer really wants, helping to avoid costly changes during development. This process involves identifying problems or gaps in the requirements through a series of checks and techniques. Key types of checks include:

1. **Validity checks**: Ensures the system fulfills real user needs by revisiting assumptions about functionality.
2. **Consistency checks**: Detects and resolves any contradictions or conflicts in the requirements.
3. **Completeness checks**: Verifies that all necessary functions and constraints are included.
4. **Realism checks**: Ensures the requirements can be practically implemented within budget, time, and technology constraints.
5. **Verifiability**: Ensures requirements are testable to avoid disputes and verify correct implementation.

Common **validation techniques** include:
1. **Requirements reviews**: Systematic team analysis to find errors and inconsistencies.
2. **Prototyping**: Creating a working model to let users experiment and confirm it meets their needs.
3. **Test-case generation**: Developing tests during validation to ensure the requirements can be practically implemented.

You should not underestimate the problems involved in requirements validation. Ultimately, it is difficult to show that a set of requirements does in fact meet a user’s needs. Users need to picture the system in operation and imagine how that system would fit into their work. It is hard even for skilled computer professionals to perform this type of abstract analysis and harder still for system users. As a result, you rarely find all requirements problems during the requirements validation process. It is inevitable that there will be further requirements changes to correct omissions and misunderstandings after the requirements document has been agreed upon
![[Screenshot 2024-10-20 182144.png|center]]
# Requirements Management
**Requirements management** is essential in software development, especially for large systems where requirements are constantly changing. This necessity arises from various factors, particularly the nature of _"wicked"_ problems—complex issues that are not completely defined, leading to incomplete requirements. Here's a breakdown of the reasons for changes in requirements and the importance of effective requirements management:

### Reasons for Requirement Changes

1. **Dynamic Environment**: 
   - The business and technical environments evolve after installation. Changes can include new hardware, system interfaces, changing business priorities, and new legislation, all of which may necessitate adjustments to the system.

2. **Diverse Stakeholders**: 
   - The system's customers (those funding the project) and end-users (those interacting with the system) often have different, sometimes conflicting, requirements. After the system is delivered, additional features may need to be added to satisfy user needs.

3. **Conflicting User Needs**: 
   - Large systems typically cater to a diverse user base, each with unique priorities and requirements. As users gain experience with the system, they may realize that the original balance of features must shift to accommodate changing needs.

### Importance of Requirements Management

- **Tracking Changes**: 
  - It involves keeping track of individual requirements, understanding how they interrelate, and assessing the impact of proposed changes.

- **Formal Process**: 
  - A structured approach is necessary for making change proposals, ensuring that all stakeholders are aware of and agree to modifications.

- **Proactive Planning**: 
  - Requirements management should begin early, ideally during the requirements elicitation phase, to set a foundation for handling future changes efficiently.

By establishing a robust requirements management process, software development teams can better adapt to changes, minimize rework costs, and enhance the system’s alignment with user needs and organizational goals.

# Requirements Management Planning
**Requirements management planning** is a crucial phase in the software development lifecycle that involves outlining how to handle changes to requirements throughout the project's duration. This proactive approach helps ensure that requirements are understood, tracked, and controlled effectively. Here’s an overview of the key components of requirements management planning:

### Key Components of Requirements Management Planning

1. **Establishing a Requirements Management Process**:
   - Define the steps for managing requirements, including how to propose changes, review them, and communicate decisions.
   - Identify roles and responsibilities for team members involved in requirements management.

2. **Requirements Traceability**:
   - Create a traceability matrix to link requirements to their sources, design components, and test cases. This helps assess the impact of changes and ensures that all requirements are addressed in development and testing.

3. **Change Control Procedures**:
   - Develop a formal process for requesting, evaluating, and approving changes to requirements. This should include:
     - Change request forms.
     - Criteria for evaluating change impacts on project scope, timeline, and resources.
     - Approval workflows involving relevant stakeholders.

4. **Communication Plan**:
   - Define how updates and changes to requirements will be communicated to stakeholders. This includes:
     - Regular meetings for requirement discussions.
     - Documentation updates (e.g., revised requirements documents).
     - Communication channels (e.g., email, project management tools).

5. **Documentation**:
   - Maintain clear and concise documentation of requirements and any changes made throughout the project. This can include:
     - Requirements specifications.
     - Meeting notes from discussions regarding requirements.
     - Version control for all documentation.

6. **Stakeholder Involvement**:
   - Identify key stakeholders and their roles in the requirements management process. Ensure they are engaged in discussions about changes and their implications.

7. **Training and Tools**:
   - Provide training for team members on the requirements management process and tools. This may include software for tracking requirements, managing change requests, and ensuring traceability.

8. **Monitoring and Review**:
   - Establish regular reviews of requirements to ensure they remain relevant and aligned with project goals. Monitor the effectiveness of the requirements management process and adjust as necessary.

### Benefits of Requirements Management Planning

- **Reduces Misunderstandings**: Clear processes help prevent miscommunications about requirements among stakeholders.
- **Minimizes Costs**: Early identification and management of changes can reduce rework and associated costs later in the development cycle.
- **Enhances Quality**: Well-managed requirements lead to better alignment with user needs, improving the overall quality and usability of the system.
- **Supports Agile Development**: A robust requirements management plan can facilitate agile methodologies by enabling teams to adapt quickly to changing requirements while maintaining clarity.

By implementing a comprehensive requirements management plan, organizations can ensure that they are better equipped to handle the inevitable changes that arise during software development, ultimately leading to more successful project outcomes.


# K E Y P O I N T S
* Requirements for a software system set out what the system should do and define constraints on its operation and implementation.
* Functional requirements are statements of the services that the system must provide or are descriptions of how some computations must be carried out.  
* Non-functional requirements often constrain the system being developed and the development process being used. These might be product requirements, organizational requirements, or external requirements. They often relate to the emergent properties of the system and therefore apply to the system as a whole.
* The software requirements document is an agreed statement of the system requirements. It should be organized so that both system customers and software developers can use it. 
* The requirements engineering process includes a feasibility study, requirements elicitation and analysis, requirements specification, requirements validation, and requirements management. 
* Requirements elicitation and analysis is an iterative process that can be represented as a spiral of activities—requirements discovery, requirements classification and organization, requirements negotiation, and requirements documentation. 
* Requirements validation is the process of checking the requirements for validity, consistency, completeness, realism, and verifiability. 
* Business, organizational, and technical changes inevitably lead to changes to the requirements for a software system. Requirements management is the process of managing and controlling these changes


Next lesson: [[SWE lecture 4]]