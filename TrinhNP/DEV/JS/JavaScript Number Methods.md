The toString() method returns a number as a string.

```
var x = 123;
x.toString();            // returns 123 from variable x
(123).toString();        // returns 123 from literal 123
(100 + 23).toString();   // returns 123 from expression 100 + 23
```


**toExponential()** returns a string, with a number rounded and written using exponential notation.

A parameter defines the number of characters behind the decimal point:
```
Example
var x = 9.656;
x.toExponential(2);     // returns 9.66e+0
x.toExponential(4);     // returns 9.6560e+0
x.toExponential(6);     // returns 9.656000e+0
```
**toFixed()** returns a string, with the number written with a specified number of decimals:
```
Example
var x = 9.656;
x.toFixed(0);           // returns 10
x.toFixed(2);           // returns 9.66
x.toFixed(4);           // returns 9.6560
x.toFixed(6);           // returns 9.656000
```


The **toPrecision()** Method
toPrecision() returns a string, with a number written with a specified length:
```
Example
var x = 9.656;
x.toPrecision();        // returns 9.656
x.toPrecision(2);       // returns 9.7
x.toPrecision(4);       // returns 9.656
x.toPrecision(6);       // returns 9.65600
```

The valueOf() Method
**valueOf** returns a number as a number.
```
Example
var x = 123;
x.valueOf();            // returns 123 from variable x
(123).valueOf();        // returns 123 from literal 123
(100 + 23).valueOf();   // returns 123 from expression 100 + 23
```
Method	Description

|Number()	|Returns a number, converted from its argument.|
|---------|-----------------------------------------------|
|parseFloat()|	Parses its argument and returns a floating point number|
|parseInt()|	Parses its argument and returns an integer|


**Number()** can also convert a date to a number:
```
Example
Number(new Date("2017-09-30"));    // returns 1506729600000
```

The parseInt() Method
**parseInt()** parses a string and returns a whole number. Spaces are allowed. Only the first number is returned:
```
Example
parseInt("10");         // returns 10
parseInt("10.33");      // returns 10
parseInt("10 20 30");   // returns 10
parseInt("10 years");   // returns 10
parseInt("years 10");   // returns NaN 
```
The parseFloat() Method
**parseFloat()** parses a string and returns a number. Spaces are allowed. Only the first number is returned:
```
Example
parseFloat("10");        // returns 10
parseFloat("10.33");     // returns 10.33
parseFloat("10 20 30");  // returns 10
parseFloat("10 years");  // returns 10
parseFloat("years 10");  // returns NaN
```

|MAX_VALUE|	Returns the largest number possible in JavaScript|
|---------|----------------------------------------------------|
|MIN_VALUE|	Returns the smallest number possible in JavaScript|
|POSITIVE_INFINITY|	Represents infinity (returned on overflow)|
|NEGATIVE_INFINITY|	Represents negative infinity (returned on overflow)|
|NaN|	Represents a "Not-a-Number" value|


