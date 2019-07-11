# CÀI ĐẶT PHẦN MỀM  
CentOS7 có các 3 cách cài đặt phổ biến là yum, rpm và biên dịch phần mềm  
1/ RedHat Package Manager (RPM)

Một tiện ích được phát triển trong dòng họ Linux Redhat từ khi mới ra đời. Tiện ích này có chức năng tương đương với dpkg trên hệ thống Ubuntu.

Nó cung cấp cho người dùng nhiều tính năng để duy trì hệ thống của mình. Người dùng có thể cài đặt, xóa hoặc nâng cấp các package trực tiếp bằng lệnh. RPM có một cơ sở dữ liệu chứa các thông tin của các package đã cài đặt và các tập tin của chúng, nhờ vậy RPM cho phép bạn truy vấn các thông tin, cùng như xác thực các package trong hệ thống. Nhược điểm của RPM là không tự động xác định các gói phụ thuộc.Vì các phần mềm cần 1 hoặc nhiều các thư viện để có thể cài được . 
 - Cài đặt phần package :  
 - Cập nhật phần package : 
 - Xóa phần package :  

Cấu trúc của một rpm package :  

<img src="https://i.imgur.com/9NJ9eFu.png">  
  
 2/ Yellowdog Updater Modified (YUM)

Một tiện ích khác được cộng đồng Redhat phát triển riêng, nó cũng tương tự như tiện ích RPM mục đích và ưu điểm giúp người dùng cài đặt phần mềm dễ dàng hơn. Tuy nhiên ở yum có sự khác biệt đó là nó tự động xác định được các gói phụ thuộc và tự động cài đặt các gói phụ thuộc đó trước khi cài đặt gói chính. Yêu cầu của phương pháp này là bạn phải có internet.  

3/ Biên dịch phần mềm

Phương pháp này thì khác hơn so với RPM và Yum nó không phụ thuộc bạn dùng distro nào miễn là dùng Linux là điều có thể dùng phương pháp này. Bước đầu tiên khi muốn thực hiện phương pháp cài đặt này là bạn phải có file source của nó(có định dạng thường là file nén tag.gz. tar.bz2,..). Sau khi down file source về bạn tiến hành giải nén nó ra, sau đó chuyển đến thư mục giải nén thực hiện quá trình đầu tiên là check thư viện và các config file. Lỗi 98% thường xuất hiện tại bước này, vì cũng giống như RPM biên dịch phần mềm cũng cần phải đầy đủ thư viện thì mới có thể biên dịch được. Và bước này cũng chiếm nhiều thời gian nhất trong 3 bước cài đặt, qua được bước này 2 bước kia coi như là hoàn tất.

Biên dịch phần mềm có phần giống với tiện ích RPM là không thể tự động tìm các gói phụ thuốc để cài đặt trước như tiện ích Yum, và 1 đặc điểm chung nữa là cả Yum và RPM điều cài đặt những gói nhị phân. Nói một cách dễ hiểu, cài đặt gói nhị phân như RPM hay Yum thì nhượt điểm đó là bạn không thể tự mình điều khiển được những gì muốn cài vào hệ thống mà gần như mặc định là cài tất cả. Nhưng 1 trong 3 nguyên tắc trong bảo mật hệ thống “những gì không dùng nên xóa hoặc tắt bỏ”, mục đích của nguyên tắc này là giảm thiểu rủi ro một cách tối ưu nhất có thể cho hệ thống phát sinh từ những thành phần hay module trong phần mềm. Với yêu cầu này thì phương pháp biên dịch phần mềm có thể giúp bạn giải quyết được, bạn có thể tùy chỉnh cài đặt những thành phần nào vào hệ thống ở bước đầu tiên.

Bên cạnh đó, việc sử dụng phương pháp biên dịch bạn có thể tối ưu hóa tài nguyên hệ thống.  
# ĐỊNH DẠNG FILE NÉN VÀ GIẢI NÉN  

**- Định dạng** 

- gzip
- bzip2
- xz
- zip
- rar

**Giải nén**  
  1.File dạng .tar  
```
  tar -xvf file.tar  
  tar -xzvf file.tar.gz   
  tar -xjvf file.tar.bz2  
```
  Trong đó   
   x : giải nén file .tar  
    f: tên file  
    z : giải nén định dạng gz  
    j : giải nén định dạng bz2  

2.FIle dạng zip :   
unzip file.zip  

3.File dang rar:
unrar file.rar  

**Nén**
- File -cvf file.tar file.txt
- zip file.zip file.txt
- rar file.rar file.txt  

Trong đó file đầu tiên là file được nén ra định dạng , còn file thứ 2 là phải gốc .  

    


