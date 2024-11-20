#M/S 
previous lesson: [[M&S Lecture 5]]
# Transportation 
The transportation problem deals with the distribution of goods from several points of supply (origins or sources) to a number of points of demand (destinations). Usually we are given a capacity (supply) of goods at each source, a requirement (demand) for goods at each destination, and the shipping cost per unit from each source to each destination. An example is shown in Figure 3.1. The objective of such a problem is to schedule shipments so that total transportation costs are minimized. At times, production costs are included also.

Transportation models can also be used when a firm is trying to decide where to locate a new facility. Before opening a new warehouse, factory, or sales office, it is good practice to consider a number of alternative sites. Good financial decisions concerning the facility location also attempt to minimize total transportation and production costs for the entire system.

![[Screenshot 2024-11-20 132807.png|center]]
## Algorithm
The transportation algorithm is an iterative procedure in which a solution to a transportation problem is found and evaluated using a special procedure to determine whether the solution is optimal. If it is optimal, the process stops. If it is not optimal, a new solution is generated. This new solution is at least as good as the previous one, and it is usually better. This new solution is then evaluated, and if it is not optimal, another solution is generated. The process continues until the optimal solution is found.

We will illustrate this process using the Executive Furniture Corporation example shown in Figure 3.1. This is presented again in a special format in Table 3.2.

We see in Table 3.2 that the total factory supply available is exactly equal to the total warehouse demand. When this situation of equal demand and supply occurs (something that is rather unusual in real life), a balanced problem is said to exist. Later in this chapter we take a look at how to deal with unbalanced problems, namely, those in which destination requirements may be greater than or less than origin capacities.

Developing an Initial Solution: Northwest Corner Rule When the data have been arranged in tabular form, we must establish an initial feasible solution to the problem. One systematic procedure, known as the northwest corner rule, requires that we start in the upper-left-hand cell (or northwest corner) of the table and allocate units to shipping

routes as follows:

1. Exhaust the supply (factory capacity) at each row before moving down to the next row.

2. Exhaust the (warehouse) requirements of each column before moving to the right to the next column.

3. Check that all supply and demands are met.

We can now use the northwest corner rule to find an initial feasible solution to the Executive Furniture Corporation problem shown in Table 3.2.

![[Screenshot 2024-11-20 133246.png|center]]

![[Screenshot 2024-11-20 133443.png|center]]

It takes five steps in this example to make the initial shipping assignments (see Table 3.3):

1. Beginning the upper-left-hand corner, we assign 100 units from Des Moines to Albuquerque. This exhausts the capacity or supply at the Des Moines factory. But it still leaves the warehouse at Albuquerque 200 desks short. Move down to the second row in the same column.

2. Assign 200 units from Evansville to Albuquerque. This meets Albuquerque’s demand for a total of 300 desks. The Evansville factory has 100 units remaining, so we move to the right to the next column of the second row.

3. Assign 100 units from Evansville to Boston. The Evansville supply has now been exhausted, but Boston’s warehouse is still short by 100 desks. At this point, we move down vertically in the Boston column to the next row.

3. Assign 100 units from Fort Lauderdale to Boston. This shipment will fulfill Boston’s demand for a total of 200 units. We note, though, that the Fort Lauderdale factory still has 200 units available that have not been shipped.

5. Assign 200 units from Fort Lauderdale to Cleveland. This final move exhausts Cleveland’s demand and Fort Lauderdale’s supply. This always happens with a balanced problem. The initial shipment schedule is now complete.

We can easily compute the cost of this shipping assignment:

![[Screenshot 2024-11-20 133633.png|center]]
This solution is feasible since demand and supply constraints are all satisfied. It was also very quick and easy to reach. However, we would be very lucky if this solution yielded the optima transportation cost for the problem, because this route-loading method totally ignored the costs of shipping over each of the routes After the initial solution has been found, it must be evaluated to see if it is optimal. We compute an improvement index for each empty cell using the __stepping-stone method__. If this indicates a better solution is possible, we use the stepping-stone path to move from this solution to improved solutions until we find an optimal solution.

## The Stepping-Stone Method
The stepping-stone method is an iterative technique for moving from an initial feasible solution to an optimal feasible solution. This process has two distinct parts: The first involves testing the current solution to determine if improvement is possible, and the second part involves making changes to the current solution in order to obtain an improved solution. This process continues until the optimal solution is reached.

For the stepping-stone method to be applied to a transportation problem, one rule about the number of shipping routes being used must first be observed: The number of occupied routes (or squares) must always be equal to one less than the sum of the number of rows plus the number of columns. In the Executive Furniture problem, this means that the initial solution must have squares used. Thus

Occupied shipping routes (squares) = Number of rows + Number of columns – 1

When the number of occupied routes is less than this, the solution is called degenerate.

Later in this chapter we talk about what to do if the number of used squares is less than the number of rows plus the number of columns minus 1.

### Algorithm:
1. Select an unused square to be evaluated.
2. Beginning at this square, trace a closed path back to the original square via squares that are currently being used and moving with only horizontal and vertical moves.
3. Beginning with a plus sign at the unused square, place alternate minus (-) signs and plus (+) signs on each corner square of the closed path just traced.
4. Calculate an improvement index by adding together the unit cost figures found in each square containing a plus sign and then subtracting the unit costs in each square containing a minus sign.
5. Repeat steps 1 to 4 until an improvement index has been calculated for all unused squares.

If all indices computed are greater than or equal to zero, an optimal solution has been reached. If not, it is possible to improve the current solution and decrease total shipping costs.

To see how the stepping-stone method works, let us apply these steps to the Executive Furniture Corporation data in Table 3.3 to evaluate unused shipping routes. The four currently unassigned routes are Des Moines to Boston, Des Moines to Cleveland, Evansville to Cleveland, and Fort Lauderdale to Albuquerque.

_Steps 1 and 2_: Beginning with the Des Moines–Boston route, we first trace a closed path using only currently occupied squares (see Table 3.4) and then place alternate plus signs and minus signs in the corners of this path. To indicate more clearly the meaning of a closed path, we see that only squares currently used for shipping can be used in turning the corners of the route being traced. Hence the path Des Moines–Boston to Des Moines–Albuquerque to Fort Lauderdale–Albuquerque to Fort Lauderdale–Boston to Des Moines–Boston would not be acceptable since the Fort Lauderdale Albuquerque square is currently empty. It turns out that only one closed route is possible for each square we wish to test.

_Step 3_: How do we decide which squares are given plus signs and which minus signs? The answer is simple. Since we are testing the cost-effectiveness of the Des Moines–Boston shipping route, we pretend we are shipping one desk from Des Moines to Boston. This is one more unit than we were sending between the two cities, so we place a plus sign in the box. But if we ship one more unit than before from Des Moines to Boston, we end up sending 101 desks out of the Des Moines factory.

That factory’s capacity is only 100 units; hence we must ship one fewer desks from Des Moines–Albuquerque—this change is made to avoid violating the factory capacity constraint. To indicate that the Des Moines–Albuquerque shipment has been reduced, we place a minus sign in its box. Continuing along the closed path, we notice that we are no longer meeting the Albuquerque warehouse requirement for 300 units. In fact, if the Des Moines–Albuquerque shipment is reduced to 99 units, the Evansville–Albuquerque load has to be increased by 1 unit, to 201 desks. Therefore, we place a plus sign in that box to indicate the increase.

Finally, we note that if the Evansville–Albuquerque route is assigned 201 desks, the Evansville–Boston route must be reduced by 1 unit, to 99 desks, to maintain the Evansville factory capacity constraint of 300 units. Thus, a minus sign is placed in the Evansville–Boston box. We observe in Table 3.4 that all four routes on the closed path are thereby balanced in terms of demand-and supply limitations.

![[Screenshot 2024-11-20 134234.png|center]]

![[Screenshot 2024-11-20 134357.png|center]]

These steps are repeated on all empty cells. if the result is negative, then the empty cell will become the new supplier.  you then add the needed supplies to the new supplier and and depending on the signs of the other cells, you add or subtract from them the amount added to the new supplier while preserving the row and column total.