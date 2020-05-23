## JavaScript String Methods

Phương thức và Thuộc tính 

### String Length

```
var txt = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
var sln = txt.length;

console.log(sln)
26
```
### indexOf() and lastIndexOf()

In ra vị trí chỉ mục của chuỗi nhập vào trong chuỗi cho trước 

```
var str = "Please locate where 'locate' occurs!";
var pos = str.indexOf("locate");
output: 7
```
```
var str = "Please locate where 'locate' occurs!";
var pos = str.lastIndexOf("locate");
output: 21
```
### search()
Tìm vị trí chuỗi đầu tiên trong chuỗi cho trước 
```
var str = "Please locate where 'locate' occurs!";
var pos = str.search("locate");
output: 7
```

### Extracting String Parts

There are 3 methods for extracting a part of a string:

- slice(start, end)
- substring(start, end)
- substr(start, length)

Ví dụ:

```
var str = "Apple, Banana, Kiwi";
var res = str.slice(7, 13);
output: Banana
```
```
var str = "Apple, Banana, Kiwi";
var res = str.slice(-12, -6);
output: banana
```
```
var res = str.slice(7);
```
hoặc 
```
var res = str.slice(-12);
``` 

### substring() is similar to slice(). and substr() is similar to slice().

```
var str = "Apple, Banana, Kiwi";
var res = str.substring(7, 13);
output: Banana
```
```
var str = "Apple, Banana, Kiwi";
var res = str.substr(7, 6);
output: Banana
```

```
var str = "Apple, Banana, Kiwi";
var res = str.substr(7);
output: Banana, Kiwi
```


```
var str = "Apple, Banana, Kiwi";
var res = str.substr(-4);
The result of res will be:
Kiwi
```

### replace() 

Thay đổi giá trị chuỗi trong chuỗi cho trước 

```
str = "Please visit Microsoft!";
var n = str.replace("Microsoft", "W3Schools");
op: Please visit W3Schools!
```
Mặc định thì replace() sẽ xử lý chuỗi đầu tiên tìm thấy.
Hàm replace() có phân biệt hoa thường.

**To replace all matches, use a regular expression with a /g flag (global match):**


```
str = "Please visit Microsoft and Microsoft!";
var n = str.replace(/Microsoft/g, "W3Schools");
```

## toUpperCase()  and toLowerCase()

Biến đổi string để thành chuỗi chữ hoa hết
```
var text1 = "Hello World!";       // String
var text2 = text1.toUpperCase();  // text2 is text1 converted to upper
op: HELLO WORLD!
```

```
var text1 = "Hello World!";       // String
var text2 = text1.toLowerCase();  // text2 is text1 converted to lower
op: hello world!
```
## concat()
Nhập 2 chuỗi thành một.

```
var text1 = "Hello";
var text2 = "World";
var text3 = text1.concat(" ", text2);
```

```
var text = "Hello" + " " + "World!";
var text = "Hello".concat(" ", "World!");
```

## trim()
The trim() method removes whitespace from **both side** of a string:

```
var str = "       Hello World!        ";
alert(str.trim());
op: Hello World!
```
## charAt() và charCodeAt() 
Trả về ký tự được chọn

```
var str = "HELLO WORLD";
str.charAt(0);            // returns H
```
Trả về UTF-16 code của ký tự được chọn 
```
var str = "HELLO WORLD";

str.charCodeAt(0);         // returns 72
```

## split() 
A string can be converted to an array with the split() method:
```
var txt = "a,b,c,d,e";   // String
txt.split(",");          // Split on commas
txt.split(" ");          // Split on spaces
txt.split("|");          // Split on pipe
```

```
var txt = "Hello";       // String
txt.split("");           // Split in characters
```

