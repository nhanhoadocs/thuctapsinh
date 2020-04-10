# Hướng dẫn cài đặt Ubuntu 20.04 (Focal Fossa)

## Mở đầu
Ubuntu tuân theo chu kỳ phát hành phiên bản mới 2 lần một năm, với một bản phát hành vào tháng 4 và phiên bản còn lại sẽ được ra mắt vào tháng 10, kèm theo đó là nhiều cải tiến quan trọng. Phiên bản của năm 2020 sẽ là **Ubuntu 20.04** với mã định danh **Focal Fossa**, dự kiến sẽ được tung ra cho người dùng toàn cầu bắt đầu từ ngày 23 tháng 4.

Bài viết này sẽ hướng dẫn các bạn các bước cài đặt Ubuntu 20.04 server.

## Ubuntu server 20.04 có gì mới
Về cơ bản, Ubuntu server 20.04 không có sự thay đổi nhiều so với phiên bản trước đó.

Ubuntu server 20.04 không được cài sẵn Python-2 từ đầu. Người dùng và nhà phát triển phải điều chỉnh và cập nhật code lên Python-3

## Cấu hình yêu cầu

<img src="..\images\Screenshot_2.png">

Trong bài này, ta sẽ cài đặt phiên bản `live server`

---------


# Tải file ISO của Ubuntu 20.04 server
Truy cập link: http://cdimage.ubuntu.com/ubuntu-server/daily-live/current/ xem các file iso của Ubuntu 20.04 server.

Hoặc click vào [link](http://cdimage.ubuntu.com/ubuntu-server/daily-live/current/focal-live-server-amd64.iso) để tải về.

<img src="..\images\Screenshot_1.png">

# Cài đặt Ubuntu 20.04 server
Tạo máy ảo trên các môi trường hoặc đưa đĩa vào trong ổ đĩa của máy cần cài (bước này tùy bạn làm ở môi trường nào nhé).

Sử dụng phím mũi tên và tab để điều hướng tùy chọn cài đặt.

## 1. Nhấn phím bất kì để vào giao diện cài đặt
Giao diện cài đặt:

<img src="..\images\Screenshot_3.png">

Chọn **Install Ubuntu Server**.


## 2. Chọn ngôn ngữ
- Nếu bị như sau: 
    <img src="..\images\Screenshot_5.png">

    Ta chọn mục **Help** -> **Toggle color on/off**

    <img src="..\images\Screenshot_6.png">

    Khi đó, ta sẽ có giao diện cài đặt không bị che.

- Chọn ngôn ngữ là **English**

<img src="..\images\Screenshot_7.png">

## 3. Chọn kiểu bàn phím nhập
- Chọn kiểu bàn phím **English (US)** -> **Done**
<img src="..\images\Screenshot_8.png">

## 4. Thiết lập kết nối mạng
- Màn hình sẽ hiển thị tất cả các giao diện mạng của máy. IP được cấp động.

<img src="..\images\Screenshot_9.png">

- Ta có thể cấu hình tĩnh ngay ở đây. 
    - Bằng cách chọn giao diện mạng -> **Edit IPv4**

        <img src="..\images\Screenshot_10.png">

    - Chọn **Manual**

        <img src="..\images\Screenshot_11.png">

    - Điền thông số IP tĩnh 

        <img src="..\images\Screenshot_12.png">

    - Xong **Save** lại.

- Chọn **Done**

## 5. Cấu hình proxy
Nếu bạn đứng sau proxy hoặc sử dụng máy chủ bộ đệm apt proxy, hãy nhập URL và số cổng của nó vào phần Proxy address. Còn không thì để trống rồi chọn **Done**

<img src="..\images\Screenshot_13.png">

## 6. Chọn mirro lưu trữ
Mirro lưu trữ gần nhất sẽ được tự động chọn trước cho bạn. Hãy ghi đè cài đặt này nếu cần.

<img src="..\images\Screenshot_14.png">

## 7. Filesystem setup
- Ubuntu 20.04 server cung cấp các tùy chọn thiết lập hệ thống tệp như sau:

    <img src="..\images\Screenshot_15.png">

    - **Use An Entire Disk**: Đây là cấu hình hệ thống tệp đơn giản nhất. Trong đó, tất cả các tệp cài đặt khi như là thư mục gốc của người dùng, là một phần của phân vùng (/).

    - **Use An Entire Disk And Set Up LVM**: Tương tự tùy chọn ở trên. Tuy nhiên, nó sử dụng LVM (Logical Volume Manager) để phân vùng đĩa.

    - **Manual** : Người dùng có thể tự cài đặt và quyết định bố trí hệ thống tệp thích hợp.

- Trong bài viết này, ta sẽ chọn option đầu tiên **Use An Entire Disk**

- Chọn disk để cài đặt

    <img src="..\images\Screenshot_16.png">

- Xem lại thông số và chọn **Done**

    <img src="..\images\Screenshot_17.png">

- Tất cả dữ liệu hiện tại trên disk đã chọn sẽ bị xóa

    <img src="..\images\Screenshot_18.png">

## 8. Đặt tên người dùng, tên máy chủ của hệ thống và mật khẩu

<img src="..\images\Screenshot_19.png">

## 9. Tùy chọn cho phép ssh tới server

<img src="..\images\Screenshot_20.png">

## 10. Chọn các phần thêm cho server
Khuyến nghị không chọn thêm bất kì dịch vụ nào và tiến hành cài đặt Ubuntu 20.04 server. Rồi chọn **Done**

<img src="..\images\Screenshot_21.png">

## 11. Hoàn tất
Đợi quá trình cài đặt tiến hành xong, ta chọn **Reboot**

<img src="..\images\Screenshot_22.png">

**Lưu ý:** Nên tắt máy và tháo bộ cài đặt ra khỏi máy, hoặc unmount bộ cài đặt.


# Đăng nhập vào máy sau khi hoàn tất quá trình cài đặt
- Sau khi khởi động xong, ta nhập tài khoản và mật khẩu để truy cập:

    <img src="..\images\Screenshot_23.png">

- Sau khi đăng nhập thành công, ta kiểm tra lại phiên bản của máy:
    ```
    lsb_release -a
    ```

    <img src="..\images\Screenshot_24.png">

- Kiểm tra địa chỉ IP:

    <img src="..\images\Screenshot_25.png">


## SSH vào server
- Ta sử dụng MobaXterm để ssh vào máy vừa cài Ubuntu 20.04 ở trên.

    <img src="..\images\Screenshot_26.png">

- Kiểm tra việc kết nối Internet

    <img src="..\images\Screenshot_27.png">



# Kết luận
Trên đây là hướng dẫn cơ bản để cài đặt Ubuntu 20.04 server. Cảm ơn sự quan của bạn đọc và rất mong sự góp ý từ các bạn.
