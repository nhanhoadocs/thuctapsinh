# Regular Expression

# Su dung phuong thuc nhu tach, tim va su dung danh sach cat chuoi de trich xuat cac phan cua dong 

# Nhiem vu trich xuat nay pho bien den noi python co 1 thu vien rat manh goi la bieu thuc chinh quy (Regular expression)

# Chúng rất mạnh mẽ, hơi phức tạp và cú pháp của chúng phải mất thởi gian để làm quen. 

# Các biểu thức chính quy gần như 1 ngôn ngữ lập trình nhỏ của riêng chúng để tìm kiếm và phân tích chuỗi. Như 1 vấn đề thực tế, toàn bộ cuốn sách đã được viết về chủ đề biểu thức chính quy. 

 # Trước khi sử dụng ta nhập vào biểu thức chính quy, thư viện của nó dơn giản nhất là sử dụng hàm search
    # Có ví dụ sau : #
    # Ví dụ sẽ sử dụng biểu thức chính quy, search những dòng có chứ từ Mình và in dòng chứa từ đó
import re
name = input('Nhập vào file: ')
hand = open(name)
for line in hand:
    line = line.rstrip () # Lệnh để xóa khoảng trắng khi hiển thị
    if re.search('Minh', line):
        print(line)
    # Ví dụ sau cũng sử dụng các phương thức search tương tự nhưng do có sử dụng ^Minh nên nó sẽ chỉ hiển thị những dòng nào có ký tự đầu tiên là Minh
import re
name = input('Nhập vào file: ')
hand = open(name)
for line in hand:
    line = line.rstrip () # Lệnh để xóa khoảng trắng khi hiển thị
    if re.search('^Minh', line):
       print(line)

# RegEX Function 

# The re modul cung cấp 1 tập hợp các chức năng cho phép chúng ta tìm kiếm 1 chuỗi : 
 # findall : trả về danh sách chứa tất cả các kết quả khớp 
 # search : Trả về đối tượng phù hợp nếu có từ xuất hiện ở bất cứ đâu trong chuỗi
 # split : Trả về 1 danh sách các chuỗi sau khi phân chia chuỗi bằng dấu phân cách đã chỉ định
 # sub: Thay thế 1 hoặc nhiều kết quả khớp bằng 1 chuỗi 

# Ví dụ : Trích xuất ra 1 phần dữ liệu phù hợp từ 1 chuỗi trong Python, ta có thể sử dụng method findall()
    # Nó sẽ chỉ hiển thị dữ ký tự phù hợp rằng có ký tự ở trước và sau dấu @ => Chỉ hiển thị địa chỉ email
import re 
text = 'message from csev@umich.edu to cwen@iupui.edu about meeting @2PM'
lst = re.findall('\S+@\S+', text)
#print(lst)

# Ví dụ hiển thị 1 giá trị mà nó thỏa mãn nhiều điều kiện cùng 1 lúc, hãy cho giá trị muốn hiển thị vào dấu ()
import re
fname = input('Nhập vào tên file : ')
fhand = open(fname)
for line in fhand:
    line = line.rstrip()
    x = re.findall('^X\S*: ([0-9.]+)', line)
    if len(x) > 0:
        print(x)

# Một số toán tử để sử dụng trong regular expression

#  ^ : math với giá trị đầu dòng
#  $ : match với giá trị cuối dòng
# . : match với bất kỳ ký tự nào
# \s : Match với 1 ký tự khoảng trống 
# \S : Match với 1 giá trị đứng ngay trước đó (bất kỳ giá trị nào)
#  * : Match với các giá trị đứng ngay trước đó 
# + : Match với các giá trị đứng ngay trước nhưng sau đó cần match với ít nhất 1 giá trị 
#  [a-z0-9] : Bạn có thể chỉ ra giải ký tự 
# () : chỉ để lấy ra substring trong chuỗi thỏa mãn regular expression 
# \b : match với 1 chuỗi trống nhưng chỉ ở đầu hoặc cuối 1 từ 
# \d : match với các số thập phân. tương đương [0-9]
# \D : match với giá trị không phải số 

