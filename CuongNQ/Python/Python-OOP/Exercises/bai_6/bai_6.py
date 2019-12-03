'''
Viết chương trình quản lý thư viện thực hiện các nhiệm vụ sau :
*- Quản lý sách trong thư viện : cho phép thêm, xóa, sửa đổi thông tin về các sách trong cơ sở dữ liệu của chương trình
*- Quản lý người dùng : cho phép thêm , xóa, sửa đổi thông tin về các user trong cơ sở dữ liệu của chương trình
- Phân cấp 2 mức người dùng của chương trình : người dùng bình thường (user) và người dùng cao cấp (admin).
Người dùng bình thường không cần đăng nhập và chỉ có thể xem thông tin về sách trong thư viện .
Người dùng cao cấp có thể sửa đổi thông tin thư viện (thêm, sửa và xóa)
- Một quyển sách có các thông tin sau : mã số (isbn), tên sách (title), chủ đề (subject), tác giả (author), nhà xuất bản
(publisher), ngày tháng xuất bản (date), số trang (pages), số bản copy trong thư viện (copies) . Việc tìm kiếm được thực
hiện trên các thông tin chính là : tên sách , chủ đề , tác giả , nhà xuất bản và năm xuất bản
'''
import subprocess
import os

path_to_book_file = '/home/cuongnq/code/bai_tap_oop/bai_6/book'
path_to_user_file = '/home/cuongnq/code/bai_tap_oop/bai_6/user'


class Book(object):
    def __init__(self, para_isbn, para_title, para_subject, para_author, para_publisher, para_date, para_pages, para_copies):
        self.isbn = para_isbn
        self.title = para_title
        self.subject = para_subject
        self.author = para_author
        self.publisher = para_publisher
        self.date = para_date
        self.pages = para_pages
        self.copies = para_copies


class BookStore(object):
    def __init__(self, para_ten):
        self.ten = para_ten
        self.list_book = []

    def add_book(self, Book):
        self.list_book.append(Book)

    def left_book(self):
        stocks = 0
        for x in self.list_book:
            stocks += int(x.copies)
        return stocks

    def show_list_book(self):
        for x in self.list_book:
            print('Mã : ' + x.isbn + '   -  Tên sách: ' + x.title)

    def search_book(self, para):
        for x in self.list_book:
            if para in [x.title, x.subject, x.author, x.date, x.publisher]:
                print('Mã : ' + x.isbn + '    - Tên sách: '+ x.title)
                print('              - Tác giả: ' + x.author)
                print('              - Số trang: '+ x.pages)
                print('              - Chủ đề: ' + x.subject)
                print('              - NXB: '+ x.publisher)
                print('              - Năm xuất bản: ' + x.date)
                print('              - Số bản còn trong kho: ' + x.copies)
                print('--------------------------------------------------')
            else:
                pass
        else:
            return("No match!")

    def remove_book(self, para):
        for x in self.list_book:
            if para in [x.title, x.subject, x.author, x.date, x.publisher]:
                self.list_book.remove(x)
    
    def change_info(self, para_title, para_option, para_info):
        for x in self.list_book:
            if x.title == para_title:
                if para_option == '1':
                    x.isbn = para_info
                elif para_option == '2':
                    x.title = para_info
                elif para_option == '3':
                    x.subject = para_info
                elif para_option == '4':
                    x.author = para_info
                elif para_option == '5':
                    x.publisher = para_info
                elif para_option == '6':
                    x.date = para_info
                elif para_option == '7':
                    x.pages = para_info
                elif para_option == '8':
                    x.copies = para_info
            
    def import_to_db(self, para_db):
        file_op = open(para_db, 'w')
        for x in self.list_book:
            file_op.write(x.isbn + ',' + x.title + ',' + x.subject + ',' + x.author + ',' + x.publisher + ',' + x.date + ',' + x.pages + ',' + x.copies + ','+ '\n') 
        file_op.close()

    def load_from_db(self, para_db):
        filename = para_db
        file_op = open(filename, 'r')
        count = subprocess.getoutput("cat %s | wc -l" %filename)
        i = 1
        while i <= int(count):
            x = file_op.readline()
            book_data = x.split(',')
            new_book = Book(book_data[0], book_data[1], book_data[2], book_data[3], book_data[4], book_data[5], book_data[6], book_data[7])
            self.list_book.append(new_book)
            i+=1


class User(object):
    level = '1'
    def __init__(self, para_username, para_pass):
        self.username = para_username
        self.password = para_pass
    

class UserAdmin(User):
    level = '0'
    def __init__(self, para_username, para_pass):
        super().__init__(para_username, para_pass)
        

class UserStore(object):
    def __init__(self, para_ten):
        self.ten = para_ten
        self.list_user = []

    def append_user(self, User):
        self.list_user.append(User)

    def import_to_db(self, para_file):
        file_op = open(para_file, 'w')
        for x in self.list_user:
            file_op.write(x.level + ',' + x.username + ',' + x.password + ',' + '\n') 
        file_op.close()

    def remove_user(self, para):
        for x in self.list_user:
            if x.username == para:
                self.list_user.remove(x)

    def change_password(self, para_user, para_newpass):
        for x in self.list_user:
            if x.username == para_user:
                x.password = para_newpass
            else:
                continue
            
    def load_from_db(self, para_file):
        filename = para_file
        file_op = open(filename, 'r')
        count = subprocess.getoutput("cat %s | wc -l" %filename)
        i = 1
        while i <= int(count):
            x = file_op.readline()
            user_info = x.split(',')
            if user_info[0] == '0':
                new_user = UserAdmin(user_info[1], user_info[2]) 
            else:
                new_user = User(user_info[1], user_info[2])
            self.list_user.append(new_user)
            i+=1



def main():
    def show_page_layer_0():
        os.system('clear')
        print('************************************************')
        print('*********CHƯƠNG TRÌNH QUẢN LÝ THƯ VIỆN**********')
        print('************************************************')
        global answer_0
        answer_0 = input('Nhập username: ')
    def show_page_layer_admin():
        os.system('clear')
        print('************************************************')
        print('*********CHƯƠNG TRÌNH QUẢN LÝ THƯ VIỆN**********')
        print('************************************************')
        print('***    1. Quản lý sách                       ***')
        print('***    2. Quản lý user                       ***')
        print('***    q. Thoát                              ***')
        print('************************************************')
        print('*********************ver1.0*********************')
        print('************************************************')
        global answer_admin
        answer_admin = input('press Number, then Press Enter: ')
    def show_page_layer_1():
        os.system('clear')
        print('************************************************')
        print('*********CHƯƠNG TRÌNH QUẢN LÝ THƯ VIỆN**********')
        print('**************----Quản lý sách----**************')
        print('************************************************')
        print('***    1. Tìm kiếm sách                      ***')
        print('***    2. Xem số lượng tồn kho               ***')
        print('***    3. Chỉnh sửa thông tin sách trong kho ***')
        print('***    4. Thêm sách mới                      ***')
        print('***    5. Xóa sách                           ***')
        print('***    q. Thoát                              ***')
        print('************************************************')
        print('*********************ver1.0*********************')
        print('************************************************')
        global answer_1
        answer_1 = input('press Number, then Press Enter: ')
    def show_page_layer_2():
        os.system('clear')
        print('************************************************')
        print('*********CHƯƠNG TRÌNH QUẢN LÝ THƯ VIỆN**********')
        print('**************----Quản lý user----**************')
        print('************************************************')
        print('***    1. Thêm user                          ***')
        print('***    2. Đổi password user                  ***')
        print('***    3. Xóa user                           ***')
        print('***    q. Thoát                              ***')
        print('************************************************')
        print('*********************ver1.0*********************')
        print('************************************************')
        global answer_2
        answer_2 = input('press Number, then Press Enter: ')
    def input_1():
        def input_1_1():
            if answer_1 == '1':
                os.system('clear')
                info = input('Nhập thông tin tìm kiếm : ')
                book_store.search_book(info)
                if input("type 'q' to quit: ") == 'q':
                    show_page_layer_1()
            else:
                pass
        def input_1_2():
            if answer_1 == '2':
                os.system('clear')
                print('Lượng sách tồn kho là: '+ str(book_store.left_book()) + ' cuốn')
                if input("type 'q' to quit: ") == 'q':
                    show_page_layer_1()
            else:
                pass
        def input_1_3():
            if answer_1 == '3':
                os.system('clear')
                query_title = input('Nhập tên sách muốn sửa thông tin: ')
                book_store.search_book(query_title)
                query_option = input('Nhập option muốn chỉnh sửa: \n1. Mã         2. Tên sách\n3. Chủ đề     4. Tác giả\n' + 
                '5. NXB        6. Năm xuất bản\n7. Số trang   8. Số bản còn trong kho\n')
                query_info = input('Nhập nội dung muốn sửa: ')
                try: 
                    book_store.change_info(query_title, query_option, query_info)
                    book_store.import_to_db(path_to_book_file)
                    print('Cập nhật thông tin thành công!')
                    
                except:
                    print('Thay đổi không thành công!')
                if input("type 'q' to quit: ") == 'q':
                        show_page_layer_1()
            else:
                pass
        def input_1_4():
            if answer_1 == '4':
                os.system('clear')
                try:
                    print('Nhập thông tin sách mới: ')
                    new_isbn = input('- Nhập mã số (isbn): ')
                    new_title = input('- Nhập tên sách: ')
                    new_subject = input('- Nhập chủ đề: ')
                    new_author = input('- Nhập tác giả: ')
                    new_publisher = input('- Nhập NXB: ')
                    new_date = input('- Nhập năm SX: ')
                    new_pages = input('- Số trang: ')
                    new_copies = input('- Số cuốn muốn nhập vào kho: ')
                    new_book = Book(new_isbn, new_title, new_subject, new_author, new_publisher, new_date, new_pages, new_copies)
                    book_store.list_book.append(new_book)
                    book_store.import_to_db(path_to_book_file)
                    print('Nhập thành công!')
                    while input('-------------------------------\nNhập thêm? (Y/n)') in ['Y', 'y']:
                        try:
                            os.system('clear')
                            print('Nhập thông tin sách mới: ')
                            new_isbn = input('- Nhập mã số (isbn): ')
                            new_title = input('- Nhập tên sách: ')
                            new_subject = input('- Nhập chủ đề: ')
                            new_author = input('- Nhập tác giả: ')
                            new_publisher = input('- Nhập NXB: ')
                            new_date = input('- Nhập năm SX: ')
                            new_pages = input('- Số trang: ')
                            new_copies = input('- Số cuốn muốn nhập vào kho: ')
                            new_book = Book(new_isbn, new_title, new_subject, new_author, new_publisher, new_date, new_pages, new_copies)
                            book_store.list_book.append(new_book)
                            book_store.import_to_db(path_to_book_file)
                            print('Nhập thành công!')
                        except:
                            print('Nhập không thành công!')
                    else:
                        show_page_layer_1()
                except:
                    print('Nhập không thành công!')
            else:
                pass
        def input_1_5():
            if answer_1 == '5':
                os.system('clear')
                info = input('Nhập tên sách cần xóa: ')
                book_store.search_book(info)
                answer = input('Bạn có chắc chắn muốn xóa mục này? (Y/n)')
                if answer in ['Y', 'y']:
                    try:
                        book_store.remove_book(info)
                        book_store.import_to_db(path_to_book_file)
                        print('Xóa thành công!')
                    except:
                        print('Xóa không thành công!')
                else:
                    show_page_layer_1()
            else:
                pass
        def input_1_q():
            if answer_1 == 'q':
                os.system('clear')
                show_page_layer_admin()
                while True:
                    input_1()
                    input_2()
                    input_q()
            else:
                pass
        
        if answer_admin == '1':
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
                try:
                    new_username = input('Nhập username mới: ')
                    # for x in user_store.list_user:
                    #     while True:
                    #         if x.username == new_username:
                    #             print('Username đã tồn tại! Vui lòng nhập username khác ^^')
                    #         else:
                    #             break
                    new_passwd = input('Nhập password: ')
                    new_level = input('Nhập cấp độ user muốn tạo? (0.Admin - 1.User thường)')
                    if new_level == '0':
                        new_user = UserAdmin(new_username, new_passwd)
                    if new_level == '1':
                        new_user = User(new_username, new_passwd)
                    user_store.append_user(new_user)
                    user_store.import_to_db(path_to_user_file)
                    print('Tạo user thành công!')
                    if input("type 'q' to quit: ") == 'q':
                        show_page_layer_2()
                except:
                    print('Tạo user không thành công')
            else:
                pass
        def input_2_2():
            if answer_2 == '2':
                os.system('clear')
                query_user = input('Nhập user muốn đổi password: ')
                new_pass = input('Nhập password mới: ')
                try:
                    user_store.change_password(query_user, new_pass)
                    user_store.import_to_db(path_to_user_file)
                    print('Thay đổi password thành công!')
                    if input("type 'q' to quit: ") == 'q':
                        show_page_layer_2()
                except:
                    print('Thay đổi password không thành công!')
            else:
                pass
        def input_2_3():
            if answer_2 == '3':
                os.system('clear')
                query_username = input('Nhập tên user cần xóa: ')
                if query_username == 'admin':
                    answer = input('Không thể xóa user này! Xóa user khác? (Y/n)')
                    if answer in ['Y', 'y']:
                        os.system('clear')
                        info = input('Nhập tên user cần xóa: ')
                        try:
                            for x in user_store.list_user:
                                if x.username == info:
                                    ans = input('Bạn có chắc muốn xóa user này? (Y/n)')
                                    if ans in ['Y', 'y']:
                                        user_store.remove_user(info)
                                        user_store.import_to_db(path_to_user_file)
                                        print('Xóa thành công!')
                                        if input("type 'q' to quit: ") == 'q':
                                            show_page_layer_2()
                                    else:
                                        show_page_layer_2()
                        except:
                            print('Không tồn tại user này!')
                else:
                    try:
                        for x in user_store.list_user:
                            if x.username == query_username:
                                ans_1 = input('Bạn có chắc muốn xóa user này? (Y/n)')
                                if ans_1 in ['Y', 'y']:
                                    user_store.remove_user(query_username)
                                    user_store.import_to_db(path_to_user_file)
                                    print('Xóa thành công!')
                                    if input("type 'q' to quit: ") == 'q':
                                        show_page_layer_2()
                                else:
                                    show_page_layer_2()
                    except:
                        print('Không tồn tại user này!')
            else:
                pass
        def input_2_q():
            if answer_2 == 'q':
                os.system('clear')
                show_page_layer_admin()
                while True:
                    input_1()
                    input_2()
                    input_q()
            else:
                pass
        
        if answer_admin == '2':
            show_page_layer_2()
            while True:
                input_2_1()
                input_2_2()
                input_2_3()
                input_2_q()
        else:
            pass

    def input_q():
        if answer_admin == 'q':
            os.system('clear')
            exit()
        else:
            pass


    book_store = BookStore('book')
    user_store = UserStore('user')
    book_store.load_from_db(path_to_book_file)
    user_store.load_from_db(path_to_user_file)
    show_page_layer_0()
    for x in user_store.list_user:
        if answer_0 == x.username:
            if x.level == '0':                      
                passwd = input('Nhập password: ')
                if passwd == x.password:
                    show_page_layer_admin()
                    while True:
                        input_1()
                        input_2()
                        input_q()
                else:
                    print('Wrong password!')
                    exit()
            else:
                passwd = input('Nhập password: ')
                if passwd == x.password:
                    os.system('clear')
                    info = input('Nhập thông tin sách muốn tìm kiếm: ')
                    book_store.search_book(info)
                    while input('Bạn có muốn tìm kiếm thêm không? (Y/n)') in ['Y', 'y']:
                        os.system('clear')
                        info = input('Nhập thông tin sách muốn tìm kiếm: ')
                        book_store.search_book(info)
                    else:
                        exit()
                else:
                    print('Wrong password!')
                    exit()

main()

