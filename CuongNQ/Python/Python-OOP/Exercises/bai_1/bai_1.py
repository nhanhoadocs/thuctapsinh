'''
- Hãy định nghĩa class SinhVien với các thuộc tính : Họ tên , mã sinh viên , điểm học phần, điểm quá trình
và các phương thức khởi tạo, tính điểm trung bình, hiển thị thông tin
Trong đó : điểm trung bình = điểm quá trình*0.3 + điểm học phần*0.7
- Định nghĩa class LopHoc với các thuộc tính danh sách sinh viên, sĩ số lớp, tên lớp
và phương thức khởi tạo
'''
import json
import os
import subprocess
from decimal import *
getcontext().prec = 3

path_to_data = '/home/cuongnq/code/bai_tap_oop/bai_1/data'

class SinhVien(object):

    def __init__(self, para_hoten, para_msv, para_dqt, para_dhp):
        self.hoten = para_hoten
        self.msv = para_msv
        self.dqt = para_dqt
        self.dhp = para_dhp

    def tinh_diem_trung_binh(self):
        self.dtb = Decimal(self.dqt) * Decimal(0.3) + Decimal(self.dhp) * Decimal(0.7)
        return self.dtb

class LopHoc(object):

    def __init__(self, ten_lop):
        self.ten_lop = ten_lop
        self.list_sv = []

    def append_sv(self, SinhVien):
        self.list_sv.append(SinhVien)

    def siso(self):
        return len(self.list_sv)

    def show_danh_sach_lop(self):
        for x in self.list_sv:
            print('Tên : '+ x.hoten + ' ; MSV : ' + x.msv)

    def search(self, para):
        for x in self.list_sv:
            if (x.msv == para) or (x.hoten == para):
                print('Tên : '+ x.hoten + ' ; MSV : ' + x.msv)
                pass
        else:
            return("No match!")

    def remove(self, para):
        for x in self.list_sv:
            if (x.msv == para) or (x.hoten == para):
                self.list_sv.remove(x)

    def export_to_file(self, para):
        file_op = open(para, 'w')
        for x in self.list_sv:
            file_op.write(x.hoten + ',' + x.msv + ',' + x.dqt + ',' + x.dhp + ',' + '\n') 
        file_op.close()

    def load_from_file(self,para):
        filename = para
        file_op = open(filename, 'r')
        count = subprocess.getoutput("cat %s | wc -l" %filename)
        i = 1
        while i <= int(count):
            x = file_op.readline()
            sinhvien_data = x.split(',')
            sinhvien_new = SinhVien(sinhvien_data[0], sinhvien_data[1], sinhvien_data[2], sinhvien_data[3])
            self.list_sv.append(sinhvien_new)
            i+=1

def show_page_layer_1():
    print('************************************************')
    print('**********CHƯƠNG TRÌNH QUẢN LÝ LỚP HỌC**********')
    print('************************************************')

def show_page_layer_2():
    os.system('clear')
    print('************************************************')
    print('**********CHƯƠNG TRÌNH QUẢN LÝ LỚP HỌC**********')
    print('************************************************')
    print('***    1. Nhập thêm sinh viên                ***')
    print('***    2. Hiển thị danh sách lớp             ***')
    print('***    3. Hiển thị sĩ số lớp                 ***')
    print('***    4. Tìm kiếm                           ***')
    print('***    5. Xóa sinh viên trong lớp            ***')
    print('***    6. Xuất danh sách lớp ra file         ***')
    print('***    q. Thoát                              ***')
    print('************************************************')
    print('*********************ver1.0*********************')
    print('************************************************')    
    global answer
    answer = input('press Number, then Press Enter: ')

def main():

    def input_1():
        if answer == '1':
            os.system('clear')
            sinhvien_new = SinhVien(input("Họ tên: "), input("Mã sinh viên: "), input("Điểm quá trình: "), input("Điểm học phần: "))
            lop_hoc_A.append_sv(sinhvien_new)        
            while input("Thêm sinh viên khác? (Y/n)") in ['Y', 'y']:
                os.system('clear')
                sinhvien_new = SinhVien(input("Họ tên: "), input("Mã sinh viên: "), input("Điểm quá trình: "), input("Điểm học phần: "))
                lop_hoc_A.append_sv(sinhvien_new)      
            else:
                show_page_layer_2()
        else:
            pass

    def input_2():
        if answer == '2':
            os.system('clear')
            lop_hoc_A.show_danh_sach_lop()
            if input("type 'q' to quit: ") == 'q':
                show_page_layer_2()
        else:
            pass

    def input_3():
        if answer == '3':
            os.system('clear')
            print('Sĩ số lớp {} là {}'.format(lop_hoc_A.ten_lop, lop_hoc_A.siso()))
            if input("type 'q' to quit: ") == 'q':
                show_page_layer_2()
        else:
            pass

    def input_4():
        if answer == '4':
            os.system('clear')
            para = input('Type here to search: ')
            lop_hoc_A.search(para)
            while input('search more? (Y/n)') in ['Y', 'y']:
                os.system('clear')
                para = input('Type here to search: ')
                lop_hoc_A.search(para)
            else:
                show_page_layer_2()
        else:
            pass

    def input_5():
        if answer == '5':
            os.system('clear')
            para = input('Nhập tên sinh viên hoặc MSV muốn xóa :')
            lop_hoc_A.remove(para)
            while input('xóa thêm sinh viên khác? (Y/n)') in ['Y', 'y']:
                para = input('Nhập tên sinh viên hoặc MSV muốn xóa :')
                lop_hoc_A.remove(para)
            else:
                show_page_layer_2()
        else:
            pass
    def input_6():
        if answer == '6':
            try:
                os.system('clear')
                lop_hoc_A.export_to_file(path_to_data)
                print('Export Successfully!')
                if input("type 'q' to quit: ") == 'q':
                    show_page_layer_2()
            except:
                os.system('clear')
                print('Failed!')
                if input("type 'q' to quit: ") == 'q':
                    show_page_layer_2()
    def input_q():
        if answer == 'q':
            os.system('clear')
            exit()
        else:
            pass

    show_page_layer_1()
    lop_hoc_A = LopHoc(input('Nhập tên lớp: '))   
    lop_hoc_A.load_from_file(path_to_data)        
    show_page_layer_2()
    while True:
        input_1()
        input_2()
        input_3()
        input_4()
        input_5()
        input_6()
        input_q()

main()