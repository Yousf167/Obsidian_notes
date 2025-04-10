#M/S 

[[#Example 1]] [[#Example 2]] [[#Example 3: Harry's Auto Tire]]
## Monte Carlo Method:

**Monte Carlo methods** are a way to estimate a __Probabilistic Variable__ by using random numbers; Like trying to find the average height of people in a city, Instead of measuring everyone, you could randomly pick a few people and take their average. This would give you a very good estimate.

### Examples of Probabilistic Variables:
* There are a lot of variables in real-world systems that are probabilistic in nature and that we might want to simulate. A few examples of these variables follow:
    1. Inventory demand.
    2. Lead time for inventory.
    3. Times between machine breakdowns.
    4. Times between arrivals.
    5. Service times.
    6. Times to complete project activities.
    7. Number of employees absent.


---

### How it works:
1. **Random sampling:** Pick random numbers from a specific range.
2. **Calculation:** Do something with those numbers.
3. **Averaging:** Find the average of the results.     


---

### Steps:
1. Establishing a probability distribution for important variables. (freq / total)
2. Building a cumulative probability distribution for each variable. (prob[i] += prob[i - 1])
3. Establishing an interval of random numbers for each variable. ($x_i + 1\ to\ x_{i+1}$)
4. Generating random numbers.
5. simulating a series of trials.


---
### Why use it?
- **Complex problems:** It's good for problems that are too hard to solve directly.
- **Randomness:** It uses randomness to get a good estimate.
- **Many applications:** It can be used in many fields like science, finance, and engineering.

---

### Example 1:

To estimate the value of pi, you could:

1. Pick random points inside a square.
2. Count how many points are also inside a circle within the square.
3. The ratio of points inside the circle to the total points is an estimate of pi/4.


---

### Example 2:

Consider a simple example of rolling dice. Assume that you want to determine the probability of rolling a seven using two dice with values one through six. There are 36 possible combinations for the two dice, six of which will total seven, as shown in the following image.
![[dice.png|center]]
This means that mathematical probability of rolling a seven is six in 36, or 16.67 percent.

But is the mathematical probability the same as the _actual_ probability? Or are there other factors that might affect the mathematical probability, such as the design of the dice themselves, the surface on which they are thrown, and the technique that is used to roll them?

To determine the _actual_ probability of rolling a seven, you might physically roll the dice 100 times and record the outcome each time. Assume that you did this and rolled a seven 17 out of 100 times, or 17 percent of the time. Although this result would represent an actual, physical result, it would still represent an _approximate_ result. If you continued to roll the dice again and again, the result would become less and less approximate.

A Monte Carlo simulation is the mathematical representation of this process. It allows you to simulate the act of physically rolling the dice and lets you specify how many times to roll them. Each roll of the dice represents a single iteration in the overall simulation; as you increase the number of iterations, the simulation results become more and more accurate. For each iteration, variable inputs are generated at random to simulate conditions such as dice design, rolling surface, and throwing technique. The results of the simulation would provide a statistical representation of the physical experiment described above.

---

### Example 3: Harry's Auto Tire
* A popular radial tire accounts for a large portion
  of the sales at Harry’s Auto Tire.
* Harry wishes to determine a policy for managing
  this inventory.
* He wants to simulate the daily demand for a
  number of days.
  
#### Step 1: Establishing probability distributions
* One way to establish a probability distribution for a
  given variable is to examine historical outcomes.
* Managerial estimates based on judgment and
  experience can also be used.

| Demand | Frequency (days) | Probability of Occurrence |
| ------ | ---------------- | ------------------------- |
| 0      | 10               | 10/200 = 0.05             |
| 1      | 20               | 20/200 = 0.1              |
| 2      | 40               | 0.2                       |
| 3      | 60               | 0.3                       |
| 4      | 40               | 0.2                       |
| 5      | 30               | 0.15                      |
| Total  | **200**          | 1                         |

#### Step 2: Building a cumulative probability distribution for each variable
* Converting from a regular probability to a
  cumulative distribution is an easy job.
* A _cumulative probability_ is _the probability that a
  variable will be less than or equal to a particular
  value._
 * A cumulative distribution lists all of the possible
   values and the probabilities, as shown in the following table:

| Demand | Frequency (days) | Probability of Occurrence | Cumulative Probability |
| ------ | ---------------- | ------------------------- | ---------------------- |
| 0      | 10               | 10/200 = 0.05             | 0.05                   |
| 1      | 20               | 20/200 = 0.1              | 0.15                   |
| 2      | 40               | 0.2                       | 0.35                   |
| 3      | 60               | 0.3                       | 0.65                   |
| 4      | 40               | 0.2                       | 0.85                   |
| 5      | 30               | 0.15                      | 1.00                   |
| Total  | **200**          | 1                         |                        |


#### Step 3: Setting random number intervals
* Assign a set of numbers to represent each possible value or outcome. These are __random number intervals.__
* A __random number__ is a series of digits that have
  been selected by a totally random process.
* The range of the random number intervals
  corresponds exactly to the probability of the
  outcomes as shown in the following:

![[Screenshot 2024-10-11 122244.png]]

| Demand | Frequency (days) | Probability of Occurrence | Cumulative Probability | Interval of Random Numbers |
| ------ | ---------------- | ------------------------- | ---------------------- | -------------------------- |
| 0      | 10               | 10/200 = 0.05             | 0.05                   | 01 - 05                    |
| 1      | 20               | 20/200 = 0.1              | 0.15                   | 06 - 15                    |
| 2      | 40               | 0.2                       | 0.35                   | 16 - 35                    |
| 3      | 60               | 0.3                       | 0.65                   | 36 - 65                    |
| 4      | 40               | 0.2                       | 0.85                   | 66 - 85                    |
| 5      | 30               | 0.15                      | 1.00                   | 86 - 00                    |
| Total  | **200**          | 1                         |                        |                            |


#### Step 4: Generating random numbers
*  Random numbers can be generated in several ways.
* Large problems will use computer program to generate the needed random numbers.
* For small problems, random processes like roulette wheels or pulling chips from a hat may be used.
* The most common manual method is to use a _random number table_.
* Because everything is random in a random number table, we can select numbers from anywhere in the table to use in the simulation.

| 52  | 06  | 50  | 88  | 53  | 30  | 10  | 47  | 99  | 37  |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 37  | 63  | 28  | 02  | 74  | 35  | 24  | 03  | 29  | 60  |
| 82  | 57  | 68  | 28  | 05  | 94  | 03  | 11  | 27  | 79  |
| 69  | 02  | 36  | 49  | 71  | 99  | 32  | 10  | 75  | 21  |
| 98  | 94  | 90  | 36  | 06  | 78  | 23  | 67  | 89  | 85  |
| 96  | 52  | 62  | 87  | 49  | 56  | 59  | 23  | 78  | 71  |
| 33  | 69  | 27  | 21  | 11  | 60  | 95  | 89  | 68  | 48  |
| 50  | 33  | 50  | 95  | 13  | 44  | 34  | 62  | 64  | 39  |
| 88  | 32  | 18  | 50  | 62  | 57  | 34  | 56  | 62  | 31  |
| 90  | 30  | 36  | 24  | 69  | 82  | 51  | 74  | 30  | 35  |


#### Step 5: Simulating the experiment:
* We select random numbers from the table .
* The number we select will have a corresponding range in the table. 
* We use the daily demand that corresponds to the probability range aligned with the random number.


| DAY   | RANDOM NUMBER  |                  SIMULATED DAILY DEMAND                  |
| ----- | :------------: | :------------------------------------------------------: |
| 1     |       52       |                            3                             |
| 2     |       37       |                            3                             |
| 3     |       82       |                            4                             |
| 4     |       69       |                            4                             |
| 5     |       98       |                            5                             |
| 6     |       96       |                            5                             |
| 7     |       33       |                            2                             |
| 8     |       50       |                            3                             |
| 9     |       88       |                            5                             |
| 10    |       90       |                            5                             |
| Total | ______________ | total 10-day demand = 39<br>average demand per day = 3.9 |

Note that the average demand from this simulation (3.9 tires) is different from the expected daily demand.

$$
Expected\ daily\ demand = \sum_{i\ =\ 0}^{n}P(Tires_i) \cdot Demand(Tires_i)
$$
$$
\therefore Expected\ daily\ demand = (0.05)(0) + (0.10)(1) + (0.20)(2) + (0.30)(3)
$$
$$
 +(0.20)(4) + (0.15)(5) = 2.95\ tires
$$

If this simulation were repeated hundreds or thousands of times it is much more likely the average simulated demand would be nearly the same as the expected demand due to _The Law of Large Numbers_.

#####  The Law of Large Numbers:
The results obtained from performing a large number of trials should be close to the expected value. And it will become closer to the true expected value, the more trials you perform.
___
---
---


next lesson: [[M&S lecture 3]]