'''
- Xây dựng lớp Candidate (Thí sinh) gồm các thuộc tính: mã, tên, ngày tháng năm sinh, 
điểm thi Toán, Văn, Anh và các phương thức cần thiết.
- Xây dựng lớp TestCandidate để kiểm tra lớp trên:
    + Nhập vào n thí sinh (n do người dùng nhập)
    + In ra thông tin về các thí sinh có tổng điểm lớn hơn 15
'''
class Candidate(object):

    def __init__(self, para_ma, para_ten, para_ngaysinh, para_dtoan, para_dvan, para_danh):
        self.ma = para_ma
        self.ten = para_ten
        self.ngaysinh = para_ngaysinh
        self.dtoan = para_dtoan
        self.dvan = para_dvan
        self.danh = para_danh

class TestCandidate(object):
    
    def
