# Decision Analysis

## Learning Objectives
1. **List the steps of the decision-making process.**
2. **Describe the types of decision-making environments.**
3. **Make decisions under uncertainty.**
4. **Use probability values to make decisions under risk.**

---

## Introduction
- **Decision Theory**: An analytic and systematic approach to decision-making.
- **Good Decision**: Based on logic, considers all available data, and evaluates possible alternatives using a quantitative approach.

---

## The Six Steps in Decision Making
1. **Define the problem**.
2. **List possible alternatives**.
3. **Identify possible outcomes (states of nature)**.
4. **List the payoff for each combination of alternatives and outcomes**.
5. **Select a mathematical decision theory model**.
6. **Apply the model and make the decision**.

---

## Thompson Lumber Company Example
### Step-by-Step Decision Process
1. **Define the Problem**: Expand by manufacturing backyard storage sheds.
2. **List Alternatives**:
   - Construct a large plant.
   - Construct a small plant.
   - Do not develop the new product line.
3. **Identify Possible Outcomes**: Favorable or unfavorable market.
4. **List Payoffs**:
   - **Large Plant**: $200,000 (favorable), -$180,000 (unfavorable).
   - **Small Plant**: $100,000 (favorable), -$20,000 (unfavorable).
   - **Do Nothing**: $0 (favorable), $0 (unfavorable).


| Alternatives            | Favorable Market | Unfavorable Market |
| ----------------------- | ---------------- | ------------------ |
| Construct a large plant | 200,000          | -180,000           |
| Construct a small plant | 100,000          | -20,000            |
| Do nothing              | 0                | 0                  |

| Maximum in row        | Minimum in row  | Criterion of realism $\alpha = 0.8$ | AVG(FAV, UNFAV) |
| --------------------- | --------------- | ----------------------------------- | --------------- |
| ==200,000 (Maximax)== | -180,000        | 124,000                             | 10,000          |
| 100,000               | -20,000         | 76,000                              | 20,000          |
| 0                     | ==0 (Maximin)== | 0                                   | 0               |
Note: Highlighted text is the target outcome



Opportunity loss table: $\text{Max in column} - \text{item}$

| Alternatives            | Favorable Market | Unfavorable Market |
| ----------------------- | ---------------- | ------------------ |
| Construct a large plant | ==0==            | 180,000            |
| Construct a small plant | 100,000          | 20,000             |
| Do nothing              | 200,000          | ==0==              |
==most favorable outcome==

1. **Select Decision Model**: Based on risk and uncertainty.
2. **Apply the Model**: Use decision theory to make the final decision.

---

## Types of Decision-Making Environments
1. **Decision Making Under Certainty**: Consequences of each alternative are known.
2. **Decision Making Under Uncertainty**: Probabilities of outcomes are unknown.
3. **Decision Making Under Risk**: Probabilities of outcomes are known.

---

## Decision Making Under Uncertainty
### Criteria for Decision Making
1. **Maximax (Optimistic)**: Choose the alternative with the maximum possible payoff.
2. **Maximin (Pessimistic)**: Choose the alternative with the best worst-case scenario.
3. **Criterion of Realism (Hurwicz)**: Weighted average between optimism and pessimism.
4. **Equally Likely (Laplace)**: Average payoff for each alternative; choose the highest.
5. **Minimax Regret**: Minimize the maximum opportunity loss.

---

## Decision Making Under Risk
- **Expected Monetary Value (EMV)**: Choose the alternative with the highest EMV.
  - **EMV Formula**: 
$$
\text{EMV} = (\text{Payoff}_1 \times \text{Probability}_1) + (\text{Payoff}_2 \times \text{Probability}_2) + \dots
$$

### Example: Thompson Lumber
- **EMV (Large Plant)**: $10,000
- **EMV (Small Plant)**: $40,000
- **EMV (Do Nothing)**: $0
- **Decision**: Choose the small plant (highest EMV).

---

## Example: Maria Rojas Dress Shop
### Problem
- **Alternatives**: Open a small shop, medium-sized shop, or no shop.
- **Market Conditions**: Good (0.2), Average (0.5), Bad (0.3).
- **Payoffs**:
  - **Small Shop**: $75,000 (good), $25,000 (average), -$40,000 (bad).
  - **Medium Shop**: $100,000 (good), $35,000 (average), -$60,000 (bad).
  - **No Shop**: $0 (good), $0 (average), $0 (bad).

### Solution
1. **Calculate EMV**:
   - **Small Shop**: $15,500
   - **Medium Shop**: $19,500
   - **No Shop**: $0
   - **Decision**: Open a medium-sized shop (highest EMV).

2. **Opportunity Loss Table**:
   - **Minimax Regret**: Choose the small shop (minimizes maximum regret).
   - **Minimum EOL**: Choose the medium shop (minimum expected opportunity loss).

---

## Key Formulas
- __Equally Likely__:
$$
Max(Avg(row)
$$
- **Criterion of Realism**:
$$
  \text{Weighted Average} = \alpha(\text{Maximum Payoff}) + (1 - \alpha)(\text{Minimum Payoff})
$$
- **EMV**:
$$
  \text{EMV} = (\text{Payoff}_1 \times \text{Probability}_1) + (\text{Payoff}_2 \times \text{Probability}_2) + \dots
$$
* take the max EMV for the decision 
- **EOL (Expected Opportunity Loss)**:
$$
  \text{EOL} = (\text{Opportunity Loss}_1 \times \text{Probability}_1) + (\text{Opportunity Loss}_2 \times \text{Probability}_2) + \dots
$$
basically EMV but with the opportunity loss table
---

## Summary
- **Decision Analysis** involves systematic steps to make optimal choices under different environments (certainty, uncertainty, risk).
- **EMV** is a key tool for decision-making under risk.
- **Opportunity Loss** and **Regret** are used to minimize potential losses in uncertain scenarios.