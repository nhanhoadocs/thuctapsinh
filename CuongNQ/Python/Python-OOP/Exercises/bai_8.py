'''
Xây dựng các lớp theo sơ đồ sau :

                            Hình vẽ
                               |
            ___________________|___________________
            |                                     |
        Hai chiều                              Ba chiều
            |                                     |
     _______|________                     ________|________
     |      |       |                     |               |
   Tròn   Vuông   Tam giác               Cầu          Lập phương

Tạo phương thức cho các lớp trên và cho phép in ra được thông tin của các hình
như chu vi , diện tích, thể tích...
'''
import math
import os
class HinhVe(object):
    
    def __init__(self, para_ten):
        self.ten_hinh = para_ten
        
class HaiChieu(HinhVe):
    def __init__(self, para_ten):
        super().__init__(para_ten)
        self.type = "Hai chiều"

class BaChieu(HinhVe):
    def __init__(self, para_ten):
        super().__init__(para_ten)
        self.type = "Ba chiều"

class HinhTron(HaiChieu):
    def __init__(self, para_ten, para_bankinh):
        super().__init__(para_ten)
        self.ban_kinh = int(para_bankinh)
    def tinh_chu_vi(self):
        self.chu_vi = math.pi * 2 * self.ban_kinh
        return float(self.chu_vi)
    def tinh_dien_tich(self):
        self.dien_tich = math.pi * self.ban_kinh * self.ban_kinh
        return float(self.dien_tich)
    
class HinhVuong(HaiChieu):
    def __init__(self, para_ten, para_canh):
        super().__init__(para_ten)
        self.canh = int(para_canh)
    def tinh_chu_vi(self):
        self.chu_vi = self.canh * 4
        return self.chu_vi
    def tinh_dien_tich(self):
        self.dien_tich = pow(self.canh, 2)
        return self.dien_tich

class HinhChuNhat(HaiChieu):
    def __init__(self, para_ten, para_canh_a, para_canh_b):
        super().__init__(para_ten)
        self.canh_a = int(para_canh_a)
        self.canh_b = int(para_canh_b)
    def tinh_chu_vi(self):
        self.chu_vi = 2 * (self.canh_a + self.canh_b)
        return self.chu_vi
    def tinh_dien_tich(self):
        self.dien_tich = self.canh_a * self.canh_b
        return self.dien_tich

class TamGiacDeu(HaiChieu):
    def __init__(self, para_ten, para_canh):
        super().__init__(para_ten)
        self.canh = int(para_canh)
    def tinh_chu_vi(self):
        self.chu_vi = int(self.canh) * 3
        return self.chu_vi
    def tinh_dien_tich(self):
        self.dien_tich = pow(int(self.canh), 2) * (math.sqrt(3) / 4)
        return float(self.dien_tich)

class TamGiacThuong(HaiChieu):
    def __init__(self, para_ten, para_canh_a, para_canh_b, para_canh_c):
        super().__init__(para_ten)
        self.canh_a = int(para_canh_a)
        self.canh_b = int(para_canh_b)
        self.canh_c = int(para_canh_c)
    def tinh_chu_vi(self):
        self.chu_vi = self.canh_a + self.canh_b + self.canh_c
        return self.chu_vi
    def tinh_dien_tich(self):
        self.nua_chu_vi = self.chu_vi / 2
        self.dien_tich = math.sqrt((self.nua_chu_vi) * (self.nua_chu_vi - self.canh_a) * (self.nua_chu_vi - self.canh_b) * (self.nua_chu_vi -self.canh_c))
        return self.dien_tich

class HinhCau(BaChieu):
    def __init__(self, para_ten, para_bankinh):
        super().__init__(para_ten)
        self.ban_kinh = int(para_bankinh)
    def tinh_dien_tich(self):
        self.dien_tich = 4 * math.pi * pow(self.ban_kinh, 2)
        return(self.dien_tich)
    def tinh_the_tich(self):
        self.the_tich = (4 / 3) * math.pi * pow(self.ban_kinh, 3)
        return(self.the_tich)

class HinhLapPhuong(BaChieu):
    def __init__(self, para_ten, para_canh):
        super().__init__(para_ten)
        self.canh = int(para_canh)
    def tinh_dien_tich_xung_quanh(self):
        self.dien_tich_xung_quanh = 4 * pow(self.canh, 2)
        return self.dien_tich_xung_quanh
    def tinh_dien_tich_toan_phan(self):
        self.dien_tich_toan_phan = 6 * pow(self.canh, 2)
        return self.dien_tich_toan_phan
    def tinh_the_tich(self):
        self.the_tich = pow(self.canh, 3)
        return self.the_tich

class HinhHopChuNhat(BaChieu):
    def __init__(self, para_ten, para_canh_a, para_canh_b, para_canh_h):
        super().__init__(para_ten)
        self.canh_a = int(para_canh_a)
        self.canh_b = int(para_canh_b)
        self.canh_h = int(para_canh_h)
    def tinh_dien_tich_xung_quanh(self):
        self.dien_tich_xung_quanh = 2 * self.canh_h * (self.canh_a + self.canh_b)
        return self.dien_tich_xung_quanh
    def tinh_dien_tich_toan_phan(self):
        self.dien_tich_toan_phan = self.dien_tich_xung_quanh + 2 * self.canh_a * self.canh_b
        return self.dien_tich_toan_phan
    def tinh_the_tich(self):
        self.the_tich = self.canh_a * self.canh_b * self.canh_h
        return self.the_tich

def show_page_layer_0():
    print('***************************************************')
    print('**********CHƯƠNG TRÌNH TÍNH TOÁN HÌNH HỌC**********')
    print('***************************************************')
    print('*****    1. Hình học phẳng                    *****')
    print('*****    2. Hình học không gian               *****')
    print('*****    q. Thoát                             *****')
    print('***************************************************')
    global answer_0
    answer_0 = input('press Number, then Press Enter: ')

def show_page_layer_1():
    os.system('clear')
    print('***************************************************')
    print('**********CHƯƠNG TRÌNH TÍNH TOÁN HÌNH HỌC**********')
    print('***************************************************')
    print('*****    1. Tam giác thường/vuông/cân         *****')
    print('*****    2. Tam giác đều                      *****')
    print('*****    3. Hình vuông                        *****')
    print('*****    4. Hình chữ nhật                     *****')
    print('*****    5. Hình tròn                         *****')
    print('*****    q. Thoát                             *****')
    print('***************************************************')
    global answer_1
    answer_1 = input('press Number, then Press Enter: ')

def show_page_layer_2():
    os.system('clear')
    print('***************************************************')
    print('**********CHƯƠNG TRÌNH TÍNH TOÁN HÌNH HỌC**********')
    print('***************************************************')
    print('*****    1. Hình hộp chữ nhật                 *****')
    print('*****    2. Hình lập phương                   *****')
    print('*****    3. Hình cầu                          *****')
    print('*****    q. Thoát                             *****')
    print('***************************************************')
    global answer_2
    answer_2 = input('press Number, then Press Enter: ')

def main():
    def input_1():
        def input_1_1():
            if answer_1 == '1' :
                os.system('clear')
                canh_a = input('Nhập cạnh a: ')
                canh_b = input('Nhập cạnh b: ')
                canh_c = input('Nhập cạnh c: ')
                hinh_A = TamGiacThuong('ABC', canh_a, canh_b, canh_c)
                print('--------------------------')
                print('Chu vi : {}'.format(hinh_A.tinh_chu_vi()))
                print('Diện tích: {}'.format(hinh_A.tinh_dien_tich()))
                print('-------------')
                if input("type 'q' to quit: ") == 'q':
                    show_page_layer_1()
            else:
                pass
        def input_1_2():
            if answer_1 == '2':
                os.system('clear')
                canh = input('Nhập cạnh a: ')
                hinh_A = TamGiacDeu('ABC', canh)
                print('--------------------------')
                print('Chu vi : {}'.format(hinh_A.tinh_chu_vi()))
                print('Diện tích: {}'.format(hinh_A.tinh_dien_tich()))
                print('-------------')
                if input("type 'q' to quit: ") == 'q':
                    show_page_layer_1()
            else:
                pass
        def input_1_3():
            if answer_1 == '3':
                os.system('clear')
                canh = input('Nhập cạnh a: ')
                hinh_A = HinhVuong('ABCD', canh)
                print('--------------------------')
                print('Chu vi : {}'.format(hinh_A.tinh_chu_vi()))
                print('Diện tích: {}'.format(hinh_A.tinh_dien_tich()))
                print('-------------')
                if input("type 'q' to quit: ") == 'q':
                    show_page_layer_1()
            else:
                pass
        def input_1_4():
            if answer_1 == '4':
                os.system('clear')
                canh_a = input('Nhập chiều dài: ')
                canh_b = input('Nhập chiều rộng: ')
                hinh_A = HinhChuNhat('ABCD', canh_a, canh_b)
                print('--------------------------')
                print('Chu vi : {}'.format(hinh_A.tinh_chu_vi()))
                print('Diện tích: {}'.format(hinh_A.tinh_dien_tich()))
                print('-------------')
                if input("type 'q' to quit: ") == 'q':
                    show_page_layer_1()
            else:
                pass
        def input_1_5():
            if answer_1 == '5':
                os.system('clear')
                ban_kinh = input('Nhập bán kính: ')
                hinh_A = HinhTron('O', ban_kinh)
                print('--------------------------')
                print('Chu vi : {}'.format(hinh_A.tinh_chu_vi()))
                print('Diện tích: {}'.format(hinh_A.tinh_dien_tich()))
                print('-------------')
                if input("type 'q' to quit: ") == 'q':
                    show_page_layer_1()
            else:
                pass
        def input_1_q():
            if answer_1 == 'q':
                os.system('clear')
                show_page_layer_0()
                while True:
                    input_1()
                    input_2()
                    input_q()
            else:
                pass

        if answer_0 == '1':
            show_page_layer_1()
            while True:
                input_1_1()
                input_1_2()
                input_1_3()
                input_1_4()
                input_1_5()
                input_1_q()
        else:
            pass

    def input_2():
        def input_2_1():
            if answer_2 == '1':
                os.system('clear')
                canh_a = input('Nhập chiều dài đáy a: ')
                canh_b = input('Nhập chiều rộng đáy b: ')
                canh_h = input('Nhập chiều cao h: ')
                hinh_A = HinhHopChuNhat('ABCDEFGH', canh_a, canh_b, canh_h)
                print('--------------------------')
                print('Diện tích xung quanh: {}'.format(hinh_A.tinh_dien_tich_xung_quanh()))
                print('Diện tích toàn phần: {}'.format(hinh_A.tinh_dien_tich_toan_phan()))
                print('Thể tích : {}'.format(hinh_A.tinh_the_tich()))
                print('-------------')
                if input("type 'q' to quit: ") == 'q':
                    show_page_layer_2()
            else:
                pass
        def input_2_2():
            if answer_2 == '2':
                os.system('clear')
                canh = input('Nhập cạnh a: ')
                hinh_A = HinhLapPhuong('ABCDEFGH', canh)
                print('--------------------------')
                print('Diện tích xung quanh: {}'.format(hinh_A.tinh_dien_tich_xung_quanh()))
                print('Diện tích toàn phần: {}'.format(hinh_A.tinh_dien_tich_toan_phan()))
                print('Thể tích : {}'.format(hinh_A.tinh_the_tich()))
                print('-------------')
                if input("type 'q' to quit: ") == 'q':
                    show_page_layer_2()
            else:
                pass
        def input_2_3():
            if answer_2 == '3':
                os.system('clear')
                bankinh = input('Nhập bán kính: ')
                hinh_A = HinhCau('O', bankinh)
                print('--------------------------')
                print('Diện tích mặt cầu: {}'.format(hinh_A.tinh_dien_tich()))
                print('Thể tích: {}'.format(hinh_A.tinh_the_tich()))
                print('-------------')
                if input("type 'q' to quit: ") == 'q':
                    show_page_layer_2()
            else:
                pass
        def input_2_q():
            if answer_2 == 'q':
                os.system('clear')
                show_page_layer_0()
                while True:
                    input_1()
                    input_2()
                    input_q()
            else:
                pass
        if answer_0 == '2':
            show_page_layer_2()
            while True:
                input_2_1()
                input_2_2()
                input_2_3()
                input_2_q()
        else:
            pass
    def input_q():
        if answer_0 == 'q':
            os.system('clear')
            exit()
        else:
            pass

    os.system('clear')
    show_page_layer_0()
    while True:
        input_1()
        input_2()
        input_q()
    else:
        exit()

main()


