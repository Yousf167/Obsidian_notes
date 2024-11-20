#statistics
previous lesson: [[Statistics lecture 3]]
[[CDF, PDF, PMF.canvas|CDF, PDF, PMF]]
![[Random Variables and Probability Distributions.pdf]]
Here’s an Obsidian note based on the content from the file, structured for clarity and readability:

---

# Random Variables and Probability Distributions

* _Random Variable_: Variable whose value is determined by a random experiment
* _Discrete Prob. Dist_: __Table__ or __Formula__ that the probabilities for each outcome of the random variable $X$
## Ex:
Flip 3 coins at the same times. Let random variable $X$ be the heads showing

| Outcome($x$) | $X$ |
| ------------ | --- |
| HHH          | 3   |
| HHT          | 2   |
| HTH          | 2   |
| THH          | 2   |
| TTH          | 1   |
| THT          | 1   |
| HTT          | 1   |
| TTT          | 0   |
$\large \therefore x = \{0,1,2,3\}$


| $x$      | 0                    | 1                    | 2                    | 3                    |
| -------- | -------------------- | -------------------- | -------------------- | -------------------- |
| $P(X=x)$ | $\Large \frac{1}{8}$ | $\Large \frac{3}{8}$ | $\Large \frac{3}{8}$ | $\Large \frac{1}{8}$ |

## PMF, PDF and CDF
**PMF (Probability Mass Function)** and **PDF (Probability Density Function)** are fundamental concepts in probability and statistics that describe distributions of random variables. Here’s a breakdown:
### **1. Probability Mass Function (PMF)**

- **Definition**: A PMF applies to **discrete random variables** and gives the probability that a discrete random variable \( X \) takes on a specific value \( x \):  
  $$
  P(X = x) = f(x)
  $$
- **Key Properties**:
  $$\bullet\ P(X = x) \geq 0 \text{ for all x (non-negative probabilities).}$$
$$\bullet\ \text{The sum of probabilities over all possible values is 1}:  
\sum_{x \in \text{Support}} P(X = x) = 1
$$
- **Example**: For a fair 6-sided die, the PMF is:  
  $$
  P(X = x) =
  \begin{cases} 
  \frac{1}{6} & \text{if } x \in \{1, 2, 3, 4, 5, 6\}, \\
  0 & \text{otherwise}.
  \end{cases}
  $$

* Expected mean:
$$\LARGE \therefore \mu = E(X) = \sum_{i = 0}^n X_i \cdot P(X_i)$$
* Variance:
$$
\Large \sigma^2 = E(X^2) - \mu^2\ \ where\ E(X^2) = \sum_{i=0}^n X_i^2 \cdot f(X_i)  
$$

### **2. Probability Density Function (PDF)**

- **Definition**: A PDF applies to **continuous random variables** and represents the likelihood$^*$ (not the probability!) of the random variable taking on a specific value.  
  For a continuous random variable $X$ in $[a,\ b]$, the PDF satisfies:  
  $$
  P(a \leq X \leq b) = \int_a^b f(x) \, dx
  $$
- **Key Properties**:
  - $f(x) \geq 0$ for all $x$ (non-negative density).
  - The total area under the curve of $f(x)$ is 1:  
$$
\int_{-\infty}^{\infty} f(x) \, dx = 1
$$
* Expected mean:
$$\LARGE \therefore \mu = E(x) = \int_a^b x \cdot P(x)\ dx$$
Variance:
$$\Large \sigma^2 = E(x^2) - \mu^2\ \ where\ E(x^2) = \int_{a}^b x^2 \cdot f(x)$$



### **Cumulative Distribution Function (CDF)**
**CDF (Cumulative Distribution Function)** describes the probability that a random variable \( X \) takes on a value less than or equal to a given value \( x \). It's a fundamental concept in both discrete and continuous probability distributions.

### **Definition**
The CDF of a random variable $X$, denoted as $F(x)$, is given by:

$$
F(x) = P(X \leq x)
$$

It is defined as:
- For **discrete random variables**:  
  $$
  F(x) = \sum_{t \leq x} P(X = t)
  $$
- For **continuous random variables**:  
$$
  F(x) = \int_{-\infty}^x f(t) \, dt\ 
$$
where $f(t)$ is the PDF of $X$.

### **Properties of the CDF**
1. **Non-decreasing**: $F(x)$ never decreases as $x$ increases.
2. **Limits**:
	-  $\lim_{x \to -\infty} F(x) = 0$ (no probability before the start of the distribution).
	- $\lim_{x \to \infty} F(x) = 1$ (total probability sums to 1).
1. **Range**: $0 \leq F(x) \leq 1$ for all  $x$.
2. **Relationship with PDF** (for continuous random variables):  
   The PDF $f(x)$ is the derivative of the CDF $F(x)$:
   $$
   f(x) = \frac{dF(x)}{dx}
   $$
### **Visualizing the CDF**
The CDF is a curve that shows how the cumulative probability grows as $x$ increases. For example:
- At \( x = a \), \( F(a) \) gives the total probability for $X \leq a$.
- As $x \to \infty,\ F(x) \to 1$.

#### Example:
If \( X \) is the outcome of a fair 6-sided die:
$$
F(x) = 
\begin{cases} 
0 & \text{if } x < 1 \\
\frac{1}{6} & \text{if } 1 \leq x < 2 \\
\frac{2}{6} & \text{if } 2 \leq x < 3 \\
\frac{3}{6} & \text{if } 3 \leq x < 4 \\
\frac{4}{6} & \text{if } 4 \leq x < 5 \\
\frac{5}{6} & \text{if } 5 \leq x < 6 \\
1 & \text{if } x \geq 6.
\end{cases}
$$

### **Relationship Between PMF/PDF and CDF**
- **From PMF to CDF**: Sum up probabilities for all values $\leq x$.
- **From PDF to CDF**: Integrate the PDF up to $x$.

Conversely:
- **From CDF to PMF/PDF**:
  - For discrete variables: Subtract successive CDF values:
$$
    P(X = x) = F(x) - F(x^-)
$$
  - For continuous variables: Differentiate the CDF:
$$
    f(x) = \frac{dF(x)}{dx}
$$

![[CDF, PDF, PMF.png|center]]

### **Applications**
1. Finding probabilities:
$$
   P(a \leq X \leq b) = F(b) - F(a)
$$
2. Generating random samples in simulations.
3. Characterizing distributions and making comparisons.

---

### **Key Differences**

| Feature               | PMF (Probability Mass Function)           | PDF (Probability Density Function)             | CDF (Cumulative Distribution Function)         |
|-----------------------|-------------------------------------------|-----------------------------------------------|-----------------------------------------------|
| **Definition**         | $P(X = x)$, the probability at $x$       | $f(x)$, the density of $X$ at $x$             | $F(x) = P(X \leq x)$, cumulative probability  |
| **Variable Type**      | Discrete                                | Continuous                                    | Both (Discrete or Continuous)                 |
| **Value Range**        | $P(X = x) \geq 0$, $\sum P(X = x) = 1$   | $f(x) \geq 0$, $\int_{-\infty}^\infty f(x) dx = 1$ | $0 \leq F(x) \leq 1$                         |
| **Interpretation**     | Probability of a specific outcome       | Relative likelihood of $X$ near $x$          | Probability of $X$ being $\leq x$            |
| **Mathematical Form**  | Summation: $P(X = x)$                   | Function: $f(x)$                              | Integral/Sum: $F(x) = \int_{-\infty}^x f(t) dt$ |
| **Conversion to CDF**  | $F(x) = \sum_{t \leq x} P(X = t)$        | $F(x) = \int_{-\infty}^x f(t) dt$             | N/A                                           |
| **Conversion from CDF**| $P(X = x) = F(x) - F(x^-)$              | $f(x) = \frac{dF(x)}{dx}$                     | N/A                                           |
| **Graph Shape**        | Bar chart (discrete)                    | Smooth curve (continuous)                     | Staircase (discrete) or smooth curve (continuous) |

If you're working with a random variable and aren’t sure whether to use a PMF or PDF, ask yourself: *Is the variable discrete or continuous?*
## Rules:
* $\Large \sum P(X=x) = 1$
* The mean of a discrete random variable $X$ is the value that is expected to occur per repetition, on average, if an experiment is repeated a large number of  times. It is denoted by $\mu$ and calculated as: 
$$\LARGE \mu = X_1 \cdot P(X_1) + X_2 \cdot P(X_2)......$$
$$\LARGE \therefore \mu = \sum_{i = 0}^n X_i \cdot P(X_i)$$



---

$^*$In the context of a **Probability Density Function (PDF)**, **likelihood** refers to the relative *density* of the random variable at a specific point. It is not the same as probability. Let me clarify this:
### **1. Why is "likelihood" used instead of "probability"?**
For a **continuous random variable**, the probability of the variable taking on any exact value is always zero. That’s because there are infinitely many possible values in any interval, and dividing 1 (the total probability) among an infinite number of points gives zero at each point.

Instead of probabilities, the PDF \( f(x) \) describes the *relative likelihood* of the random variable \( X \) being near a particular value \( x \). 

### **2. Intuition Behind Likelihood**
Imagine a smooth curve (the PDF). The height of the curve at any point \( x \) indicates how "densely packed" the possible values of the random variable are around \( x \). 
- **High density**: The random variable is more likely to take values near this point.
- **Low density**: The random variable is less likely to take values near this point.

### **Key Takeaway**
- **Likelihood** is a measure of the relative tendency of the random variable to take values near \( x \), expressed through the height of the PDF.
- To get a **probability**, you need to consider an interval and integrate the PDF over that range.
