# Nhập vào tên, năm sinh và in ra theo output
# output: Xin chào [name], năm nay bạn [age] tuổi

    # Phân tích : 
        # tuổi = năm hiện tại - năm sinh
        # Để xác định năm  hiện tại, ta có thể search gg với cú pháp : python  get curren year

from datetime import datetime
currenyear = datetime.now().year
name = input("Nhập vào tên: ")
day = int(input("Nhập vào năm sinh: "))

    # Sử dụng format để gắn lại với nhau: 

ketqua = "Xin chào {name}, năm nay bạn {age} tuổi !!".format(name=name, age = currenyear - day)

print(ketqua)