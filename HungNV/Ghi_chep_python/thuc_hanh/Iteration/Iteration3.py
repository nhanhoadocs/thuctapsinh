# Iteration 3
   
    # Khi nhập vào các giá trị đúng sẽ in ra. Vòng lawo này sẽ lặp vô hạn hoặc khi nhập vào giá trị # là giá trị đầu tiên, nó sẽ bỏ qua lần lặp hiện tại và chuyển đến lần lặp tiếp cho đến khi nhập done. 
    

while True:
    line = input(">>")
    if (line[0] =='#'):
       continue 
    if (line == "done"):
        break
    print(line)
print("Done!!")