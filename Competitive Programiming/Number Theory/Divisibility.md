
# Divisibility: A Complete Guide

## Basic Definition
- An integer **a** is divisible by a non-zero integer **b** if there exists an integer **k** such that:
  $$\LARGE a = b \times k$$
- Notation: $b \mid a$ (b divides a)
## Properties
* Reflexivity:  $a | a\ \forall\ a$
* Transitivity: if $a | b$ and $b | c$, then $a | c$
* Linearity: if $a | b$ and $a | c$, then $a | (b + c)$ and $a | (b - c)$
* Multiplication: if $a | b$, then $a | (b \times c)\ \forall c$ 
* Linear Combination: If $a \mid b$ and $a \mid c$, then $a \mid (mb + nc)$ for any integers m,n
* Prime Divisibility: If p is prime and $p \mid ab$, then $p \mid a$ or $p \mid b$
## Divisibility Rules (2-20)

| Number | Rule                                                                                     |
| ------ | ---------------------------------------------------------------------------------------- |
| 2      | Last digit is even (0,2,4,6,8)                                                           |
| 3      | Sum of digits divisible by 3                                                             |
| 4      | Last two digits form a number divisible by 4                                             |
| 5      | Ends with 0 or 5                                                                         |
| 6      | Divisible by both 2 and 3                                                                |
| 7      | Double the last digit, subtract from rest. Result must be divisible by 7                 |
| 8      | Last three digits form a number divisible by 8                                           |
| 9      | Sum of digits divisible by 9                                                             |
| 10     | Ends with 0                                                                              |
| 11     | Alternating sum of digits divisible by 11 (e.g., 121→1−2+1=0, which is divisible by 11). |
| 12     | Divisible by both 3 and 4                                                                |
| 13     | Multiply last digit by 4, add to rest. Result divisible by 13                            |
| 14     | Divisible by both 2 and 7                                                                |
| 15     | Divisible by both 3 and 5                                                                |
| 16     | Last four digits form a number divisible by 16                                           |
| 17     | Multiply last digit by 5, subtract from rest. Divisible by 17                            |
| 18     | Divisible by both 2 and 9                                                                |
| 19     | Multiply last digit by 2, add to rest. Divisible by 19                                   |
| 20     | Last two digits divisible by 20 (00,20,40,60,80)                                         |

## Key Theorems

### Fundamental Theorem of Arithmetic
Every integer >1 is either prime or can be represented as a unique product of prime factors.

### Division Algorithm
For integers a and b (b>0), there exist unique integers q and r such that:
$$\LARGE a = bq + r \quad \text{where } 0 \leq r < b$$

## Advanced Concepts

### Greatest Common Divisor ([[GCD]])
- The largest integer that divides two numbers
- Calculated using Euclidean algorithm:
  ```python
  def gcd(a,b):
      while b: a,b = b, a%b
      return a
  ```

### Least Common Multiple ([[LCM]])
$$ \text{LCM}(a,b) = \frac{|a \times b|}{\text{GCD}(a,b)} $$

### Modular Arithmetic
- $a \equiv b \ (\text{mod}\ m)$ means $m \mid (a-b)$
- Properties:
  - Addition/Multiplication preserve congruences
  - Cancellation works if $\text{gcd}(c,m) = 1$
## Applications
- Cryptography (RSA algorithm)
- Error detection (checksums)
- Calendar calculations
- Computer science (hashing functions)

## Notes:
* all numbers that are not powers of 2 have **odd** factors