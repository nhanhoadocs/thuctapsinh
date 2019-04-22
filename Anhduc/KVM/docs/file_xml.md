# 1.Khái niệm 
- XML(eXtensible Markup Language): Đây là ngôn ngữ đánh dấu chung do W3c đề nghị để tạo ra các ngôn ngữ khác. Nó có khả năng mô tả nhiều loại dữ liệu khác nhau 
- Mục đích của XML là đơn giản hóa việc chia sẻ dữ liệu giữa các hệ thống khác nhau đặc biết là đối với các hệ thống được kết nối qua Internet
- Một VM trong kvm có hai thành phần chính đó là VM's definition được lưu dưới dạng file XML mặc định ở thư mục /etc/libvirt/qemu và VM's storage lưu dưới dạng file image
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/XML/Screenshot%20from%202019-03-08%2013-49-34.png)
# 2.Các thành phần trong domain file XML
-  Trong domain bao gồm một số các thành phần như sau 
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/XML/Screenshot%20from%202019-03-08%2013-59-21.png)
- Name: Tên máy ảo, chỉ bao gồm kí tự chữ và số và không được trùng với những máy ảo đang chạy.
- uuid: Mã nhận dạng quốc tế duy nhất cho máy ảo.
- Memory: Lượng ram của máy ảo 
- Vcpu: Số cpu máy ảo được cài đặt 
- Ở mục devices có thể cho ta biết được vị trí lưu của file images
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/XML/Screenshot%20from%202019-03-08%2014-02-38.png)
    - Vị trí lưu máy ảo này là `source file='/var/lib/libvirt/images/centos7.0-1.qcow2`
- Ở mục interface sẽ cho ta biết được địa chỉ MAC và card để ta đang sử dụng 
- ![](https://github.com/duckmak14/linux/blob/master/KVM/images/XML/Screenshot%20from%202019-03-08%2014-06-41.png)
    - Ở đây ta thấy địa chỉ mac của interface này là 52:54:00:b3:92:15
    - Loại card ở đây dùng là default 
    - Ở đây lưu trữ card mạng mà máy sử dụng thì khi ta thay đổi thông số card mạng ở đây sang thành card mạng khác thì card mạng của máy sử dụng khi bật lại cũng sẽ được thay đổi theo 