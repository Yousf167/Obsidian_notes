#statistics 

# Descriptive Statistics
Statistics is a science of information. Information may be qualitative or quantitative. Suppose $Y_1\ , Y_2\ ,....Y_N$ are all the elements in the population and $X_1\ , X_2\ ,....X_n$ are the sample drawn from $Y_1\ , Y_2\ ,....Y_N$ where:
* __N__ is the population size
* __n__ is the sample size

We introduce several numerical measures to obtain important information about the population. These numerical measures computed from a sample are called _sample statistics_ while those numerical measures computed from a population are called _population parameters_.

---
# Percentiles & Quartiles
The $P^{th}$ percentile is a value such as at least P percent of the data have this value or less. In other words, if you have a set of numbers arranged in order, the $P^{th}$ percentile is the value that separates the lowest $P\%$ of the data from the rest.
* Note: the $50^{th}$ percentile = median
## To calculate the $P^{th}$ percentile:
1. Arrange the data ascendingly
2. Compute an index $\large i =(\frac{P}{100})n$
3. 
  * (a) If $i$ is _not an integer_, round up, i.e., the next integer value greater than $i$ denotes the position of the $P^{th}$ percentile	
  * (b) If $i$ is an _integer_, the $P^{th}$ percentile is the average of the data values in positions $i$ and $i+1$. When dividing data into quartiles, you get:

![[Screenshot 2024-10-14 182156.png|center]]
### Ex:
* The scores of ten students are: 1, 3, 5, 7, 9, 4, 6, 8, 10.
* find the $40^{th}$ and the $26^{th}$ percentiles.
#### Solution:
##### Step 1: Sort Ascendingly
$$\large 1, 2, 3, 4, 5, 6, 7, 8, 9, 10$$
##### Step 2:
* For the $40^{th}$ percentile: $\large i\ =\ (\frac{40}{100})10\ =\ 4$
$\therefore 40^{th}\ percentile\ =\ \frac{4+5}{2}\ =\ 4.5$

* For the $26^{th}$ percentile: $\large i\ =\ (\frac{26}{100})10\ =\ 2.6$
 $\therefore 26^{th}\ percentile\ =\ 3$

---
# Measures of Central Tendency
the __MCTs__ Are:
1. The Mode: most repeated number.
2. Mean: The Mean of a Sample( $\bar X$ ):
$$\LARGE \bar X\ =\ \frac{\sum_{i=1}^n(X_i)}{n}\ $$$$\LARGE = \frac{X_1+X_2+...+X_n}{n}$$ 
3. Median: The value in the middle after sorting.

If a data set or population is _symmetric_ (i.e., if one side of the distribution of the observations is a _mirror image_ of the other) and if the distribution of the observations has only one mode, then the __mode__, the __median__, and the __mean__ are all __equal__. Such a situation is demonstrated in this example:
$$150, 152, 155, 165, 167, 168, 171, 177, 295$$
Generally, when the data distribution is _not symmetric_, then the __mean, median, and mode__ will __not__ all be equal.
![[Screenshot 2024-10-14 174602.png|center]]

---
# Measures of Variability
There are several measures of variability, or dispersion; _The range_$^1$ of a set of observations is the __difference__ between the __largest__ observation and the __smallest__ observation. There are also two other, more commonly used measures of dispersion. These are _The Variance_$^2$ and the square root of the variance: _The Standard Deviation_$^3$. 
$$\LARGE \textbullet \ Sample\ Variance:$$$$\LARGE\ S^2 =\ \frac{\sum_{i = 1}^n(x_i\ -\ \bar x)}{n-1}$$$$\LARGE = \frac{\sum_{i=1}^n x_i\ -\ \frac{(\sum_{i=1}^n x_i)^2}{n}}{n-1}$$ $$\LARGE = \frac{\sum_{i=1}^n x_i^2\ -\ n\bar x^2}{n-1}$$
$$\large \textbullet\ STD.\ Deviation = \sqrt{S^2}$$
## The coefficient of variation
The coefficient of variation (CV) is a statistical measure of the relative variability of data points in a dataset. It is defined as the ratio of the standard deviation to the mean and is typically expressed as a percentage. The formula is:
$$\large  Coefficient\ of\ Variation(C.V)\ =\ \frac{S}{\bar x} \times 100$$

The coefficient of variation provides a normalized measure of dispersion, making it useful for comparing the degree of variability between datasets with different units or vastly different means.
### Key points:
- **Low CV**: Indicates less variability relative to the mean.
- **High CV**: Indicates greater variability relative to the mean.

For example, if you have two datasets representing different things (e.g., incomes in different countries), the CV can help compare the spread of the data relative to the average, regardless of the actual values of the data.

next lesson: [[Statistics lecture 3]]