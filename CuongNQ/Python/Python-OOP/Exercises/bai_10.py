'''
Xây dựng một chương trình quản lý danh sách các sinh viên của một lớp .
Mỗi sinh viên sẽ gồm các thông tin : mã số sinh viên (MSSV), họ tên, ngày sinh,
giới tính, tên, lớp, khóa . Chương trình sẽ thực hiện các chức năng cụ thể sau :
- Add(student, p) : Bổ sung thêm một sinh viên student vào một vị trí p bất kỳ
trong danh sách (phần tử đầu tiên có vị trí là 1, và với p=0 tức là bổ sung vào 
cuối danh sách . Không cho phép 2 sinh viên có cùng MSSV trong danh sách .
- Remove(mssv) : loại bỏ 1 sinh viên với MSSV mssv cho trước
- Remove(p) : loại bỏ sinh viên ở vị trí p bất kỳ trong danh sách (phần tử
đầu tiên có vị trí là 1)
- Seacrh(s) : tìm 1 sinh viên theo MSSV hoặc theo tên (với 1 thông tin s vào thì trước 
tiên sẽ tìm sinh viên có MSSV = s, nếu không tìm thấy thì tìm sinh viên có họ tên = s)
- Print() : in rra nội dung danh sách sinh viên .
- Save(filename) : lưu nội dung của danh sách sinh viên ra một tệp tên là filename .
- Load(filename) : load nội dung danh sách từ 1 tệp có tên filename .
- Sort(type) : sắp xếp danh sách theo MSSV (nếu type=ID) hoặc theo họ tên(nếu type=ID) .
'''

