<a name="QUản lý phầm mềm và dịch vụ">


# QUản lý phầm mềm và dịch vụ


## NỘI DUNG
1. Nguyên tắc quản lý phần mềm
2. Công cụ quản lý phần mèm
3. Dịch vụ mã nguồn
4. Quản ly gói cài đặt
5. Quản lý phần mềm
6. Quản lý dịch vụ đơn lẻ
7. Quản lý dịch vụ bằng tcpd
-----------------------------

1. Nguyên tắc quản lý phần mềm
- Các thành phần của 1 phần mềm
    - File thực hiện
    - Các thư viện phần mềm
    - Các file cấu hinh
    - Dữ liệu thạm thời
- Các thao tác quản lý phân mềm
    - Cài đặt phần mềm
    - Gỡ bỏ phần mềm
    - Cấu hình lại phần mêmf
    - Lấy thông tin từ phần mềm
- Cách thức phản lý
    - Độc lập
    - Script cho từng phần mềm
    - Quản lý bằng CSDL
    - Cộng cụ quản lý chung

2. Cài đặt phần mềm từ mã nguồn
- Tải mã nguồn 
- Dịch mã nguồn 
    - Cài đặt thêm các gói nếu cần thiết 
- Cài đặt phần mềm 
    - Kịch bản cài đặt 
- Cấu hình phần mềm 
    - Kịch bản cấu hình 
- Gỡ bỏ phần mềm 
    - Kịch bản gỡ bỏ 
- Kịch bản chung cho các thao tác 
- Makefile, Automake, make, các công cụ phát triển

3. Cài đặt phần mềm từ mã cài đặt
- Chương trình cài đặt/gỡ bỏ/cấu hình 
- Xung đột với các phần mềm khác 
- Công cụ quản lý phần mềm chung 
    - Phần mềm được đóng gói 
    - CSDL về các gói phần mềm 
    - Phát hiện các xung đột phần mềm (thừa, thiếu, khác phiên bản) 
    - Phức tạp khi cài đặt

4. Các công cụ quản lý phần mềm bậc cao 
-  Quản lý các gói phần mềm+ CSDL gói phần mềm 
-  Quản lý danh mục các kho phần mềm 
-  Cài đặt/gỡ bỏ các phần mềm tự động 
-  Có thể có giao diện đồ họa/tương tác 
- Đơn giản 
- Có khả năng cài thừa các phần mềm

## Hệ thống quản lý phần mềm

|      |Redhat |Debian|
|---|---|

|Quản lý gói phần mềm|rpm|dpkg|
|Quản lý các gói phần mềm|yum,urpm*|apt-*|
|Giao diên tương tác |dselect,taskshell|aptitude|
|Giao diện đồ họa|krpm,yumex|synaptic|