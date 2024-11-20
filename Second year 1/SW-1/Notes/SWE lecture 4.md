#sw-1  References: [[Software Engineering - Lecture 4 - System Models.pdf]]
previous lesson: [[SW Lecture 3]]
# The Meaning of The Word "Model"
At its core, the word **“model”** refers to any simplified representation of something—whether it's a system, a concept, or an object—in order to understand, communicate, or work with that thing more easily. The idea is to **capture the essence** without all the detail, focusing on the most important characteristics for a particular purpose. The word generally entails:

1. **Simplification**: A model reduces complexity by omitting unnecessary details, which helps focus on what matters most. For example, a map is a model of a city—it doesn't include every building or tree but focuses on roads and landmarks.

2. **Abstraction**: It represents only the essential features relevant to the context. For instance, an anatomical model of the human body in a classroom doesn’t have all the intricate cell details but instead shows organs and bones to help students learn anatomy.

3. **Purpose-Driven**: A model is designed for a specific goal, like teaching, planning, designing, or predicting. For example, a mathematical model might predict weather patterns, while a business model represents how a company will make money.

4. **Communication Tool**: Models are often used to convey information to others in a simpler, more understandable form. Architects use building models to show clients what a structure will look like, even before it's built.

5. **Testing and Experimentation**: Many models allow for testing ideas in a controlled or hypothetical way. Scientists use models to experiment with variables, like simulating climate conditions to see potential outcomes.

This is true whether the model is a concept map, a physical replica, a mathematical equation, or a system diagram.
# System modeling
System modeling involves creating abstract representations of a system to view it from different perspectives. This typically uses graphical notation, often based on the Unified Modeling Language (UML), though mathematical models can also specify system details. Models support requirements engineering by clarifying system requirements, assisting in system design, and documenting its structure and operations post-implementation. Models of the existing system help identify strengths and weaknesses, forming a basis for new requirements, while models of the proposed system illustrate requirements for stakeholders and guide engineers. System modeling in model-driven engineering can sometimes generate code from models. Unlike representations, models are abstractions, selectively simplifying details to highlight key aspects of the system. Different perspectives include:

1. **External perspective**: Modeling the system’s _context_ or environment.
2. **Interaction perspective**: Modeling _interactions_ between the system and its environment or within system components.
3. **Structural perspective**: Modeling the _organization_ of system components or data structure.
4. **Behavioral perspective**: Modeling system _dynamics and responses_ to events.

The following is a table that compares the **context**, **interaction**, **structural**, and **behavioral** models:

| **Model Type**       | **Purpose**                                                                 | **Focus**                                   | **Example**                                     |
|----------------------|-----------------------------------------------------------------------------|---------------------------------------------|-------------------------------------------------|
| **Context Model**    | Defines the system's environment and interactions with external entities.   | System boundaries and external actors.      | Diagram showing the system, users, and external systems. |
| **Interaction Model**| Illustrates interactions between the system and its environment or components.| Sequence and flow of information/control. | Use case and sequence diagrams detailing user-system interactions. |
| **Structural Model** | Describes data organization and static relationships within the system.     | Object classes, attributes, and associations.| Class diagram showing data structures and their relationships. |
| **Behavioral Model** | Represents dynamic behavior and system responses to events.                | State transitions and responses to events.  | State or activity diagrams depicting workflows and state changes. |

next lesson: [[SWE lecture 5]]