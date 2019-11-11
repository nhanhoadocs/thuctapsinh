<a name="Sao lưu dữ liệu">

# Sao lưu dữ liệu

## Nội dung

 - Nhu cầu sao lưu và phục hồi dữ liệu
 - Công cụ để sao lưu và phục hồi
 - Sao lưu thư mực và tệp
 - Sao lưu phân vùng và ổ đĩa đãi
 - Phục hồi

 - Vì sao phải sao lưu và phục hồi ?
    - Hệ thống có thể bị lỗi 
        - Phần cứng, phần mềm, lỗi thao tác do quản trị viên 
    - Dữ liệu có thể bị phá hủy 
        - Lỗi phần cứng, lỗi phần mềm, lỗi con người 
        - Thiên tai, hỏa hoạn, chập điện 
    - Cần phục hồi hệ thống sau sự cố 
    - Để phục hồi thành công, trước khi xảy ra sự cố cần tiến hành SAO LƯU hệ thống 
    - Sự cố có thể xảy ra bất cứ lúc nào 
    - Luôn luôn đảm bảo có bản sao lưu cập nhật nhất của hệ thống

- Các loại sao lưu

    - Sử dụng các phần cứng dự trữ 
    - Sao lưu thư mục và tệp 
        - Sử dụng command tar 
    - Sao lưu phân vùng và ổ đĩa 
        - Sử dụng  lệnh dump  và restore 

- Dự trữ thiết bị vật lý

    - Máy chủ dự trữ 
    - Ổ đĩa dự trữ 
    - Dịch vụ dự trữ 
    - Dạng dự trữ 
        - Cold backup: máy tính sẵn sàng để phục hồi dịch vụ khi có dữ liệu để phục hồi 
        - Warm: máy tính đã có sẵn dữ liệu để phục hồi 
        - Hot: máy tính đã ở trạng thái vận hành 
    - Vị trí 
        - Đơn vị chuyên thực hiện dự trữ 
        - Vị trí khác của đơn vị 
        - Một đơn vị khác, thỏa thuận chia sẻ thiết bị để sao lưu 
        - Không cùng một vị trí

- Sao lưu dữ liệu
    - Nhiệm vụ 
        - Chép dữ liệu ra một vị trí an toàn 
        - Kiểm tra dữ liệu có thể phục hồi được 
        - Luôn sẵn sàng để phục hồi 
    - Chiến lược sao lưu 
        - Qui định khi nào, ai, công cụ nào để sao lưu 
        - Qui trình sao lưu và phục hồi



- Tar - Sao lưu tệp và thư mục
 
```
[root@hunghm huhu]# tar -zcvf file1.tar.gz file1
file1
[root@hunghm huhu]# ll
total 8
-rw-r--r--. 1 root root  14 Jul  8 14:44 file1
-rw-r--r--. 1 root root 128 Jul  8 15:59 file1.tar.gz
-rw-r--r--. 1 root root   0 Jul  8 14:44 oanh.tar
[root@hunghm huhu]# rm -f file1
[root@hunghm huhu]# ll
total 4
-rw-r--r--. 1 root root 128 Jul  8 15:59 file1.tar.gz
-rw-r--r--. 1 root root   0 Jul  8 14:44 oanh.tar
[root@hunghm huhu]# tar -zxvf file1.tar.gz
file1
[root@hunghm huhu]# ll
total 8
-rw-r--r--. 1 root root  14 Jul  8 14:44 file1
-rw-r--r--. 1 root root 128 Jul  8 15:59 file1.tar.gz
-rw-r--r--. 1 root root   0 Jul  8 14:44 oanh.tar
[root@hunghm huhu]# cat file1
day la file 1
[root@hunghm huhu]#

```

<img src="https://imgur.com/TuS2EZz.jpg">

<img src="https://imgur.com/FU87dfe.jpg">


