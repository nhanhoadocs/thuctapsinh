'''
Thiết lập lớp PhanSo để biểu diễn khái niệm phân số với hai thành phần dữ liệu tử số, 
mẫu số và các hàm thành phần cộng, trừ, nhân, chia hai phân số, các hàm thành phần xuất, 
nhập, định giá trị cho phân số. Viết chương trình cho phép nhập vào hai phân số, in ra 
kết quả các phép toán cộng, trừ, nhân, chia hai phân số kể trên.
'''

class PhanSo(object):
    
    def __init__(self, para_tu, para_mau):
        self.tu = para_tu
        self.mau = para_mau

    def cong(self, x):
        tu_kq = self.tu * x.mau + x.tu * self.mau
        mau_kq = self.mau * x.mau
        return 'Tổng : ' + str(tu_kq) + '/' + str(mau_kq)

    def tru(self, x):
        tu_kq = self.tu * x.mau - x.tu * self.mau
        mau_kq = self.mau * x.mau
        return 'Hiệu : ' + str(tu_kq) + '/' + str(mau_kq)

    def nhan(self, x):
        tu_kq = self.tu * x.tu
        mau_kq = self.mau * x.mau
        return 'Tích : ' + str(tu_kq) + '/' + str(mau_kq)

    def chia(self, x):
        tu_kq = self.tu * x.mau
        mau_kq = self.mau * x.tu
        return 'Thương : ' + str(tu_kq) + '/' + str(mau_kq)

a = input("Nhập vào phân số a : ")
b = input("Nhập vào phân số b : ")

a_tu = int((a.split('/'))[0])
a_mau = int((a.split('/'))[1])
b_tu = int((b.split('/'))[0])
b_mau = int((b.split('/'))[1])

phan_so_a = PhanSo(a_tu, a_mau)
phan_so_b = PhanSo(b_tu, b_mau)

print(phan_so_a.cong(phan_so_b))
print(phan_so_a.tru(phan_so_b))
print(phan_so_a.nhan(phan_so_b))
print(phan_so_a.chia(phan_so_b))
