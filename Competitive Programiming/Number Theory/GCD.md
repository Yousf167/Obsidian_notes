# The Greatest Common Divisor (GCD)

The **Greatest Common Divisor (GCD)** of two or more integers is the largest positive integer that divides each of them without leaving a remainder. It is a fundamental concept in number theory, algebra, and cryptography.  

---

## 1. Definition & Notation  
- Given integers \( a \) and \( b \) (not both zero), their GCD is denoted $\gcd(a, b)$.  
- If $\gcd(a, b) = 1$, the numbers are **coprime** (no common divisors other than 1).  
- The GCD of more than two numbers is defined recursively:  
  $$\LARGE
  \gcd(a, b, c) = \gcd(\gcd(a, b), c)
  $$

---

## 2. Properties of GCD
- Commutativity: $\gcd(a, b) = \gcd(b, a)$.  
- Associativity: $\gcd(a, \gcd(b, c)) = \gcd(\gcd(a, b), c)$.  
- Linearity: $\gcd(a, b) = \gcd(a, b + ka)\ for\ any\ integer\ k$.  
- Multiplicative: If $\gcd(a, m) = \gcd(b, m) = 1$, then $\gcd(ab, m) = 1$.  
- GCD and Zero: $\gcd(a, 0) = |a|$.  
- Distributive over LCM:  
  $$\LARGE
  \gcd(a, \text{lcm}(b, c)) = \text{lcm}(\gcd(a, b), \gcd(a, c))
  $$

---

## 3. Methods for Finding the GCD

### (a) Prime Factorization Method 
- Factorize both numbers into primes.  
- Take the **minimum exponent** for each common prime.  
- **Example**:  
  $$\LARGE
  24 = 2^3 \times 3^1, \quad 36 = 2^2 \times 3^2  
  $$
  $$\LARGE
  \gcd(24, 36) = 2^2 \times 3^1 = 12
  $$

### (b) Euclidean Algorithm (Most Efficient
- Based on the principle:  
  $$\LARGE
  \gcd(a, b) = \gcd(b, a \bmod b)  
  $$
- Steps:  
  1. Divide $a$ by $b$, find remainder $r$.  
  2. Replace $a$ with $b$, $b$ with $r$.  
  3. Repeat until $b = 0$. Then $\gcd = a$.  

- Example:  
$$\LARGE
  \gcd(48, 18) = \gcd(18, 12) = \gcd(12, 6) = \gcd(6, 0) = 6
$$

### (c) Extended Euclidean Algorithm
- Finds integers $x$ and $y$ (Bézout coefficients) such that:  
  $$\LARGE
  ax + by = \gcd(a, b)  
  $$
- Useful in solving **Diophantine equations** and modular inverses.  

---

## 4. Applications of GCD

### (a) Simplifying Fractions
- The GCD helps reduce fractions to simplest form:  
  $$
  \frac{a}{b} \text{ simplifies to } \frac{a \div \gcd(a, b)}{b \div \gcd(a, b)}
  $$

### (b) Least Common Multiple (LCM)
- The GCD and LCM are related by:  
  $$
  \text{lcm}(a, b) = \frac{|a \times b|}{\gcd(a, b)}
  $$

### (c) Cryptography (RSA Algorithm)
- The security of RSA relies on the difficulty of factoring large numbers and computing GCDs of very large integers.  

### (d) Diophantine Equations  
- Equations like $ax + by = c$ have integer solutions **iff** $\gcd(a, b) \mid c$.  

### (e) Modular Arithmetic & Inverses  
- A number $a$ has a multiplicative inverse modulo $m$ **iff** $\gcd(a, m) = 1$.  

---

## 5. Generalizations & Advanced Topics  

### (a) GCD in Other Algebraic Structures  
- **Polynomials**: $\gcd$ of two polynomials is the highest-degree polynomial dividing both.  
- **Gaussian Integers**: $\gcd$ can be defined in $\mathbb{Z}[i]$ (complex integers).  

### (b) Binary GCD (Stein’s Algorithm)  
- Optimized for computers, uses bitwise operations instead of division.  

### (c) GCD in Number Theory  
- **Dirichlet’s Theorem**: If $\gcd(a, b) = 1$, then the arithmetic progression $a, a+b, a+2b, \dots$ contains infinitely many primes.  

---

## 6. Fun Facts & Theorems  
- **Bézout’s Identity**: If $\gcd(a, b) = d$, then there exist integers $x, y$ such that $ax + by = d$.  
- **Lamé’s Theorem**: The number of steps in the Euclidean algorithm is at most 5 times the number of digits in the smaller number.  
- **GCD of Fibonacci Numbers**:  
$$\LARGE
  \gcd(F_m\ ,\ F_n) = F_{\gcd(m, n)}
$$
  where $F_n$ is the $n^{th}$ Fibonacci number.  

---



# How the GCD is Used in Competitive Programming  

The **Greatest Common Divisor (GCD)** is one of the most frequently used mathematical tools in competitive programming. It appears in problems related to number theory, combinatorics, modular arithmetic, and even geometry. Below are key applications and problem-solving techniques involving GCD.

---

## 1. Simplifying Fractions & Ratios  
**Problem Type**: Reduce fractions to their simplest form.  
**Example**:  
- Given two numbers $A$ and $B$, output $\frac{A}{\gcd(A,B)}$ and $\frac{B}{\gcd(A,B)}$.  
**Use Case**:  
- Often appears in problems requiring normalized ratios (e.g., resizing images, probability simplifications).

---

## 2. Checking Coprimality (GCD = 1)  
**Problem Type**: Determine if two numbers share no common factors.  
**Example**:  
- Given $A$ and $B$ , check if $\gcd(A, B) = 1$.  
**Use Case**:  
- Used in problems related to modular inverses, RSA encryption, and Euler’s totient function.

---

## 3. Solving Linear Diophantine Equations  
**Problem Type**: Find integer solutions to equations of the form \( Ax + By = C \).  
**Key Insight**:  
- Solutions exist **if and only if** $\gcd(A, B)$ divides $C$).  
**Example**:  
- Given $15x + 10y = 25$, since $\gcd(15,10) = 5$ and $5 \mid 25$, solutions exist.  
**Use Case**:  
- Problems involving coin changes, resource distribution, or grid movement constraints.

---

## 4. Modular Arithmetic & Inverses  
**Problem Type**: Compute $A^{-1} \mod M$ (the modular inverse of $A$).  
**Key Insight**:  
- The inverse exists only if $\gcd(A, M) = 1$.  
**Example**:  
- Find $x$ such that $3x \equiv 1 \ (\text{mod } 11)$.  
- Since $\gcd(3,11)=1$, the inverse exists (Answer: $x = 4$, because $3 \times 4 = 12 \equiv 1 \mod 11$).  
**Use Case**:  
- Critical in combinatorics (nCr mod p), hashing, and cryptographic algorithms.

---

## 5. LCM Calculation (GCD-LCM Relationship)  
**Problem Type**: Compute the Least Common Multiple ([[LCM]]) efficiently.  
**Formula**:  
$$\LARGE
\text{LCM}(A, B) = \frac{|A \times B|}{\gcd(A, B)}
$$
**Example**:  
- $\text{LCM}(12, 18) = \frac{12 \times 18}{6} = 36$.  
**Use Case**:  
- Problems involving periodic events, synchronization, or finding the smallest common multiple.

---

## 6. Handling Multiple GCD Queries  
**Problem Type**: Answer multiple GCD queries efficiently (e.g., range GCD in an array).  
**Techniques**:  
- **Prefix GCD Arrays**: Precompute GCDs from the start up to each index.  
- **Segment Trees**: Allow $O(\log N)$ GCD queries on ranges.  
**Example**:  
- Given an array $[8, 12, 6, 4]$, the prefix GCD array is $[8, 4, 2, 2]$.  
**Use Case**:  
- Problems where you need to compute GCD over sub-arrays (e.g., "Find the maximum GCD of any sub-array").

---

## 7. Number Theory Problems (Divisors, Multiples)  
**Problem Type**: Find numbers with specific GCD properties.  
**Example**:  
- **Count numbers ≤ N coprime with N** → Euler’s totient function $\phi(N)$.  
- **Find the largest subset with GCD = 1** → Check if the overall GCD of the set is 1.  
**Use Case**:  
- Used in problems related to divisors, prime factorization, and inclusion-exclusion.

---

## 8. Binary GCD (Optimized for Performance)  
**Problem Type**: Compute GCD efficiently for very large numbers.  
**Stein’s Algorithm (Binary GCD)**:  
- Uses bitwise operations instead of modulo.  
- Faster than the Euclidean algorithm for large numbers.  
**Use Case**:  
- Needed in problems with tight time constraints (e.g., $N \leq 10^{18}$).

---

## 9. Geometry Problems (Line Integer Points)  
**Problem Type**: Count integer points on a line segment.  
**Key Insight**:  
- The number of integer points between $(x_1,y_1)$ and $(x_2,y_2)$ is $\gcd(|x_2 - x_1|, |y_2 - y_1|) + 1$.  
**Example**:  
- Points between $(0,0)$ and $(6,9)$: $\gcd(6,9) = 3$, so  $3 + 1 = 4$ points.  
**Use Case**:  
- Problems involving grid movements, lattice points, or ray casting.

---

## 10. Advanced Applications  
### (a) Inclusion-Exclusion with GCD Constraints  
- Example: Count numbers ≤ N divisible by at least one of a set of numbers.  
### (b) Dynamic Programming with GCD States  
- Example: DP where the state tracks the current GCD of selected elements.  
### (c) Game Theory (Nim-like Games with GCD Moves)  
- Example: A game where moves must follow GCD constraints.  
---
## Additional Notes
* For the maximum GCD of a sorted `arr[n]`, the greatest value comes from `max(arr) / 2`.
* For the minimum GCD of a sorted `arr[n]`, the least value comes from `min(arr)`:
```cpp
if(selectedNumber % min(arr) == 0){
	minGCD = min(arr);
}
else(){
	minGCD = 1;
}
```
