# Cấu trúc câu lệnh 
```
iptables -t (tên bảng) option
```

1. Check list các quy tắc hiện tại 
```
iptables -L
```
```
[root@localhost ~]# iptables -L
Chain INPUT (policy ACCEPT)
target     prot opt source               destination         
ACCEPT     all  --  anywhere             anywhere             stat
```
**NOTE** : các đọc bảng các quy tắc
- target : Hành động sẽ thực thi cho mỗi chuỗi quy tắc.
- port : Tức là các giao thức sẽ được áp dụng để thực thi quy tắc này
- source : Địa chỉ nguồn của lượt truy cập để áp dụng quy tắc
- destination : Địa chỉ của lượt truy cập được phép áp dụng quy tắc.
- ví dụ : `ACCEPT    all    --   lo   any   anywhere   anywhere` có nghĩa là chấp nhận toàn bộ kết nối qua port lo

2. Các option trong lệnh `iptables`
- `-A, --append`  : Chèn rule vào chain
- `-D, --delete` : xóa rule trong chain bằng các chỉ rõ rule hoặc số thứ tự của nó
- `-I, --insert` : Chèn rule vào chain theo số thứ tự dòng 
- `-F, --flush` : Xóa toàn bộ rule ở chain chỉ định 
- `-X, --delete-chain` : Xóa chain chỉ định khỏi table
- `-N, --new-chain` : Tạo ra một chain mới 
- `-E, --rename-chain` : Thay đổi tên table
- `-v, --verbose` : Đưa ra output chi tiết hơn của các loại option 
- `-n, --numeric` : hiển thị IP, port, sẽ được hiển thị dưới dạng số 
- `--line-numbers` : Cho ra output với số thứ tự dòng
- `-p, --protocol` : chỉ ra giao thức thực hiện cùng dòng lệnh
- `-s, --src, --source` : Chỉ ra địa chỉ nguồn thực hiện cùng lệnh  
- `-d, --dst, --destination`: chỉ ra địa chỉ đích để thực hiện cùng lệnh
- `-j` : chỉ ra target