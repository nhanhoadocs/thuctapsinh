 # Sử dụng for cho đếm 

 # Ví dụ Sau : 

count = 0 
for itervar in [1, 5, 3, 7, 9, 12]:
 Count = count + itervar
print('total: ',Count)


    # Ví dụ trên có ý nghĩa rằng : bắt đầu đếm từ 0, lấy 0 cộng với ký tự đầu tiên của list sau đó in ra, tiếp tục lấy tổng đó cộng với ký tự tiếp theo rồi in ra. Lặp đi lặp lại như vậy cho đến ký tự cuối cùng của list. 

## Ví dụ 2: 

largest = 7

for itervar in [3, 41, 12, 4, 15, 3]:
    if largest is None or itervar > largest :
         largest = itervar
    print('Loop: ',itervar,"------",largest)
print('Largest: ',largest)


        # Ví dụ trên có ý nghĩa răng cho 7 là số lớn nhất, trước khi vong lặp bắt đầu, giá trị lớn nhất là 7. Khi vòng lặp đang thực thi, nếu lớn nhất là 0 thì ta lấy giá trị đầu tiên mà chùng ta thấy là lớn nhất cho đến hiện tại. 
        # Trong lần lặp đầu tiên, ta thấy itervar < largest nên largest vẫn là 7 và in ra số đầu tiên cùng số lớn nhất
        # Lần lặp thứ 2 ta thấy 41 lại là số lớn hơn tất cả nên ta lấy largest là 41 và in ra số thứ 2 cùng số lớn nhất.
        # Cứ so sánh như vậy cho đến hết list ta tìm được số lớn nhất và in ra nó. 

 