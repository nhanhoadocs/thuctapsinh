'''
Hãy định nghĩa class CauThu gồm các thuộc tính id, tên cầu thủ, năm sinh, vị trí
(nhận một trong các giá trị: thủ môn, hậu vệ, tiền vệ, tiền đạo) và các phương thức
khởi tạo, các getters/setters
'''
class CauThu(object):

    def __init__(self, para_id, para_ten, para_namsinh, para_vitri):
        self.id = para_id
        self.ten = para_ten
        self.namsinh = para_namsinh
        if para_vitri in ["thủ môn", "hậu vệ", "tiền vệ", "tiền đạo"]:
            self.vitri = para_vitri
        else:
            print("Không tồn tại vị trí vừa nhập")


cau_thu_A = CauThu("19", "Quang Hai", "1997", "tiền đạo")
