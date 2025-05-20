## Lectures:
1. [[Lecture 01-Introduction to Operation research.pdf]]
2. [[Lecture 02_Chapter 3 (Decision Analysis).pdf]]
3. [[Lecture 03, Decision Analysis_underRisk.pdf]]
4. [[Lecture 04, Chapter 3, Decision Trees.pdf]]
5. [[Lecture 05, Chapter 3, Decision Trees_example.pdf]]
6. [[Lecture 07_Chapter 6 (Inventory Control Models).pdf]]
7. [[Lecture 08, chapter 6 discount models.pdf]]
8. [[Lecture 09 Chapter 6 (Inventory Control Models).pdf]]
9. [[Lecture 10-Part-1 Chapter 7 (Linear programming  Graphical Methods)_with audio.pdf]]
## Sections
1. [[Decision under uncertainty.pdf]]
2. [[Decision under risk.pdf]]
3. [[Decision tree.pdf]]
4. [[EOQ Model.pdf]]
5. [[Discount model.pdf]]
6. [[Production Run Model - OR.pdf]]
7. [[Linear Programming.pdf]]
8. [[special-cases of LP.pdf]]

# Rules
Decisions fall under 3 types:
1. certainty: I know each alternative decision's consequences.
2. uncertainty: I don't know the probabilities of various outcomes. 
3. risk: i know the probabilities of various outcomes.
## Decision Under Uncertainty
There are 5 criteria:
1. __MaxiMax__: MAX(MAX(each row))
2. __MaxiMin__: MAX(MIN(each row))
3. __Criterion of Realism (Hurwicz)__: create a column out of: $\large \alpha (MAX(each\ row)) + (1-\alpha)(MIN(each\ row))$ then choose MAX(realism column)
4. __Equally Likely__: choose MAX(AVG(each row))
5. __MiniMax Regret__: 
	1. create an opportunity loss table: $payoff_{i,\ j} = MAX(column_i) - payoff_{i,\ j}$
	2. choose MIN(MAX(each row))
## Decision Under Risk
 $$\large EMV_i = \sum_{i = 1}^{n}payoff_i \times P_i$$
 * where i is the row number. 
 * _MAX(EMV)_ is chosen.
## Expected value of Perfect Information (EVPI)
$$\large EVPI = EV_wPI - MAX(EMV)$$
* where $\large EVPI$ is the upper bound that should be paid for information. An offer above it should not be considered
* $\large EV_wPI$ is the long-run average return if we have perfect info.
$$\large EV_wPI = \sum_{i = 0}^{n}MAX(column_i) \times P(column_i)$$
## Expected Opportunity Loss
* the cost of not picking the best solution
### Steps:
1. Construct an opportunity loss table\
2. find the EMV of each column
3. choose MIN(EMV)
* Note: MIN(EOL) = MAX(EMV) = EVPI 
## Sensitivity Analysis
* the probabilities become variables (P) and graphs are constructed to find the best decision
![[16747a7796b7f13ce0c28ac150b2633b_MD5.jpeg|center]]

![[ff0879d2e4e6368c05d76764a9485164_MD5.jpeg|center]]
## Decision Tree

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
* $\large TC$: Total annual Cost (annual holding cost + annual order cost)
$$\large\bullet \text{Average inventory}= \frac{Q}{2}$$
$$\large\bullet Number\ of\ orders\ per\ year\ with\ optimum\ policy= \frac{D}{Q}$$
$$\large\bullet Annual\ Order\ Cost = \frac{D}{Q}C_o$$
$$\large\bullet Annual\ Holding\ cost = \frac{Q}{2}C_h$$
$$\large\bullet EOQ = Q^* =\sqrt{\frac{2DC_o}{C_h}}$$
$$\large\bullet TC = \frac{D}{Q}C_o + \frac{Q}{2}C_h$$
## Discount Models
* Holding cost is variable: $\large C_h = IC$ where $\large I$ = holding cost as a percentage of unit cost $\large C$
* $\large D$: annual Demand in units
* $\large C_o$: ordering cost of each order
* $\large C$: Cost per unit
* $\large I$: holding cost as a percentage of unit cost.
* $\large C_h = IC$: Holding cost
* $\large DC$: Material Cost
$$\large\bullet\ Total\ Cost = \text{Material Cost} + \text{Annual order cost} + \text{Annual holding cost}$$
* ROP: ReOrder Point
* d: daily demand
* L : order lead time
$$\large \bullet\ ROP = d \times l\ \text{(Basic equation)}$$
$$\large \therefore\ ROP = d \times l + SS,\ SS = Safety\ Stock$$
### How to solve it
Let's say we have this table:

|         | Order Quantity (units) | Price/unit ($) |
| ------- | ---------------------- | -------------- |
| Model 1 | 0 - 2499               | 1.20           |
| Model 2 | 2500 - 3999            | 1.00           |
| Model 3 | 4000+                  | 0.98           |

$\large D = 1000,\ C_o = 4\$,\ C_h = 2\%\ of\ unit\ price$
#### Step 1: Calculate the EOQ for each model
* Q1 = 1826 units
* Q2 = 2000 units
* Q3 = 2020 units
#### Step 2: Adjust Quantities to given ranges
* Q1 is in range. it will remain the same
* Q2 is smaller than the minimum in the range. it will change to 2500
* Q3 is smaller than the minimum in the range. is will change to 4000
#### Step 3: Calculate TC for each model
* TC1 = 12043.81$
* TC2 = 10041$
* TC3 = 9849.2$
#### Step 4: Choose the least total value
Model 3 is chosen


## Production Run Model
* Setup Cost replaces Ordering Cost
* Q: number of pieces per order or production run
* $C_s$: Setup cost
* $C_h$: holding or carrying cost per unit per year
* p: daily production rate
* d: daily demand rate
* t: length of production run in days
$$\large \bullet\ Maximum\ Inventory\ Level = pt - dt = Q(1-\frac{d}{p})$$
$$\large \bullet\ AVG\ Inventory\ Level = \frac{MAX(Inventory)}{2}$$
$$\large \bullet\ Annual\ Holding\ Cost = \frac{Q}{2}(1-\frac{d}{p})C_h = AVG(Inventory) \times C_h$$
$$\large \bullet\ Annual\ setup\ cost = \frac{D}{Q}C_s$$
$$\large \bullet\ Annual\ Ordering\ Cost = \frac{D}{Q}C_o$$
* To get optimal production quantity let:
$$\large \bullet\ \text{Ann. Hold. Cost = Ann. Setup cost}$$


## Linear Programming

* You are given a target function to minimize or minimize within certain constraints
$$\large z = 8x + y$$
* Constraints:
$$\large \bullet\ x + y \leq 40$$
$$\large \bullet\ 2x + y \leq 60$$	$$\large \bullet\ x, y \geq 0$$
### Steps:
1. plot each constraint
2. find the feasible region
3. find the corner points
4. calculate the objective function
5. find the optimal solution

#### Step 1, 2, 3: 
![[bc554331c8d04e212b27e6d9aec5d4ba_MD5.jpeg|center]]
#### Step 4, 5:

| x    | y   | z     |
| ---- | --- | ----- |
| 0    | 0   | 0     |
| _30_ | _0_ | _240_ |
| 0    | 40  | 40    |
| 20   | 20  | 180   |
