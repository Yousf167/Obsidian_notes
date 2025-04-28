# Bit masking
## Rules
* $\large if\ a \oplus b = c,\ then\ a \oplus c = b,\ b \oplus c = a$ 
* $\large \ a \oplus \ a \oplus a = a,\ \ a \oplus\ a \oplus\ a \oplus\ a = 0$. if the number is even then _0_, if odd then _a_.
* $\large 2^x - 1 = (x\ number\ of\ 1s)$
* $\large 2^x + 2^x = 2^{x+1}$,  $\large 2^x - 1 = \sum_{i = 0}^{x - 1}2^i$
* $\large \sum_{i=k}^{n}2^i = 2^{n+1} - 2^k$
* if N & (N - 1) = 0, N is a power of 2 
* ANDing always decreases a number
## Bit-Wise Shift Operator
* consider a binary number `100110`. When the number is shifted right, the number is essentially divided by 2. Another way to think about it is that when the number is shifted in any direction, the position of the bits is changed, and so is the power of 2. For example:
```cpp
int x = 38;
//power of position: 5 4 3 2 1 0
//               x = 1 0 0 1 1 0
x >>= 1; 
//power of position: 4 3 2 1 0 -1
//               x = 1 0 0 1 1 0 
//when the number is converted, the powers are multiplied by their corresponding powers and added.
//the negative power is accounted for and the result will be 2^(-1) = 0.5; therefore the number is divided by 2
``` 

* you can create a modulo operator __iff__ the number after the mod is a power of 2
```cpp
int x = 14 //1110
int op = 4 //0100
int mod = op - 1//0011
int ans = x & mod
//   1110
// & 0011
//--------
//   0010 (2)_10
```

* you can get the count of `1` in a binary number using the `count()` function or:
```cpp
int countBits(int n)
{
	int cnt = 0;
	while(n != 0)
	{
		cnt += 1 & num;
		num >>= 1;
	}
	return cnt;
}
//OR
int countBits(int n)
{
	int cnt = 0;
	while(n)
	{
		cnt ++;
		n &= (n - 1);
	}
	return cnt;
}
```
## Essential functions:
```cpp
int getBit(int x, int pos)
{
	return (x >> pos) & 1;
}

void setBit1(int& x, int pos)
{
	x |= (1 << pos)
}

void setBit0(int& x, int pos)
{
	num &= ~(1 << pos)
}

void flipBit(int& x, int pos)
{
	num ^= 1 << pos;
}

int getRightmost1(int x)
{
	return x & ~(x - 1);
	//if x = 1001100, the returned value will be 0000100
}
```
## Additional Notes
```cpp
//if you need to check if some operation is equall to a value:
x & y == z
//operation precedence needs to be explicitly specified
(x & y) == z
//before, it would work like this:
x & (y == z)
```

```cpp
long long num = 1 << 60   //❌ 1 is int. Will cause overflow
long long num = 1LL << 60 //✅
```

* you can treat a binary number like an array
* for prefix XOR sums, when asked to find the XOR sum in a given range \[a, b]:
	1. create a prefix XOR sum array
	2. calculate $\large prefix[a - 1] \oplus prefix[b]$

```cpp
#include <iostream>
using namespace std;
int main()
{
	ios_base::sync_with_stdio(false);
	cin.tie(0);
	int n, q; cin>>n>>q;
	int arr[n];
	for(int i = 0; i < n; i++) cin>>arr[i];
	
	int prefix[n]; prefix[0] = arr[0];
	for(int i = 1; i < n; i++)
	{
		prefix[i] = prefix[i - 1] ^ arr[i];
	}
	
	while(q--)
	{
		int l, r; cin>>l>>r;	
		l--;r--;
		cout << (prefix[r] ^ (l > 0 ? prefix[l - 1] : 0)) << endl;
	}
}
```

* The minimum possible sum of an array is the OR of the entire array given that you can replace two elements under the constraint `arr[i] | arr[j] = x | y`

## Rethinking Bitwise Operations: A High-Level Analogy

Let’s treat **each bit** like a **decision**, and each bit position like a **voter**.

### 1. `XOR (^)`: Disagreement Detector

> Think of `a ^ b` as: "Where do `a` and `b` disagree?"
- If both bits are **the same**, XOR gives 0.
- If they **disagree**, XOR gives 1.
#### Analogy:

> XOR is like a **difference counter** between two things.

If `a ^ x` is big, it means `x` is very different from `a`.

### 2. `OR (|)`: Maximizing or Covering

> `a | b` tells you what bits are set in **either** of them.

Think of it like:

> “What’s the most I’ll ever need to flip ON to cover both `a` and `b`?”

So if you pick `x = a | b`, you're saying:

### 3. `AND (&)`: Agreement Finder

> `a & b` gives the bits that are 1 **in both**.

Think of it like a **common ground**.

##  Mental Models Recap

| Operator | Mental Model                  | How to Think                                       |
| -------- | ----------------------------- | -------------------------------------------------- |
| XOR (^)  | Disagreement counter          | How many bits differ?                              |
| OR (\|)  | Maximum overlap               | What is the most i'll need to cover these numbers? |
| AND (&)  | Minimum overlap / Commonality | What do both values already agree on?              |
Bitwise operators operate at the **binary level**, directly manipulating individual bits of integers. They're commonly used in systems programming, competitive programming, embedded systems, etc. Let's break it down into:

---

### 🔧 Bitwise Operators (in most languages like C, C++, Java, etc.):

| Operator | Name               |
| -------- | ------------------ |
| `&`      | AND                |
| `\|`     | OR                 |
| `^`      | XOR (exclusive OR) |
| `~`      | NOT (complement)   |
| `<<`     | Left shift         |
| `>>`     | Right shift        |


###  Bitwise Identities and Rules:

#### ✅ Basic Identities:

Let `x` be an integer:
- `x & 0 = 0`
- `x | 0 = x`
- `x ^ 0 = x`
- `x & 1 =` LSB of `x` (checks if number is odd or even)
- `x ^ x = 0`
- `x | x = x`
- `x & x = x`
- `x ^ ~x = -1` (in 2's complement)


#### ✅ Commutative Properties:

- `a & b = b & a`
    
- `a | b = b | a`
    
- `a ^ b = b ^ a`
    

#### ✅ Associative Properties:

- `(a & b) & c = a & (b & c)`
    
- `(a | b) | c = a | (b | c)`
    
- `(a ^ b) ^ c = a ^ (b ^ c)`
    

#### ✅ Distributive Properties:

- `a & (b | c) = (a & b) | (a & c)`
    
- `a | (b & c) = (a | b) & (a | c)`
    
- `a ^ (b ^ c) = (a ^ b) ^ c` (also associative)
    


###  Useful Tricks / Applications:

- Check if a number is power of two: `x & (x - 1) == 0` (only one bit set)
- Clear the lowest set bit: `x & (x - 1)`
- Get the lowest set bit only: `x & (-x)`
- Swap values without temp:

    ```cpp
    a ^= b;
    b ^= a;
    a ^= b;
    ```

- Set the `n`-th bit: `x | (1 << n)`
- Clear the `n`-th bit: `x & ~(1 << n)`
- Toggle the `n`-th bit: `x ^ (1 << n)`
- Check if the `n`-th bit is set: `x & (1 << n)`


# C++ `bitset` Overview

The `bitset` in C++ is a container that stores bits (values that are either 0 or 1) in a fixed-size sequence. It's part of the C++ Standard Library and is useful for efficient bit manipulation operations.

## Key Features

- Fixed size (determined at compile time)
- Efficient storage (each bit uses only 1 bit of memory)
- Provides bitwise operations and access to individual bits
- Useful for flags, binary representations, and bit manipulation

## Basic Usage

```cpp
#include <bitset>
#include <iostream>

int main() {
    // Create a bitset with 8 bits, all initialized to 0
    std::bitset<8> bits;
    
    // Set some bits
	bits[0] = 1;       // Set first bit (LSB; RIGHTMOST BIT)
    bits.set(3);        // Set 4th bit (0-based index)
    
    // Count number of set bits
    std::cout << "Bits set: " << bits.count() << "\n";
    
    // Output the bitset
    std::cout << "Binary: " << bits << "\n";
    std::cout << "Decimal: " << bits.to_ulong() << "\n";
    
    return 0;
}
```

## Common Operations

### Initialization
```cpp
std::bitset<8> b1;             // All bits 0
std::bitset<8> b2(0xfa);        // From hexadecimal
std::bitset<8> b3("11001010");  // From binary string
```

### Bit Access
```cpp
bits[2] = 1;            // Access individual bit
bool val = bits.test(2); // Check if bit is set (with bounds checking)
bits.set(3);             // Set bit at position 3 to 1
bits.reset(3);           // Set bit at position 3 to 0
bits.flip(3);            // Toggle bit at position 3
```

### Bitwise Operations
```cpp
std::bitset<8> a("1100");
std::bitset<8> b("1010");

auto c = a & b;  // Bitwise AND
auto d = a | b;  // Bitwise OR
auto e = a ^ b;  // Bitwise XOR
auto f = ~a;     // Bitwise NOT
```

### Other Operations
```cpp
bits.all();      // True if all bits are set
bits.any();      // True if any bit is set
bits.none();     // True if no bits are set
bits.size();     // Returns number of bits
bits.to_string();// Convert to string
bits.to_ulong(); // Convert to unsigned long
bits.to_ullong();// Convert to unsigned long long
```

## Example: Using bitset for Flags

```cpp
#include <bitset>
#include <iostream>

enum FeatureFlags {
    HAS_WIFI = 0,
    HAS_BLUETOOTH = 1,
    HAS_GPS = 2,
    HAS_NFC = 3
};

int main() {
    std::bitset<4> deviceFeatures;
    
    deviceFeatures.set(HAS_WIFI);
    deviceFeatures.set(HAS_NFC);
    
    if (deviceFeatures.test(HAS_WIFI)) {
        std::cout << "Device has WiFi\n";
    }
    
    std::cout << "Feature flags: " << deviceFeatures << "\n";
    
    return 0;
}
```

## Performance Considerations

- `bitset` operations are generally very fast (often single CPU instructions)
- Size must be known at compile time
- For dynamic sizes, consider `vector<bool>` (though it has some differences)

The `bitset` class is particularly useful when you need to work with binary representations or perform bit manipulation operations efficiently.