JS có rất nhiều kiểu dữ liệu : numbers, strings, objects, ...
Ví duj: 
```
var length = 16;                               // Number
var lastName = "Johnson";                      // String
var x = {firstName:"John", lastName:"Doe"};    // Object
```

Có một chút quan trọng cần lưu ý:

```
var x = 16 + 4 + "Volvo";
Result:

20Volvo
```

Nhưng :
```
var x = "Volvo" + 16 + 4;
Result:

Volvo164
```

JS sử dụng kiểu dữ liệu động :
```
var x;           // Now x is undefined
x = 5;           // Now x is a Number
x = "John";      // Now x is a String
```
Sử dụng nháy đơn hay nháy kép cho chuỗi là như nhau:
```
var carName1 = "Volvo XC60";   // Using double quotes
var carName2 = 'Volvo XC60';   // Using single quotes
```

JS Numbers :
Js chỉ có một kiểu của số :
```
var x1 = 34.00;     // Written with decimals
var x2 = 34;        // Written without decimals
```

JS Booleans :
Có thể trả về giá trị `true` hoặc `false` .

```
var x = 5;
var y = 5;
var z = 6;
(x == y)       // Returns true
(x == z)       // Returns false
```

JS Arrays 
Ví dụ về khai báo một mảng:
```
var cars = ["Saab", "Volvo", "BMW"];
```


JS Objects
Ví dụ :
```
var person = {firstName:"John", lastName:"Doe", age:50, eyeColor:"blue"};
```

Difference Between Undefined and Null
```
typeof undefined           // undefined
typeof null                // object

null === undefined         // false
null == undefined          // true
```









































