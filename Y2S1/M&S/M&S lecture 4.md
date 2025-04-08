#M/S 
Previous lesson: [[M&S lecture 3]] 
# Waiting Lines and Queueing Theory
Queuing theory, the study of waiting lines, is a widely used quantitative analysis technique relevant to various real-life situations, such as grocery shopping or airplane takeoffs. It involves three main components: _arrivals_, _service facilities_, and _the waiting line itself_. This chapter explores how analytical models can help managers assess the cost and effectiveness of service systems. It covers waiting line costs, characteristics, and mathematical assumptions for developing queuing models. Additionally, it provides equations for calculating service system performance and demonstrates the use of queuing tables and computer programs to simplify computations.

Most waiting line problems are focused on finding the ideal level of service a firm should provide. In most cases, this service level is something management can control. 
When an organization _does_ have control, they often try to find the balance between two extremes.

There is generally a trade-off between cost of providing service and cost of waiting time:

*  A large staff and many service facilities generally results in high levels of service but have high costs.
* Having the minimum number of service facilities keeps service cost down but may result in dissatisfied customers.

Service facilities are evaluated on their _total expected cost_ which is the sum of __service costs__ and __waiting costs__. Organizations typically want to find the service level that minimizes the total expected cost.
![[Screenshot 2024-10-23 181058.png|center]]
## Ex: Three Rivers Shipping Company
* Three Rivers Shipping operates a docking facility on the Ohio River. 
* An average of 5 ships arrive to unload their cargos each shift.
* Idle ships are expensive.
* More staff can be hired to unload the ships, but that is expensive as well. 
* Three Rivers Shipping Company wants to determine the optimal number of teams of stevedores to employ each shift to obtain the minimum total expected cost.

| Detail                                                  \ # of Teams | 1       | __2__       | 3       | 4       |
| -------------------------------------------------------------------- | ------- | ----------- | ------- | ------- |
| a) Avg # of Ships Arriving per Shift                                 | 5       | __5__       | 5       | 5       |
| b) Avg time each ship waits to be unloaded(hours)                    | 7       | __4__       | 3       | 2       |
| c) Total ship hours lost per shift __($a \times b$)__                | 35      | __20__      | 15      | 10      |
| d) Est. Cost per hour of idle ship time                              | $1,000  | __$1,000__  | $1,000  | $1,000  |
| e) value of ship's lost time or waiting cost __($c \times d$)__      | $35,000 | __$20,000__ | $15,000 | $10,000 |
| f) Stevedore team salary or service cost                             | $6,000  | __$12,000__ | $18,000 | $24,000 |
| g) total expected cost __($e + f$)__                                 | $41,000 | __$32,000__ | $33,000 | $34,000 |
* having only _two_ teams working is the optimum solution 

Queuing systems consider populations as either unlimited (infinite) or limited (finite). An unlimited population is when arrivals represent only a small fraction of potential customers, such as cars at a tollbooth or shoppers at a supermarket. Most queuing models assume an infinite population, as it simplifies calculations. Finite populations, such as a shop with only a few machines, add complexity to modeling.

Arrivals can occur according to a fixed schedule or randomly, often following a Poisson distribution. Queuing models generally assume "patient" customers who wait for service without leaving. However, real-world behavior includes customers who balk (refuse to join a line) or renege (leave before being served). These behaviors highlight the importance of queuing theory for managing service levels, as seen in cases where shoppers abandon carts due to long lines.
## Queuing System Characteristics
* There are three parts to a queuing system:
	1. The arrivals or inputs to the system (sometimes referred to as the calling population).
	2. The queue or waiting line itself.
	3. The service facility.
*  These components have their own characteristics that must be examined before mathematical models can be developed.

## Arrival Characteristics
* Arrival Characteristics have three major characteristics: 
	* size
	* pattern 
	* behavior. 
* The size of the calling population can be either: 
	* unlimited (essentially infinite)  
	* limited (finite). An example of a finite population is a shop with only eight machines that might break down and require service.
* Most cases consider unlimited size
* The pattern of arrivals can arrive according to a known pattern(Ex: Scheduled) or can arrive randomly.
* Random arrivals generally follow a Poisson distribution. (predicted by this model)
## Service Facility Characteristics
* Basic queuing system configurations:
	- Service systems are classified in terms of the number of channels, or servers, and the number of phases, or service stops.
	- A single-channel system with one server is quite common.
	- Multichannel systems exist when multiple servers are fed by one common waiting line.
	- In a single-phase system, the customer receives service form just one server.
	- In a multiphase system, the customer has to go through more than one server.

![[Screenshot 2024-10-23 184617.png|center]]
![[Screenshot 2024-10-23 185829.png|center]]

## Identifying Models Using Kendall Notations
D. G. Kendall developed a notation for queuing models that specifies the pattern of arrival, the service time distribution, and the number of channels. It takes the form:
$$Arrival\ Distribution\ /\ Service\ Time\ Distribution\ /\ \#\ of\ Service\ Channels\ Open$$
Specific Letters are Used to represent probability distributions:
* $M$ = Poisson Distribution for number of occurrences (Exponential Times)
* $D$ = Constant (Deterministic) rate 
A single-channel model with Poisson arrivals and exponential service times would be represented by:
$$M/M/1$$
If a second channel is added the notation would read:
$$M/M/2$$
A three-channel system with Poisson arrivals and constant service time would be:
$$M/D/3$$
## Single-Channel Model, Poisson Arrivals, Exponential Service Times $(M/M/1)$
### Assumptions:

* Arrivals are served on a FIFO basis.
* There is no balking or reneging. 
* Arrivals are independent of each other but the arrival rate is constant over time.
* Arrivals follow a Poisson distribution.
* Service times are variable and independent but the average is known.
* Service times follow a negative exponential distribution. 
* Average service rate is greater than the average arrival rate.
 
 When these assumptions are met, we can develop a series of equations that define the queue’s _operating characteristics_.

### Equations:
$$\large \lambda\ = arrival\ rate$$
$$\large \mu\ = service\ rate$$
* The arrival rate and the service rate must be defined for the same time period.

1. The average number of customers or units in the system$(L)$:
$$\large L = \lambda \cdot W =\frac{\lambda}{\mu - \lambda}$$
2. The average time a customer spends in the system$(W)$:
$$\large W = \frac{1}{\mu - \lambda}$$
3. The average number of customers in the queue, $(L_q)$:
$$\large L_q = \rho\ \cdot L =\frac{\lambda^2}{\mu(\mu - \lambda)}$$
4. The average time a customer spends waiting in the queue, ($W_q$):
$$\large W_q = \rho \cdot\ W = \frac{\lambda}{\mu(\mu - \lambda)}$$
5. The utilization factor for the system, $\rho$, the probability the service facility is being used:
$$\large \rho = \frac{\lambda}{\mu}$$
6. The percent idle time, $P_0$, or the probability no one is in the system:
$$\large P_0 = 1 - \rho = 1 - \frac{\lambda}{\mu}$$
7. The probability that the number of customers in the system is greater than k, $P_{n>k}$ :
$$\large P_{n>k} = (\frac{\lambda}{\mu})^{k+1}$$
### Ex: Arnold's Muffler Shop
*  Arnold’s mechanic can install mufflers at a rate of 3 per hour.
* Customers arrive at a rate of 2 per hour. So:
$$\large \textbullet\ \lambda = 2\ cars\ arriving\ per\ hour$$ 
$$\large \textbullet\ \mu = 3\ cars\ serviced\ per\ hour$$
$$\large \therefore L = \frac{\lambda}{\mu - \lambda} = \frac{2}{3-2} = 2\ cars\ in\ the\ system\ on\ average$$
$$\large \therefore W = \frac{1}{\mu - \lambda} = \frac{1}{3-2} = 1\ hour\ that\ an\ average\ car\ spends\ in\ the\ system$$
$$\large \therefore L_q = \frac{\lambda^2}{\mu(\mu - \lambda)} = \frac{2^3}{3(3-2)} = 1.33\ Cars\ waiting\ in\ line\ on\ average$$
$$\large \therefore W_q = \frac{\lambda}{\mu(\mu - \lambda)} = 0.66\ hours = 40\ mins.\ avg.\ waiting\ time$$
$$\large \therefore \rho = \frac{\lambda}{\mu} = 66\%\ of\ the\ time,\ the\ mechanic\ is\ busy$$
$$\large \therefore P_0 = 1 - \frac{\lambda}{\mu} = 1 - \frac{2}{3} = 33\%\ probability\ that\ there\ are\ 0\ cars\ in\ the\ system$$

#### Probability of more than k cars in the system:

| $k$ | $P_{n>k} = (\frac{2}{3})^{k+1}$ |
| --- | ------------------------------- |
| 0   | 0.666                           |
| 1   | 0.444                           |
| 2   | 0.296                           |
| 3   | 0.198                           |
| 4   | 0.132                           |
| 5   | 0.088                           |
| 6   | 0.058                           |
| 7   | 0.039                           |
![[1729705580086.png]]

* Introducing costs into the model:
	* Arnold wants to do an economic analysis of the queuing system and determine the waiting cost and service cost.
	* The total service cost is:

$$\large Total\ service\ cost = (Number\ of\ channels) \times (Cost\ per\ channel) $$
$$\large \therefore Total\ service\ cost = mC_s$$
$$\large Total\ waiting\ cost = (Total\ time\ waiting\ by\ all\ arrivals)\times(Cost\ of\ waiting)$$
$$\large \therefore Total\ waiting\ cost = (\lambda W)C_w$$
* If waiting time cost is based on time in the queue:
$$\large \therefore Total\ waiting\ cost = (\lambda W_q)C_w$$
* So the total cost of the queuing system when based on time in the system is:
$$\large \sum cost = mC_s + \lambda W C_s$$
* And when based on time in the queue:
$$\large \sum cost = mC_s + \lambda W_qC_w$$
* In an __8 hour shift__, if it is estimated that the waiting cost per customer is __$50 per hour__, and the mechanic's service cost(wage) is __$15 per hour__, then:
$$\large  \sum cost = \$50(8)(2)(\frac{2}{3}) + 8(1)(\$15) = $653.33$$


next lesson: [[M&S Lecture 5]]