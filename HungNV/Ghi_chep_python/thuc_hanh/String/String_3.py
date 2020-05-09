# String 3 
# nối chuỗi sử dụng %s và % 

str1 = "Nguyen Viet %s !!"  %('Hung')

# Nếu sử dụng dấu phẩy ',' thì nó sẽ nhận lần lượt các giá trị 

str2 = "Que Quan %s !! tuoi %s"  %('ThaiBinh', '20')

# Hoặc cũng có thể sử dụng như ví dụ sau đây: 

str3 = "Tên : %s - Họ : %s "

nhapTB = str3 %('Hùng', 'Nguyễn')
NhapHB = str3 %('Hùng', 'Phạm')

print(str1)
print(str2)
print(nhapTB)
print(NhapHB)

# Sử dụng phương thức format

result1 = "Item one: {}".format("a")
result2 = "Item one: {} Item two: {}".format("a","b")
result3 = "Item one: {x} Item two: {y}".format(x="A", y="b")
result4 = "Item one: {y} Item two: {x}".format(x="A", y="B") 

print(result1)
print(result2)
print(result3)
print(result4)

# Trường hợp 2 của format là nếu sử dụng f ở trước thì phải đặt biến trước rồi đến hàm

x="1"
y="2"
#-- Nếu đặt biến x và y ở sau nó sẽ k hiểu dẫn đến bị lỗi. Nếu bỏ f thì nó cũng k hiểu là phải nhận giá trị x và y dẫn đến nó sẽ in ra là result5.

result5 = f"Item one: {x} Item two: {y}"

print(result5)

#--------------------- Sử dụng format để căn chỉnh lề ------------------------

align = "I learn Python" 

# ví dụ muốn lùi vào phía trung tâm 20px

strformat = align.center(20)
print(strformat)

# Ví dụ muốn sử dụng - để căn giữa gồn 40 ký tự 

strformat1 = align.center(40,"-")
print(strformat1)
    # Kiểm tra chiều dài chuỗi
print(len(strformat1))

# Sử dụng left và right để thêm ký tự vào trước hoặc sau chuỗi. 
    # Ví dụ sử dụng left viết tắt là l
strformat2 = align.ljust(12,"-")
print(strformat2)

    # Ví dụ sử dụng right viết tắt là r 
strformat3 = align.rjust(4,"-")
print(strformat3)