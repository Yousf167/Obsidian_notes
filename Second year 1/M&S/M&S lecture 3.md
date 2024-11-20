#M/S 
# Simulation and Inventory Analysis
* We have seen deterministic inventory models. 
* In many real-world inventory situations, demand and lead time are variables.
* Accurate analysis is difficult without simulation.
* We will look at an inventory problem with two decision variables and two probabilistic components.
## Ex:
* An owner of a hardware store wants to establish order quantity and reorder point decisions for a product that has probabilistic daily demand and reorder lead time.
* The owner of the hardware store wants to find a good, low cost inventory policy for an electric drill.
* Simkin identifies two types of variables: _controllable_ and _uncontrollable_ inputs.
* The controllable inputs are the order quantity and reorder points.
* The uncontrollable inputs are daily demand and variable lead time.
* The demand data for the drill is shown in the table.

| Demand for Ace Drill | Frequency(Days) | Probability | Cumulative Probability | Interval of Random Numbers |
| -------------------- | --------------- | ----------- | ---------------------- | -------------------------- |
| 0                    | 15              | 0.05        | 0.05                   | 01 to 05                   |
| 1                    | 30              | 0.10        | 0.15                   | 06 to 15                   |
| 2                    | 60              | 0.20        | 0.35                   | 16 to 35                   |
| 3                    | 120             | 0.40        | 0.75                   | 36 to 75                   |
| 4                    | 45              | 0.15        | 0.90                   | 76 to 90                   |
| 5                    | 30              | 0.10        | 1                      | 91 to 00                   |
| Total                | _300_           | 1.00        |                        |                            |

* Probabilities and Random Number Intervals for Reorder Lead Time

| Lead Time(Days) | Frequency(Orders) |
| --------------- | ----------------- |
| 1               | 10                |
| 2               | 25                |
| 3               | 15                |
| Total           | 50                |

* Probabilities and Random Number Intervals for Reorder Lead Time

| Lead Time(Days) | Frequency(Orders) | Cum Prob. | Random # Interval |
| --------------- | ----------------- | --------- | ----------------- |
| 1               | 10                | 0.20      | 01 to 20          |
| 2               | 25                | 0.70      | 21 to 70          |
| 3               | 15                | 1.00      | 71 to 00          |
| Total           | 50                |           |                   |
* The third step is to develop a simulation model.
* A flow diagram, or flowchart, is helpful in this process.
* The fourth step in the process is to specify the values of the variables that we wish to test.
* The first policy that Simkin wants to test is an order quantity of 10 with a reorder point of 5.
* The fifth step is to actually conduct the simulation.
* The process is simulated for a 10 day period.

![[images/Screenshot 2024-10-17 192612.png|center]]

Using the table of random numbers, the simulation is conducted using a four-step process:
1. Begin each day by checking whether an ordered inventory has arrived. If it has, increase the current inventory by the quantity ordered.
2. Generate a daily demand from the demand probability by selecting a random number.
3. Compute the ending inventory every day. If on-hand inventory is insufficient to meet the day’s demand, satisfy as much as possible and note the number of lost sales.
4. Determine whether the day’s ending inventory has reached the reorder point. If necessary place an order.

| Day   | Units Recieved     | Beginning Inventory | Random #   | Demand    | Ending Inventory | Lost sales | Order? | Random Number | Lead Time |
| ----- | ------------------ | ------------------- | ---------- | --------- | ---------------- | ---------- | ------ | ------------- | --------- |
| 1     | .................. | 10                  | 06         | 1         | 9                | 0          | N      |               |           |
| 2     | 0                  | 9                   | 63         | 3         | 6                | 0          | N      |               |           |
| 3     | 0                  | 6                   | 57         | 3         | 3                | 0          | _Y_    | 02            | 1         |
| 4     | 0                  | 3                   | 94         | 5         | 0                | 2          | N      |               |           |
| 5     | 10                 | 10                  | 52         | 3         | 7                | 0          | N      |               |           |
| 6     | 0                  | 7                   | 69         | 3         | 4                | 0          | _Y_    | 33            | 2         |
| 7     | 0                  | 4                   | 32         | 2         | 2                | 0          | N      |               |           |
| 8     | 0                  | 2                   | 30         | 2         | 0                | 0          | N      |               |           |
| 9     | 10                 | 10                  | 48         | 3         | 7                | 0          | N      |               |           |
| 10    | 0                  | 7                   | 88         | 4         | 3                | 0          | _Y_    | 14            | 1         |
| Total | ----------         | ------------        | ---------- | --------- | 41               | -------    | ------ | ----------    | ------    |

* The objective is to find a low-cost solution so Simkin must determine the costs.
* Equations for average daily ending inventory, average lost sales, and average number of orders placed.

$\large \textbullet Avg\ Ending\ Inventory\ =\ \frac{41\ total\ units}{10\ days}\ =\ 4.1\ units\ per\ day$
$\large \textbullet Avg\ lost\ sales\ =\ \frac{2\ sales\ lost}{10\ days}\ =\ 0.2\ units\ per\ day$
$\large \textbullet Avg\ Number\ of\ Orders\ Placed\ =\ \frac{3\ Orders}{10\ days}\ =\ 0.3\ orders\ per\ day$
### Analysis
* Simkin’s store is open 200 days a year.
* Estimated ordering cost is $10 per order.
* Holding cost is $6 per drill per year.
* Lost sales cost $8.

$$\large
\textbullet\ Daily\ order\ cost\ =\ (Cost_{one\ order}) \times (N_{orders\ placed\ per\ day})
$$
$$\large
= $10\ per\ order\ \times 0.3\ order\ per\ day\ = $3
$$

$$\large
\textbullet\ Daily\ holding\ cost\ =\ (holding\ Cost_{one\ unit\ for\ one\ day}) \times (Average\ ending\ inventory)\ 
$$
$$\large
=\ 0.03\ per\ unit\ per\ day \times 4.1\ units\ per\ day\ = $0.12
$$

$$\large
\textbullet\ Daily\ Stockout\ Cost\ = (Cost\ per\ lost\ sale) \times (Avg\ \#\ of\ lost\ sales\ /\ day)
$$
$$\large
=\ $8\ per\ lost\ sale \times 0.2\ lost\ sales\ per\ day\ =\ $1.60
$$

$$\large
\textbullet\ Total\ daily\ inventory\ cost\ = Daily\ Order\ Cost\ +\ Daily\ Holding\ Cost 
$$
$$\large
+\ Daily\ Stockout\ cost =\ $4.72
$$

* For the year, this policy would cost approximately $944. 
* This simulation should really be extended for many more days, perhaps 100 or 1,000 days.
* Even after a larger simulation, the model must be verified and validated to make sure it truly represents the situation on which it is based.
* If we are satisfied with the model, additional simulations can be conducted using other values for the variables.
* After simulating all reasonable combinations, Simkin would select the policy that results in the lowest total cost.


next lesson: [[M&S lecture 4]]