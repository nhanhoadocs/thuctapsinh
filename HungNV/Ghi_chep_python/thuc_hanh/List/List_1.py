# List  
    # List bắt đầu bằng [ và kết thúc bằng ]
myList = ["a", "b", "c"]
print(myList)

myList1 = [1, 2, 3]
print(myList1)

    # list chứa kiểu số, chuỗi và list khác

myList2 = [1, 2, 3, "a", "b", "c", ["d", 3]]
print(myList2)
 # Sau khi in ra list bao gồm 7 phần tử, cả cái list bên trong là 1 phần tử.

print(len(myList2))

# Kiểm tra sự tồn tại trong list
myList3 = ["a", "b", "c"]

    # Nếu tồn tại sẽ trả về true và ngược lại trả về false
print("a" in myList3)
print("A" in myList3)
print("aA" not in myList3)

# Index 
myList4 = ["a", "b", "c", 1, 2, 3, ["d", 2]]

    # nếu là 0 => phần tử đầu là a
print(myList4[0])     

    # Nếu là -1 thì sẽ lấy phần tử cuối cùng 
print(myList4[-1])

    # Nếu muốn in ra phần tử thứ 2 (là 1) của phần tử 6 
print(myList4[6][1])

# Trích xuất

    # In ra các phần tử từ phần tử thứ 2 (Phần tử thứ 2 là bằng 3) đến phần tử cuối cùng
myList5 = [1, 2, 3, 4, 5, 6]

print(myList5[2:])

    # In ra các phần tử từ phần tử thứ 0 đến phần tử thứ 4 (chỉ lấy đến phần tử thứ 3, k lấy phần tử thứ 4)

print(myList5[:4]) 

# Cập nhật phần tử 

myList6 = [1, 2, 3, 4]

    # Thay phần tử 0 bằng a 
myList6[0] = "a" 
print(myList6)

# Xóa phần tử 

    # ví dụ muốn xóa phần tử thứ 3 
del myList6[3]
print(myList6)


# Append -cập nhật 

    # ví dụ gắn p-5 vào cuối list 

myList7 = [1, 2, 3, 4]
myList7.append("p-5")
print(myList7)

    # Ví dụ gắn 1 list ([5,6]) vào 1 list khác
myList8 = [1, 2, 3, 4]
myList8.append([5,6])
print(myList8)

# Extent

    # Nếu sử dụng extend nó sẽ lấy từng phần tử gắn vào list. 
myList9 = [1, 2, 3, 4]
myList9.extend(["x", "y"])
print(myList9)



# Phương thức pop

    # Phương thức pop sẽ lấy đi 1 phần tử trong list, nếu truyền vào thông số nó sẽ thấy phần tử ở vị trí đó, nếu không truyền vào thông số nó sẽ lấy đi phần tử cuối cùng. 
    # Ví dụ sau lấy đi phần tử thứ 2 và in ra phần tử thứ 2 và in ra list sau khi chỉnh sửa

myList10 = [1, 2, 3, 4]
item = myList10.pop(2)
print(item)
print(myList10)

    # Ví dụ sai k truyền vào số nó sẽ lấy đi phần tử cuối cùng và in ra phần còn lại. 
myList11 = [1, 2, 3, 4]
item1 = myList10.pop()
print(item1)
print(myList11)
