# File `hosts`

Khi bạn bắt đầu truy cập vào 1 trang web, hệ thống sẽ tìm trong file hosts này đầu tiên, nếu tìm thấy thông tin về địa chỉ IP và tên miền thì nó sẽ không đi tới DNS Server nữa.

Đường dẫn và cấu trúc file hosts trên Linux và Window mặc định:
1. Linux : `/etc/hosts`

    <img src="..\images\Screenshot_40.png">

2. Window : `C:\Windows\System32\Drivers\etc\hosts`

    <img src="..\images\Screenshot_41.png">

Bằng cách chỉnh sửa file hosts, ta có thể chặn hoặc chuyển hướng các trang web nhất định

Để có thể chỉnh sửa file hosts, ta cần sử dụng quyền admin. Còn nếu không, việc sửa đổi sẽ gặp lỗi.

## 1. Chặn 1 trang web
Để chặn 1 trang web, ta chỉ cần trỏ IP nó về `127.0.0.1`

**Ví dụ**: Ta chặn truy cập vào trang *youtube.com*
- Ban đầu, ta có file hosts như sau:

    <img src="..\images\Screenshot_41.png">

- Truy cập *youtube.com* vẫn bình thường.

    <img src="..\images\Screenshot_42.png">

- Ta tiến hành thêm dòng sau vào file hosts. (**Lưu ý:** Sửa file bằng quyền Administrator)
    ```
    127.0.0.1   youtube.com
    ```

- Ta truy cập lại *youtube.com*. Ta thấy trang web đã bị chặn.

    <img src="..\images\Screenshot_43.png">

- Tuy nhiên, nếu ta truy cập đường dẫn *www.youtube.com* sẽ khác

    <img src="..\images\Screenshot_42.png">

- Vì vậy, ta thêm 1 dòng chặn cả đường dẫn *www.youtube.com*
    ```
    127.0.0.1   www.youtube.com
    ```

    <img src="..\images\Screenshot_44.png">

- Cần khởi động lại máy để file hosts có hiệu lực

## 2. Chuyển hướng website
Người dùng cũng có thể sử dụng mẹo này để chuyển hướng site này đến một site khác. Ví dụ như, sau khi chuyển hướng từ *facebook.com* sang *twitter.com*, khi ta nhập *facebook.com* vào thanh địa chỉ trình duyệt, điểm đến sẽ là *twitter.com*.

- Trước tiên, ta cần biết địa chỉ IP của trang Twitter. Ta dùng cmd ping đến địa chỉ *twitter.com*.

    <img src="..\images\Screenshot_46.png">

- Ta thấy địa chỉ IP là : `104.244.42.65`. Ta thêm dòng sau vào file hosts
    ```
    104.244.42.65     facebook.com
    ```

- Dòng này để máy tính liên kết tên miền *facebook.com* với địa chỉ IP của Twitter. Như vậy, cứ mỗi khi truy cập *facebook.com*, trình duyệt sẽ chuyển hướng đến website Twiter.


## 3. Truy cập nhanh website
Bạn cũng có thể sử dụng mẹo này để truy cập nhanh Website từ bất kỳ chương trình nào trên máy tính. Chẳng hạn như, nếu là tín đồ Twitter, gán `t` với Twitter để chỉ cần nhập `t` vào bất cứ trình duyệt nào bạn cũng sẽ truy cập nhanh chóng tới Twitter. Ta sẽ không cần gõ `.com`, `.net`, `.org` hay bất kỳ loại đuôi nào khác. Tuy nhiên không thể sử dụng dấu cách.

Để làm điều này, chỉ cần bổ sung dòng sau đây tới file hosts và lưu lại:
```
<ip> t
```

## 4. Kiểm thử webserver
Nếu đang vận hành một web server trên mạng nội bộ, có thể người dùng sẽ muốn chắc chắn server hoạt động chính xác trước khi trực tuyến ra Internet. Một số web server chạy nhiều website ở cùng địa chỉ IP và website ta nhận được lại phụ thuộc vào tên máy chủ (host name) đang truy cập. Trong trường hợp này, việc truy cập web server bằng địa chỉ IP cục bộ là chưa đủ. Bạn cần truy cập bằng địa chỉ Website.

**Ví dụ:** ở đây, ta có cài 1 webserver Workpress trên mạng nội bộ với IP `10.10.34.163` và muốn nó chạy trên domain *dangdohai.com*

Ta thêm dòng sau vào file hosts:
```
10.10.34.163        dangdohai.com
```

Lưu lại, và truy cập thử:
- Bằng IP:
    <img src="..\images\Screenshot_47.png">

- Bằng domain *dangdohai.com*
    <img src="..\images\Screenshot_45.png">