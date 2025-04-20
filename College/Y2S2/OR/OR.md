## PDFs:
1. [[Lecture 01-Introduction to Operation research.pdf]]
2. [[Lecture 02_Chapter 3 (Decision Analysis).pdf]]
3. [[Lecture 03, Decision Analysis_underRisk.pdf]]
4. [[Lecture 04, Chapter 3, Decision Trees.pdf]]
5. [[Lecture 05, Chapter 3, Decision Trees_example.pdf]]
6. [[Lecture 07_Chapter 6 (Inventory Control Models).pdf]]
7. [[Lecture 08, chapter 6 discount models.pdf]]
8. [[Lecture 09 Chapter 6 (Inventory Control Models).pdf]]
9. [[Lecture 10-Part-1 Chapter 7 (Linear programming  Graphical Methods)_with audio.pdf]]

# Rules
Decisions fall under 3 types:
1. certainty: I know each alternative decision's consequences.
2. uncertainty: I don't know the probabilities of various. 
3. risk: i know the probabilities of various outcomes.
## Decision Under Uncertainty
There are 5 criteria:
1. __MaxiMax__: MAX(MAX(each row))
2. __MaxiMin__: MAX(MIN(each row))
3. __Criterion of Realism (Hurwicz)__: create a column out of: $\large \alpha (MAX(each\ row)) + (1-\alpha)(MIN(each\ row))$ then choose MAX(realism column)
4. __Equally Likely__: choose MAX(AVG(each row))
5. __MiniMax Regret__: 
	1. create an opportunity loss table
	2. choose MIN(MAX(each row))
## Decision Under Risk
 $$\large EMV_i = \sum_{i = 1}^{n}payoff_i \times P_i$$
 * where i is the row number. _MAX(EMV)_ is chosen
## Expected value of Perfect Information (EVPI)
$$\large EVPI = EV_wPI - MAX(EMV)$$
* where $\large EVPI$ is the upper bound that should be paid for information. An offer above it should not be considered
* $\large EV_wPI$ is the long-run average return if we have perfect info.
$$\large EV_wPI = \sum_{i = 0}^{n}MAX(column_i) \times P(column_i)$$
## Expected Opportunity Loss
* the cost of not picking the best solution
### Steps:
1. Construct an opportunity loss table
2. find the EMV of each column
3. choose MIN(EMV)
* MIN(EOL) = MAX(EMV) = EVPI 
## Sensitivity Analysis
* the probabilities become variables (P) and graphs are constructed to find the best decision
[[16747a7796b7f13ce0c28ac150b2633b_MD5.jpeg|Open: Pasted image 20250419103929.png]]
![[16747a7796b7f13ce0c28ac150b2633b_MD5.jpeg|center]]
[[ff0879d2e4e6368c05d76764a9485164_MD5.jpeg|Open: Pasted image 20250419103951.png]]
![[ff0879d2e4e6368c05d76764a9485164_MD5.jpeg|center]]
## Decision Tree
[[db8c875b114739bb4fd68ee1d4f8e8e1_MD5.jpeg|Open: Pasted image 20250419104809.png]]
![[db8c875b114739bb4fd68ee1d4f8e8e1_MD5.jpeg|center]]
### Expected Value of Sample Information (EVSI)
$$\large EVSI = (EMV_{with\ Reasearch} + cost_{Research}) - (EMV_{without\ reasearch})$$
## Inventory Control Models
Symbols:
* $\large Q$: Number of pieces to order
* $\large EOQ = Q^*$: Optimal number of pieces to order
* $\large D$: annual demand in units for inventory item
* $\large C_o$: Ordering cost of each order
* $\large C_h$: holding cost/unit/year
* TC: Total annual Cost (annual holding cost + annual order cost)
$$\large\bullet Annual\ Order\ Cost = \frac{D}{Q}C_o$$
$$\large\bullet Annual\ holding\ cost = \frac{Q}{2}C_h$$
$$\large\bullet EOQ = Q^* =\sqrt{\frac{2DC_o}{C_h}}$$
$$\large\bullet TC = \frac{D}{Q}C_o + \frac{Q}{2}C_h$$
## Discount Models
* Holding cost is variable: $\large C_h = IC$ where $\large I$ = holding cost as a percentage of unit cost $\large C$