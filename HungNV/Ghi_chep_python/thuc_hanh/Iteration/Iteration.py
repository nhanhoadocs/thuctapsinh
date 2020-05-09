# Iteration 

#___________________Câu lênh while___________________#

    # Khi n>0, hiển thị giá trị của n và giảm giá trị của n xuống 1. 

n = 5
while n > 0:
#    print(n)
    n = n-1


    # Ta có thể sử dụng break để dừng vòng lặp kể cả khi điều kiện while là đúng
n = 5
while n > 0:
#    print(n)
    if (n == 2):
     break
    n = n-1

    # Sử dụng continue để dừng vòng lặp hiện tại và tiếp tục vòng lặp mới. 
n = 5
while n > 0:
    n = n - 1
    if (n == 2):
     continue
#   print(n)

    # Sử dụng else khi điều kiện không còn đúng nữa 

i = 2 
while i < 8: 
    print(i)
    i = i + 1
else:
   print("i >=8 mất rồi :((")