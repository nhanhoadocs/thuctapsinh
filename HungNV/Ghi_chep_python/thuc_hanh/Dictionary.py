# Dictionary 

## Một từ điển giống như 1 danh sách tổng quát 
## Trong 1 danh sách, các vị trí (chỉ số) phải là số nguyên 
## Có thể nghĩ về 1 từ điển như 1 ánh xạ giữa tập hợp các chỉ mục (Được gọi là keys) và tập hợp ác giá trị 
## Mỗi keys ánh xạ tới 1 giá trị. Sự kết hợp của khóa và giá trị gọi là cặp khóa-giá trị hoặc đôi khi là 1 mục 

# Ví dụ: tạo 1 từ điển và in nó ra 
    # Từ điển có các khóa là Ten, Tuoi, Nam

thisdict = {
    "Ten" : "Hung",
    "Tuoi" : 21,
    "Nam" : 1999
}
print(thisdict)

# Ví dụ để truy cập 1 mục trong từ điển : 
    # Ta nhập vào khóa sau đó in nó ra 
z =thisdict["Ten"]
print(z)

    # Ngoài ra có thể sử dụng phương pháp khác cũng cho kết quả tương tự đó là get()
x = thisdict.get("Ten")
print(x)

# Ví dụ thay đổi giá trị trong từ điển

    # Thay đổi tên thành Viet
thisdict1 = {
    "Ten" : "Hung",
    "Tuoi" : 21,
    "Nam" : 1999
}
thisdict1["Ten"] = "Viet" 
print(thisdict1)

# Ví dụ thêm 1 mục vào từ điển 

thisdict1["Que"] = "Thai Binh" 
print(thisdict1)

# Kiểm tra số cặp khóa và giá trị trong từ điển

print(len(thisdict1))

# Kiểm tra xem có phải khóa hay không? Sử dụng in

check = input("Nhap vao gia tri: ")
if check in thisdict1:
    print("Day la khoa trong tu dien")
else :
    print("day khong phai la khoa trong tu dien")

# Từ điển và file 
    # Sử dụng từ điển để đếm tất cả các từ với số lần xuất hiện traong file

fname = input('Enter the file name: ')
try:
    fhand = open(fname)
except:
    print('File cannot be opened:', fname)
    exit()

counts = dict()
for line in fhand:
    words = line.split()
    for word in words:
        if word not in counts:
            counts[word] = 1
        else:
            counts[word] += 1
print(counts)
