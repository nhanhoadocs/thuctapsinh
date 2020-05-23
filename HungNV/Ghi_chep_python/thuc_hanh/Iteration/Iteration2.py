# Iteration 2 

    # Hàm dưới có ý nghĩa: khi ta nhập vào các giá trị, nó sẽ in ra. hành động đó lặp đi lặp lại vô hạn cho đến khi ta nhập vào giá trị là done. 

#while True:
#    line = input('>>')
#    if (line == 'done'):
#        break
#   print(line)
#print("Done!")

    # Bỏ qua lần lặp hiện tại và nhảy tới lần lặp tiếp theo 

while True:
    line = input(">>")
    if (line[0] =='#'):  # Nếu ký tự đầu tiên là #, bỏ qua vòng lặp hiện tại và nhảy tới lần lặp tiếp
       continue 
    if (line == "done"):
        break
    print(line)
print("Done!!")
