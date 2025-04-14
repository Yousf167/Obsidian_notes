# Bit masking
## Rules
* $\large if\ a \oplus b = c,\ then\ a \oplus c = b,\ b \oplus c = a$ 
* $\large \ a \oplus \ a \oplus a = a,\ \ a \oplus\ a \oplus\ a \oplus\ a = 0$. if the number is even then _0_, if odd then _a_.
* $\large 2^x - 1 = (x\ number\ of\ 1s)$
* $\large 2^x + 2^x = 2^{x+1}$,  $\large 2^x - 1 = \sum_{i = 0}^{x - 1}2^i$
* $\large \sum_{i=k}^{n}2^i = 2^{n+1} - 2^k$
* if N & (N - 1) = 0, N is a power of 2 
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