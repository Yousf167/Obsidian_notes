previous lesson: [[Statistics lecture 1,2]]
#statistics 
![[solved problems - probability.pdf]]
From the solved problems in the document, here are the general rules used:

1. **Joint Probability** (Intersection of Events):
   - $P(A \cap B)$ represents the probability of both events  $A$  and  $B$  occurring.
   - Calculated as:  $P(A \cap B) = \frac{\text{Number of outcomes in } (A \cap B)}{\text{Total number of outcomes}}$ 

2. **Union of Events**:
   - $P(A \cup B)$ represents the probability of either event $A$ or $B$ (or both) occurring.
   - Calculated using the formula: $P(A \cup B) = P(A) + P(B) - P(A \cap B)$

3. **Complement of Events**:
   - The complement of an event A (not A) is $A'$ with $P(A') = 1 - P(A)$.

4. **Conditional Probability**:
   - The probability of event $A$ given $B$ (denoted $P(A | B)$) is calculated as: $P(A | B) = \frac{P(A \cap B)}{P(B)}$
   
5. **Independence of Events**:
   - Events $A$ and $B$ are independent if $P(A \cap B) = P(A) \times P(B)$.
   - Alternatively, independence can also be checked if $P(A | B) = P(A)\ and\ P(B | A) = P(B)$.


this is a comprehensive table of key event relationships in probability, summarizing all major types of relations, their definitions, implications, and relevant formulas. This should cover the foundational event relationships used in probability theory:

| **Type of Relationship**                 | **Definition**                                                                                      | **Implication/Formula**                                                                               | **Example**                                                                                       |
| ---------------------------------------- | --------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- |
| **Mutually Exclusive (Disjoint)**        | Events cannot occur simultaneously. $A \cap B = \emptyset$.                                         | $P(A \cap B) = 0$, $P(A) + P(B) = P(A \cup B)$                                                        | Rolling a 2 or a 5 on a die—cannot happen at the same time.                                       |
| **Exhaustive Events**                    | Events cover all possible outcomes in the sample space.                                             | $P(A \cup B) = 1$                                                                                     | Rolling an even or odd number on a die covers all outcomes.                                       |
| **Mutually Exclusive and Exhaustive**    | Events are both mutually exclusive and exhaustive.                                                  | $\sum P(A_i) = 1$ for all events $A_1, A_2, \dots, A_n$                                               | Rolling a 1, 2, 3, 4, 5, or 6 on a die—only one can happen, but they cover all outcomes.          |
| **(Mutually)Independent Events**         | Occurrence of one event does not affect the probability of the other.                               | $P(A \cap B) = P(A) \cdot P(B)$<br>$P(A\|B) = A,\ P(B\|A) = B$                                        | Flipping a coin and rolling a die—one result does not influence the other.                        |
| **Dependent Events**                     | Occurrence of one event affects the probability of the other.                                       | $P(A \cap B) \neq P(A) \cdot P(B)$                                                                    | Drawing two cards without replacement.                                                            |
| **Complementary Events**                 | Complement of $A$ includes all outcomes not in $A$. $A \cup A' = S$, where $S$ is the sample space. | $P(A') = 1 - P(A)$                                                                                    | Rolling an even number vs. rolling an odd number on a die.                                        |
| **Conditional Probability**              | Probability of $A$ given that $B$ has occurred.                                                     | $P(A\|B) = \frac{P(A \cap B)}{P(B)}\ if\ P(B) > 0$                                                    | Probability of drawing a red card given that the card is a face card.                             |
| **Joint Events (Intersection)**          | <br>Probability that both $A$ and $B$ occur.                                                        | Independent:<br>$P(A \cap B) = P(A) \cdot P(B)$  <br>Dependent:<br>$P(A \cap B) = P(A\|B) \cdot P(B)$ | Probability of flipping heads and rolling a 6.                                                    |
| **Union of Events**                      | Probability that at least one of $A$ or $B$ occurs.                                                 | $P(A \cup B) = P(A) + P(B) - P(A \cap B)$                                                             | Probability of drawing either a heart or a face card from a deck.                                 |
| **Conditional Independence**             | Events $A$ and $B$ are independent given $C$.                                                       | $P(A \cap B\|C) = P(A\|C) \cdot P(B\|C)$                                                              | Medical diagnosis example where symptoms are independent given presence of a disease.             |
| **Bayes’ Theorem**                       | Finds the probability of $A$ given $B$, using prior probabilities.                                  | $P(A\|B) = \frac{P(B\|A) \cdot P(A)}{P(B)}$                                                           | Probability of having a disease given a positive test result.                                     |
| **Partition of a Sample Space**          | Set of mutually exclusive and exhaustive events.                                                    | $\sum_{i} P(B_i) = 1$ for all events $B_i$                                                            | Rolling a die with events being each possible outcome (1, 2, 3, 4, 5, 6).                         |
| **Total Probability (with Complements)** | Splits probability into events and their complements.                                               | $P(A) = P(A \cap B) + P(A \cap B')$                                                                   | Probability of being a smoker who either exercises or does not exercise.                          |
| **Event Independence with Complements**  | If $A$ and $B$ are independent, so are $A$ and $B'$, $A'$ and $B$, $A'$ and $B'$.                   | $P(A \cap B') = P(A) \cdot P(B')$                                                                     | If a coin flip is independent of a die roll, then heads is independent of rolling anything but 6. |
next lesson: [[Statistics lecture 4]]