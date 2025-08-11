# The Lowest Common Multiple (LCM)
## 🔹 What Is LCM?

**LCM (Least Common Multiple)** of two or more integers is the smallest positive integer that is divisible by each of them.

> For example, LCM(4, 6) = 12 because 12 is the smallest number divisible by both 4 and 6.

---

## 🔸 Why Is It Useful?

- Finding common timing intervals (e.g., repeating events)
    
- Solving problems with fractions (common denominators)
    
- Working with modular arithmetic
    
- Number theory & cryptography


---

## 🔹 Basic Definitions

Given two integers `a` and `b`, their **LCM** is denoted as:

$$\LARGE lcm(a,b)\text{lcm}(a, b)$$

It satisfies this fundamental identity:

$$\LARGE lcm(a,b)×gcd(a,b) = |a \times b|$$

Where **gcd** is the greatest common divisor.

---

## 🔸 Methods to Find the LCM

### 1. Listing Multiples (Brute Force)

Not practical for large numbers, but here’s how it works:

Example: `LCM(4, 5)`

- Multiples of 4: 4, 8, 12, 16, __20__, 24, ...
    
- Multiples of 5: 5, 10, 15, **20**, 25, ...


LCM = **20**

---

### 2. Prime Factorization Method

- Factor each number into primes
    
- Take the highest power of each prime
    
- Multiply them


Example: `LCM(12, 18)`

- 12 = 2² × 3
    
- 18 = 2 × 3²
    
- LCM = 2² × 3² = **36**


---

### 3. Using [[GCD]] (Most Efficient)

Use the identity:

$$\LARGE lcm(a,b)= \frac{|a \times b|}{\text{gcd}(a, b)}$$

Example: `LCM(8, 12)`

- GCD(8, 12) = 4
    
- LCM = (8 × 12) / 4 = 96 / 4 = **24**


You can get GCD using the **Euclidean Algorithm**.

---

## 🔹 For More Than Two Numbers

$$\LARGE lcm(a,b,c)=\text{lcm}(\text{lcm}(a, b), c)$$

Example: `LCM(3, 4, 5)`

- LCM(3, 4) = 12
    
- LCM(12, 5) = **60**


---

## 🔸 In Programming (Code Examples)

```cpp
int gcd(int a, int b) {
    while (b != 0) {
        int t = b;
        b = a % b;
        a = t;
    }
    return a;
}

int lcm(int a, int b) {
    return abs(a * b) / gcd(a, b);
}
```

---

## 🔹 LCM Properties

- **Commutative**: `lcm(a, b) = lcm(b, a)`
    
- **Associative**: `lcm(a, lcm(b, c)) = lcm(lcm(a, b), c)`
    
- Always **≥ max(a, b)**
    
- If `a` divides `b`, then `lcm(a, b) = b`
    
- For **coprime** numbers (GCD = 1), LCM = `a × b`


---

## 🔸 Real-Life Applications

- Scheduling (when events align)
    
- Gear and machine timing
    
- Signal processing
    
- Music rhythms
    
- Solving Diophantine equations


---

## 🔹 Pro Tips

- Always reduce fractions using LCM in the denominator.
    
- For large inputs, always use the **GCD method** (much faster).
    
- In math contests, prime factorization gives insight fast.


---

# 🧠 Advanced Concepts Behind LCM

### 🔸 1. Algebraic LCM (for polynomials)

Yes, LCM isn’t just for integers — it works with **polynomials** too.

For example:

- LCM of $x^2 - 1$ and $x^2 - x$ :
$$\LARGE x^2−1=(x−1)(x+1)$$$$\LARGE x^2−x=x(x−1)$$LCM = $\LARGE x(x−1)(x+1)$

**Applications**:

- Simplifying rational expressions
    
- Finding common denominators in algebra


---

### 🔸 2. LCM in Modular Arithmetic

In number theory, solving equations like:

$$\LARGE x≡a\ (modm),\ x≡b\ (modn)$$

If m and n are **coprime**, the solution lies modulo $lcm(m,n)=m⋅n$

This is the **Chinese Remainder Theorem** in disguise.

---

### 🔸 3. LCM in Linear Algebra

You ever do **rational canonical form** in linear algebra? The **least common multiple of the invariant factors** gives you the **minimal polynomial** of a matrix.

Wild, right? Linear algebra sneaks it in.

---

### 🔸 4. LCM in Discrete Math & Combinatorics

- Used in **inclusion-exclusion principle** to count overlapping periodicities.
    
- In **tiling problems**: LCM gives the minimum board length needed to match repeating tiles.
    
- **Cycle problems**: Finding when two independent events align again.


Example:  
Event A repeats every 4 days, Event B every 6 days → when do both happen again?  
Answer: LCM(4, 6) = **12 days**

---

### 🔸 5. LCM in Cryptography

- Cryptosystems (like RSA) rely on totients.  
    Euler’s theorem uses **lcm(φ(p−1), φ(q−1))** or **λ(n)** = Carmichael’s function.


Used in:

- Key generation
    
- Modular exponentiation


---

### 🔸 6. **Carmichael Function λ(n)**

This is like a “refined” LCM:

$$\LARGE \lambda(n) = \text{lcm}(\lambda(p_1^{k_1}), \lambda(p_2^{k_2}), \dots)$$

It gives the **smallest exponent** such that:

$$\LARGE a^{\lambda(n)} \equiv 1 \mod n$$

For all a coprime to n.

---

## 🧾 Theoretical Depth

### ✅ Lattice Theory

LCM and GCD can be thought of as **join** and **meet** operations in the lattice of divisibility.

- **GCD**: greatest element ≤ both
    
- **LCM**: least element ≥ both


It forms a **distributive lattice**, which has its own deep algebraic structure.

---

### ✅ LCM on Sets

Let $A = \{a_1, a_2, \dots, a_n\}$

You can define:

$$\LARGE \text{lcm}(A) = \text{lcm}(a_1, a_2, \dots, a_n)$$

You can also compute this using **prime exponent maxing** across all elements.

Example:

- A={4,6,10}A = \{4, 6, 10\}
    
- Prime factors:
    
    - 4 = 2²
        
    - 6 = 2 × 3
        
    - 10 = 2 × 5


Take:

- 2²
    
- 3
    
- 5  
    → LCM = 2² × 3 × 5 = **60**
    

---

## 🧩 Fun Factoids

- LCM(1 to n) grows super fast — roughly exponential in **n**
    
- For primes p, q: LCM(p, q) = p × q
    
- For powers of same prime: LCM(p^a, p^b) = p^max(a, b)
    

---

## 🛠️ Bonus: LCM in Code Libraries

|Language|Built-in LCM Function|
|---|---|
|Python 3.9+|`math.lcm(a, b)`|
|C++17+|No built-in, use `std::lcm(a, b)` in C++20|
|Java|No built-in, use GCD trick|
|JavaScript|Write custom function (no native)|
## Notes
* For an integer n, if we need to find two numbers a, b such that $a+b = n,\ LCM(a, b)\ \text{is the minimum lcm of all numbers a, b that add up to n}$:
	* if n is prime, a, b = 1, n - 1
	* else, find a number that divides n and let it be i. a, b = n / i, n - a 