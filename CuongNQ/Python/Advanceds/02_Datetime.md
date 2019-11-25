# Datetime trong Python
## **1) Date**
- `Date` không phải kiểu dữ liệu nguyên thủy trong **Python** , nhưng có thể import một module tên là `datetime` để là việc với `dates` như một **object** .
- **VD1 :** In ra ngày giờ hiện tại :
    ```py
    # show_time.py
    import datetime
    x = datetime.datetime.now()
    print(x)
    print(type(x))
    ```
    => Output :
    ```
    2019-10-04 00:58:42.081643      # Ngày giờ hiện tại của hệ thống
    <class 'datetime.datetime'>
    ```
- Xét kết quả output : `2019-10-04 00:58:42.081643`
    - **Date object** bao gồm :
        - Năm : `2019` - hàm `year`
        - Tháng : `10` - hàm `month`
        - Ngày : `04` - hàm `date`
        - Giờ : `00` - hàm `hour`
        - Phút : `58` - hàm `minute`
        - Giây : `42` - hàm `second`
        - Miligiay : `081643` - hàm `milisecond`
    - **VD2 :** Hiển thị từng thông số thời gian riêng biệt :
        ```py
        # show_time.py
        import datetime
        x = datetime.datetime.now()
        print(x.year)
        print(x.month)
        print(x.day)
        print(x.hour)
        print(x.minute)
        print(x.second)
        print(x.microsecond)
        print(x.today().weekday())     # In ra thứ trong tuần
        ```
        => Output :
        ```
        2019
        10
        4
        1
        10
        3
        754350
        4                       # 4 là thứ 5 trong tuần
        ```
## **2) Tạo ra một object date**
- Để tạo ra một **object date** , có thể sử dụng hàm khởi tạo `datetime()` của **module** `datetime` .
- Cú pháp :
    ```py
    datetime(year, month, day, hour, minute, second, microsecond)
    ```
    > Tuy nhiên , hàm `datetime()` chỉ cần 3 thông số đầu để tạo ra 1 **object**
- **VD :**
    ```py
    # creat_date.py
    import datetime
    x = datetime.datetime(2019, 12, 12)
    print(x)
    ```
    => Output :
    ```
    2019-12-12 00:00:00          # Các tùy chọn không khai báo mặc định là 0
    ```
## **3) Phương thức `strftime()`**
- **Object** `datetime` có phương thức `strftime()` để định dạng đối tượng `datetime` thành chuỗi dễ đọc .
- Cú pháp :
    ```py
    <var>.strftime("format")
    ```
    Bảng các **format** :

    | Format | Mô tả | Ví dụ |
    |--------|-------|-------|
    | `%a` | thứ trong tuần , dạng ngắn | `Wed` |
    | `%A` | thứ trong tuần , dạng đủ | `Wednesday` |
    | `%w` | ngày trong tuần , dạng số từ `0-6` , chủ nhật là `0` | `3` |
    | `%d` | ngày trong tháng , từ `01-31` | `30` |
    | `%b` | tháng , dạng ngắn | `Dec` |
    | `%B` | tháng , dạng đủ | `December` |
    | `%m` | tháng , dạng số , từ `01-12` | `12` |
    | `%y` | năm , dạng ngắn (2 số cuối) | `19` |
    | `%Y` | năm , dạng đủ | `2019` |
    | `%H` | giờ , từ `00-23` | `12` |
    | `%I` | giờ , từ `00-12` | `11` |
    | `%p` | AM/PM | `AM` |
    | `%M` | phút , từ `00-59` | `35` |
    | `%S` | giây , từ `00-59` | `35` |
    | `%f` | miligiây , từ `000000-999999` | `142123` |
    | `%z` | giá trị `utc` | `+0100` |
    | `%Z` | TimeZone | `CST` |
    | `%j` | ngày trong năm , từ `00-366` | `350` |
    | `%U` | số tuần trong năm , chủ nhật là ngày đầu tuần , từ `00-53` | `50` |
    | `%W` | số tuần trong năm , thứ 2 là ngày đầu tuần , từ `00-50` | `50` |
    | `%c` | ngày giờ địa phương | `Fri Oct 4 01:37:00 2019` |
    | `%x` | ngày địa phương | `10/04/19` |
    | `%X` | giờ địa phương | `01:37:00` |
    | `%%` | ký tự `%` | `%` |

- **VD :** 
    ```py
    # strftime_test.py
    import datetime
    x = datetime.datetime.now()
    print(x.strftime("%B"))              # In ra tháng dạng đủ
    print(x.strftime("%a"))              # In ra thứ dạng ngắn
    ```
    => Output :
    ```
    October
    Fri
    ```