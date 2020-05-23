## JavaScript Strings

Một JS strings là không hoặc có nhiều ký tự được viết ở bên trong cặp dấu nháy.
Ví dụ :
`var x = "John Doe";`

```
var carName1 = "Volvo XC60";  // Double quotes
var carName2 = 'Volvo XC60';  // Single quotes
```

Để biết độ dài của Strings , ta dùng thuộc tính `length` 

```
var txt = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
var sln = txt.length;

console.log(sln)
26

``` 
## Escape Character
`var x = "We are the so-called "Vikings" from the north.";`
như dòng bên trên thì chuỗi Vikings sẽ không được đưa vào biến x
Ta dùng **backslash escape character.**

|Code|Result|Description|
|----|------|-----------|
|\\'|'|Single quote|
|\\"|"|Double quote|
| \\\ | \ | Backslash |

Ví duj:
`var x = "We are the so-called \"Vikings\" from the north.";`

Six other escape sequences are valid in JavaScript:

|Code|Result|
|----|------|
|\b|	Backspace|
|\f|	Form Feed|
|\n|	New Line|
|\r|	Carriage Return|
|\t|	Horizontal Tabulator|
|\v|	Vertical Tabulator|

## Strings Can be Objects
`var firstName = new String("John");`

```
var x = "John";
var y = new String("John");

// typeof x will return string
// typeof y will return object
```

```
var x = "John";             
var y = new String("John");

// (x == y) is true because x and y have equal values
```

```
var x = "John";             
var y = new String("John");

// (x === y) is false because x and y have different types (string and object)
```

```
var x = new String("John");             
var y = new String("John");

// (x == y) is false because x and y are different objects
```

**Note the difference between (x==y) and (x===y).
Comparing two JavaScript objects will always return false.**






















