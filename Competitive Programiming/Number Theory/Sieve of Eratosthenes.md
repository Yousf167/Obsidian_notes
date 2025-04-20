In [mathematics](https://en.wikipedia.org/wiki/Mathematics "Mathematics"), the **sieve of Eratosthenes** is an ancient [algorithm](https://en.wikipedia.org/wiki/Algorithm "Algorithm") for finding all [prime numbers](https://en.wikipedia.org/wiki/Prime_number "Prime number") up to any given limit.

It does so by iteratively marking as [composite](https://en.wikipedia.org/wiki/Composite_number "Composite number") (i.e., not prime) the multiples of each prime, starting with the first prime number, 2. The multiples of a given prime are generated as a sequence of numbers starting from that prime, with [constant difference between them](https://en.wikipedia.org/wiki/Arithmetic_progression "Arithmetic progression") that is equal to that prime.[1](https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes#cite_note-horsley-1) This is the sieve's key distinction from using [trial division](https://en.wikipedia.org/wiki/Trial_division "Trial division") to sequentially test each candidate number for divisibility by each prime.[2](https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes#cite_note-ONeill-2) Once all the multiples of each discovered prime have been marked as composites, the remaining unmarked numbers are primes.
![[Animation_Sieve_of_Eratosth.gif|center]]
## Code:

```c++
// Sieve
int N = int(1e8);
vector<bool> sieve(N, 1);
void do_sieve(){
    sieve[0] = sieve[1] = 0;//Not Prome
    for (ll i = 2; i*i<=N; i++){
        if (sieve[i])//if(prime)
        {
            for (ll j = i*i; j<N; j+=i)
                sieve[j] = false;//check all multiples of the prime number as !Prime
        }
    }
}
```
