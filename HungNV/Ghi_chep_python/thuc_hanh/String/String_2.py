# String 2 

# Trích xuất chuỗi : lấy các thành phần mong muốn trong 1 chuỗi 
print("Trích xuất chuỗi")
# Dấu : có nghĩa là [form:to] 

mystr = "hello python" 

result = mystr[2:4] 

print(result)

# Tách chuỗi 

mystr1= "hung:21:ThaiBinh"
mystr2= "NguyEn Viet hUng"

result1 = mystr1.split(":")
print(result1)

# Chuyển toàn bộ chuỗi thành chữ hoa
result2 = mystr2.upper()

# Chuyển toàn bộ chuỗi bằng chữ thường
result3 = mystr2.lower()

# Những chữ thường chuyển thành chữ hoa và chữ hoa sẽ chuyển thành chữ thường
result4 = mystr2.swapcase()

# Ký tự đầu tiên sẽ chuyển thành chữ hoa và tất cả các ký tự sau sẽ chuyển sang chữ thường
result5 = mystr2.title()

# Thay 1 ký tự thành ký tự mới. ví dụ "Viet" sẽ thay bằng Duc
result6 = mystr2.replace("Viet", "Duc")

print(result2)
print(result3)
print(result4)
print(result5)
print(result6)