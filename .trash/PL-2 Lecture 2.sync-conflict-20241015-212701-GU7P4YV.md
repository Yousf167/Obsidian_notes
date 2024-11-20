#pl2 
# Functions
```java
[modifiers] returnType name(parameters)
{
	//body
}
```
Modifiers:
- `public`: The method is accessible from any other class.
- `private`: The method is only accessible within its own class.
- `protected`: The method is accessible within its own class and subclasses.
- `static`: The method belongs to the class, rather than instances of the class.
- `final`: The method cannot be overridden by subclasses.
![[Screenshot 2024-10-15 133812.png]]
![[Screenshot 2024-10-15 133837.png]]
A return statement is required for a value-returning method. The method shown
below is logically correct, but it has a compilation error because the Java
compiler thinks it possible that this method does not return any value.
```java 
public static int sign(int n) {
	if (n > 0)
		return 1;
	else if (n == 0)
		return 0;
	else if (n < 0)
		return –1;
}
```
To fix this problem, delete if (n < 0) in (a), so that the compiler will see a return
statement to be reached regardless of how the if statement is evaluated.
```java
public static int sign(int n) {
	if (n > 0)
		return 1;
	else if (n == 0)
		return 0;
	else 
		return –1;
}
```
# Arrays
```java
dataType[] name = new dataType[Size];
//default val = 0
```
* index like any other language

* Arrays have an instance variable `length`, which gives the capacity of the array. The expression: `array.length` represents the number of locations in the array.
* Note that __length__ is an instance variable associated with arrays, while __length()__ is a method associated with strings.
# Default Values
## 1. Primitive Data Types
- `byte`: `0`
- `short`: `0`
- `int`: `0`
- `long`: `0L`
- `float`: `0.0f`
- `double`: `0.0d`
- `char`: `'\u0000'` (the null character)
- `boolean`: `false`

## 2. Reference Types
- **Objects (e.g., String, Arrays, or any user-defined class)**: `null`
## 3. Types with defined sizes
* the elements within the object will be set to their default value
	* `arr[5] = {0, 0, 0, 0, 0}`
# For-each vs Trad. For

| **Aspect**                        | **For-Each Loop**                                                                | **Traditional For Loop**                                                                        |
| --------------------------------- | -------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- |
| **Syntax**                        | `for (Type item : collection/array)`                                             | `for (int i = 0; i < collection/array.length; i++)`                                             |
| **Use Case**                      | Best for iterating through collections or arrays when you don't need the index   | Best when you need the index or want to modify elements                                         |
| **Element Modification**          | Cannot modify the elements of an array or list directly                          | Can modify elements by directly accessing them via index                                        |
| **Index Access**                  | No direct access to the index of the elements                                    | Full control over the index with access to element position                                     |
| **Iterating Over**                | Works with arrays and collections that implement `Iterable` (like `List`, `Set`) | Works with arrays and any type of collection                                                    |
| **Readability**                   | Cleaner and simpler for iteration                                                | More verbose and flexible                                                                       |
| **Array Out-of-Bounds Handling**  | Automatically prevents out-of-bounds errors                                      | Must handle array size manually to prevent errors                                               |
| **Performance**                   | Slightly faster for simple iteration (no index calculation)                      | Might be less efficient when index calculation is needed                                        |
| **Control of Loop Counter**       | No loop counter, you can’t control iteration (like skipping or reversing)        | Full control over loop counter (you can skip, reverse, etc.)                                    |
| **Suitability for Complex Logic** | Less suitable for complex logic (like breaking out early based on index)         | Best for complex iteration logic, including skipping, reversing, and early exits based on index |
| **Applicable to Primitive Types** | Works for primitive arrays                                                       | Works for both primitive and object arrays                                                      |
| **Null Safety**                   | May throw `NullPointerException` if array or collection is null                  | You can manually handle `null` before entering the loop                                         |
### Example of For-Each Loop:
```java
int[] arr = {1, 2, 3, 4, 5};
for (int num : arr) {
    System.out.println(num);  // Simply prints elements
}
```
### Example of Traditional For Loop:
```java
int[] arr = {1, 2, 3, 4, 5};
for (int i = 0; i < arr.length; i++) {
    arr[i] = arr[i] * 2;  // Modifies each element
    System.out.println(arr[i]);
}
```
### Conclusion:
- **For-Each** is best for simple iterations where you don’t need the index or to modify elements.
- **Traditional For Loop** offers more control and flexibility, especially when you need to manipulate elements or manage the index.
# Function Passing
• Java uses _pass by value$^*$_ to pass arguments to a method. There are important differences between passing a value of variables of primitive data types and passing arrays.
• For a parameter of a primitive type value, the actual value is passed. Changing the value of the local parameter inside the method does not affect the value of the variable outside the method.
• _For a parameter of an array type, the value of the parameter contains a reference to an array; this reference is passed to the method. Any changes to the array that occur inside the method body will affect the original array that was passed as the argument.

$$\small ^* pass\ by\ value\ means\ that\ when\ you\ pass\ an\ argument\ to\ a\ method,\ the\ method\ receives\ a\ copy\ of\ the\ value,$$$$\small not\ the\ original\ reference\ or\ object\ itself.\ This\ holds\ true\ for\ both\ primitive\ data\ types\ and\ object\ references,$$$$\small \ but\ it\ behaves\ differently\ depending\ on\ the\ type\ of\ data.$$
