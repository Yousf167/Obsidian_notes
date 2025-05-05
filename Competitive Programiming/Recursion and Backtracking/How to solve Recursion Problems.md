Suppose we want to solve this problem:
* find the sum of all non negative integers up to `n`

You should ask yourself these questions:
## 1. What is the simplest possible input? (gets the basecase)
the simplest input is 1 or 0.
```cpp
if(n == 1) return 1;
if(n == 0) return 0;
```
## 2. What would this look like if visualized?
```
n = 4        |        n = 3
|1|          |       |1|
|1+2|        |       |1+2|
|1+2+3|      |       |1+2+3|
|1+2+3+4|    |
----------------------------------
if we know sum(3), we could find sum(4) where sum(4) = 4 + sum(3). 
```
## 3. How do hard cases relate to simpler cases? 
for any number n, the process will remain the same.

## 4. How could the pattern be generalized?
$$\large sum(n) = n + sum(n-1)$$
## 5. Can I assume that the simple solution applies to large inputs?
the problem is simple enough. We can assume that the equation in Q4 is true for all n >= 0.
```cpp
int sum(n)
{
	if(n == 0) return 0;
	if(n == 1) return 1;
	return n + sum(n - 1)
}
```

---

consider this problem:
* Write a function that takes two numbers n and m and outputs the number of unique paths from the top-left corner to the bottom-right corner of a n $\large\times$ m grid.
* Constraints: you can only move down or right 1 unit at a time.
![[fa17db7b65ff9f369836b52f24cb6a1b_MD5.jpeg|center]]

## 1. What is the simplest possible input? 
if either m or n is 1, then the answer will always be 1.
```cpp
if(n == 1 || m == 1) return 1;
```

![[bf693c1bf7b9dce1f4f3e93cf2c83ae7_MD5.jpeg|center]]
## 2, 3. 
![[881bc42d6fd2a3dfe5e920ea95b3cc91_MD5.jpeg|center]]
in case of the 3 x 3:
$$\large traverse(3, 3) = traverse(2,3) = traverse(3,2)$$

the answer will be:
```cpp
int traverse(n, m)
if(n == 1 || m == 1) return 1;
return traverse(n, m - 1) + traverse(n - 1, m);
```