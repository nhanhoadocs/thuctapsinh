# Logging
## **1) Giới thiệu**
- **Logging** là một module tiêu chuẩn được đi kèm trong thư viện mặc định do cộng đồng **Python** phát triển , dễ dàng sử dụng và cực kỳ linh hoạt .
- Cú pháp :
    ```py
    import logging
    ```
- **Logging** cung cấp những tiện ích sau :
    - Phân chia level cho các thông báo lỗi
    - cho phép tuỳ chọn mức độ nghiêm trọng của các thông báo
    - cho phép hoặc không cho phép hiển thị một thông báo đã được phân loại
    - Cho phép cấu hình output của thông báo lỗi là trên console hoặc file hoặc nguồn khác

- Mặc định , hàm `debug()` và `info()` sẽ không được ghi log và không được hiển thị . Module `logging` chỉ hiển thị cấp độ từ `WARNING` trở lên . Có thể thay đổi cấu hình này để in ra bất cứ cấp độ log nào .
## **2) Sử dụng `logging` cơ bản**
- Định dạng của chuỗi log mặc định sẽ trả về level , tên user sinh log , và thông điệp lỗi được ngăn cách bởi dấu "`:`" .
- Sử dụng phương thức `basicConfig(**kwargs)` để cấu hình ghi log .
- Cú pháp :
    ```py
    logging.basicConfig(parameter=configure)
    ```
    - **Parameters** :
        - `level` : cấu hình cụ thể mức độ nội dung ghi log
        - `filename` : tên file - vị trí lưu log cụ thể
        - `filemode` : nếu `filename` được khai báo , file sẽ được mở ở mức `filemode` . Mặc định khi không khai báo là mode `append` ( ghi tiếp xuống dưới file )
### **2.1) Cấu hình `level`**
- Các mức nội dung log theo cấp độ tăng dần :
    - `DEBUG` : Thông tin chi tiết, thường là thông tin để tìm lỗi
    - `INFO` : Thông báo thông thường, các thông tin in ra khi chương trình chạy theo đúng kịch bản
    - `WARNING` : Thông báo khi nghi vấn bất thường hoặc lỗi có thể xảy ra, tuy nhiên chương trình vẫn có thể hoạt động
    - `ERROR` : Lỗi, chương trình có thể không hoạt động được một số chức năng hoặc nhiệm vụ nào đó, thường thì nên dùng ghi bắt được Exception
    - `CRITICAL` : Lỗi, chương trình gặp lỗi nghiêm trọng không thể giải quyết được và bắt buộc phải dừng lại
- **VD1 :**  
    ```py
    import logging

    logging.debug('This is a debug message')
    logging.info('This is an info message')
    logging.warning('This is a warning message')
    logging.error('This is an error message')
    logging.critical('This is a critical message')
    ```
    => Output :
    ```
    WARNING:root:This is a warning message
    ERROR:root:This is an error message
    CRITICAL:root:This is a critical message
    ```
- **VD2 :** Cấu hình `level` : ghi log mức độ `debug`
    ```py
    import logging

    logging.basicConfig(level=logging.DEBUG)
    logging.debug('This will get logged')
    ```
    => Output :
    ```
    DEBUG:root:This will get logged
    ```
### **2.2) Cấu hình `filename` - `filemode`**
- Thay vì đưa log ra màn hình console , có thể lựa chọn việc ghi log vào file bằng option `filename` và `filemode` .
- **VD :**
    ```py
    import logging
    logging.basicConfig(filename='app.log', filemode='w')
    logging.warning('This will get logged to a file')
    ```
    => Log được ghi vào file `app.log`

    <img src=https://i.imgur.com/PC4gJLt.png>

### **2.3) Cấu hình `format`**
- Có thể add thêm nhiều thuộc tính ( ***attribute*** ) để hiển thị một cách đa dạng dòng log .
- Cú pháp :
    ```py
    import logging

    logging.basicConfig(format='attr-attr-attr...-attr')
    ```
- Bảng các thuộc tính ( ***attribute*** ) :

    | Tên | Cú pháp | Mô tả |
    |-----|---------|-------|
    | args | 
    | asctime | `%(asctime)s` | Định dạng thời gian dễ đọc khi log được tạo ra . Định dạng mặc định : ‘`2003-07-08 16:49:45,896`’ |
    | created | `%(created)f` | thời gian khi log được tạo , là kết quả của hàm `time.time()` |
    | exc_info |  | 
    | filename | `%(filename)s` | thời gian khi log được tạo , là kết quả của hàm `time.time()` |
    | funcName | `%(funcName)s` | tên của hàm chứa lệnh ghi log |
    | levelname | `%(levelname)s` | Tên level log : `DEBUG` ; `INFO` ; `WARNING` ; `ERROR` ; `CRITICAL` |
    | levelno | `%(levelno)s` | Số hiệu của level log : `10` (`DEBUG`) ; `20` (`INFO`) ; `30` (`WARNING`) ; `40` (`ERROR`) ; `50` (`CRITICAL`) |
    | lineno | `%(lineno)d` |
    | message | `%(message)s` | thông điệp log |
    | module | `%(module)s` |
    | msecs | `%(msecs)d` |
    | msg | 
    | name | `%(name)s` | tên của user sinh log |
    | pathname | `%(pathname)s` | 
    | process | `%(process)d` | Process ID ( nếu có ) |
    | processName | `%(processName)s` | Tên Process ( nếu có ) |
    | relativeCreated | `%(relativeCreated)d` | 
    | stack_info |  | 
    | thread | `%(thread)d` | Thread ID ( nếu có ) |
    | threadName | `%(threadName)s` | Tên thread ( nếu có )

    [Tham khảo thêm](https://docs.python.org/3/library/logging.html#logrecord-attributes)
- **VD :** In ra log với 3 thuộc tính ( `attr` ) : `process ID` , `level` , `messages` :
    ```py
    import logging

    logging.basicConfig(format='%(process)d-%(levelname)s-%(message)s')
    logging.warning('This is a Warning')
    ```
    => Output :
    
    <img src=https://i.imgur.com/SP96liD.png>

## **3) Các thao tác nâng cao với `logging`**
### **3.1) Đưa biến vào `log`**
- Có thể sử dụng phương thức định dạng chuỗi để lồng biến vào trong thông báo log .
- **VD :**
    ```py
    import logging
    
    user_logon = "cuongnq"
    logging.error('%s raised an error', user_logon)
    ```
    hoặc :
    ```py
    import logging

    user_logon = "cuongnq"
    logging.error(f'{user_logon} raised an error')
    ```
    => Output :

    <img src=https://i.imgur.com/497dNxU.png>

### **3.2) Capture lại phần thông báo lỗi của Python ( *traceback* )**
- Có thể sử dụng tham số `exc_info` để lưu lại đoạn thông báo lỗi của Python .
- **VD :**
    ```py
    import logging

    a = 5
    b = 0

    try:
    c = a / b
    except Exception as e:
    logging.error("Exception occurred", exc_info=True)
    ```
    => Output :

    <img src=https://i.imgur.com/dlamWYm.png>


[Tìm hiểu thêm_1](https://realpython.com/python-logging/)
[Tìm hiểu thêm_2](https://techblog.vn/log-cho-python-su-dung-sao-cho-dung-va-de-nhan-biet)