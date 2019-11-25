'''
- Hãy định nghĩa class Person với các thuộc tính : họ tên, ngày sinh, địa chỉ, giới tính
và các phương thức khởi tạo, hiển thị thông tin
- Định nghĩa class NhanVien kế thừa từ Person, có thêm các thuộc tính: mã nhân viên,
hệ số lương, đơn vị và các phương thức khởi tạo, hiển thị thông tin .
'''
class Person(object):
    def __init__(self, para_hoten, para_ngaysinh, para_diachi, para_gioitinh):
        self.hoten = para_hoten
        self.ngaysinh = para_ngaysinh
        self.diachi = para_diachi
        self.gioitinh = para_gioitinh
    
    def show_info(self):
        print('Họ Tên: {}'.format(self.hoten))
        print('Ngày sinh: {}'.format(self.ngaysinh))
        print('Địa chỉ: {}'.format(self.diachi))
        print('Giới tính: {}'.format(self.gioitinh))

class NhanVien(Person):
    def __init__(self, para_hoten, para_ngaysinh, para_diachi, para_gioitinh, para_mnv, para_hsl, para_donvi):
        super().__init__(para_hoten, para_ngaysinh, para_diachi, para_gioitinh)
        self.mnv = para_mnv
        self.hsl = para_hsl
        self.donvi = para_donvi

    def show_info(self):
        return super().show_info()
        print('Mã Nhân Viên: {}'.format(self.mnv))
        print('Hệ số lương: {}'.format(self.hsl))
        print('Đơn vị: {}'.format(self.donvi))

person_A = Person()
nhan_vien_A = NhanVien()