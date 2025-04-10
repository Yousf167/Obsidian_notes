#M/S  References: [[Lecture_5.pdf]]
Previous lesson: [[M&S lecture 4]] 
# Continue: Waiting Lines and Queuing Theory
# Multichannel Queuing Model with Poisson Arrivals and Exponential Service Times $(M/M/m)$
### Assumptions of the model:
* Arrivals are served on a FIFO basis. 
* There is no balking or reneging.
* Arrivals are independent of each other but the arrival rate is constant over time.
* Arrivals follow a Poisson distribution.
* Service times are variable and independent but the average is known.
* Service times follow a negative exponential distribution.
* The average service rate is greater than the average arrival rate.
### Equations*
* Let:
	* $m\ =\ \text{number of channels open}$
	* $\lambda = \text{average arrival rate}$
	* $\mu = \text{average service rate at each channel}$

1. $\text{The probability that there are zero customers is the system is:}$$$\Large P_0 = \frac{1}{\left[ \sum_{n=0}^{n=m-1} \frac{1}{n!} \left( \frac{\lambda}{\mu} \right)^n \right] + \frac{1}{m!} \left( \frac{\lambda}{\mu} \right)^m \frac{m \mu}{m \mu - \lambda}} \quad \text{for } m \mu > \lambda$$
2. $\text{The average number of customers or units in the system:}$
$$\Large L = \frac{\lambda \mu \left( \frac{\lambda}{\mu} \right)^m}{(m - 1)! (m \mu - \lambda)^2} P_0 + \frac{\lambda}{\mu}$$
3. $\text{The average time a unit spends in the waiting line or being serviced (namely, in the system):}$
$$\Large W = \frac{\mu \left( \frac{\lambda}{\mu} \right)^m}{(m - 1)! (m \mu - \lambda)^2} P_0 + \frac{1}{\mu} = \frac{L}{\lambda}$$
4. $\text{The average number of customers or units in line waiting for service}$:
$$\Large L_q = L - m\rho = L - \frac{\lambda}{\mu}$$
5. $\text{The average time a customer or unit spends in the queue waiting for service:}$
$$\Large W_q = W - \frac{m\rho}{\lambda} = W - \frac{1}{\mu} = \frac{L_q}{\lambda}$$
6. $\text{Utilization ratio}$
$$\Large \rho = \frac{\lambda}{m\mu}$$
$\small ^{*}\text{equations from single-channeled models are inapplicable here}$


Next lesson: [[M&S lecture 6]]