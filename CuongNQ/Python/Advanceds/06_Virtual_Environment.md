# Virtual Environment
## **1) Giới thiệu**
- `virtualenv` là một công cụ được sử dụng để tạo ra các môi trường chạy **Python** cô lập ( hay các **Virtual Environment** ) .
- Mỗi môi trường sẽ có các thư mục cài đặt riêng và môi trường chạy riêng . Chúng không chia sẻ môi trường với nhau .<br>
=> Rất hữu ích cho các ứng dụng yêu cầu nhiều môi trường riêng biệt trên cùng một server .
- Yêu cầu trước cài đặt `virtualenv` :
    - **Python3**
    - **PIP**
## **2) Cài đặt `virtualenv`**
```
$ sudo pip install virtualenv
```
```
Collecting virtualenv
  Downloading https://files.pythonhosted.org/packages/8b/12/8d4f45b8962b03ac9efefe5ed5053f6b29334d83e438b4fe379d21c0cb8e/virtualenv-16.7.5-py2.py3-none-any.whl (3.3MB)
     |████████████████████████████████| 3.3MB 4.0MB/s 
Installing collected packages: virtualenv
Successfully installed virtualenv-16.7.5
```
## **3) Tạo virtual environment**
- Sử dụng lệnh sau để tạo **virtual environment** :
    ```
    $ virtualenv [project_name]
    ```
- `virtualenv` sẽ tạo ra một thư mục có tên là `project_name` tại thư mục hiện hành chứa tất cả những gì cần thiết , gồm các thư mục sau :
    - `bin` : 

        <img src=https://i.imgur.com/mL6GHXh.png>
    - `include` :

        <img src=https://i.imgur.com/aKLbMhc.png>
    - `lib` :

        <img src=https://i.imgur.com/tPNldBO.png> 
- Nếu trên server có nhiều phiên bản **Python** ( `2.x`, `3.x` ) , hoàn toàn có thể khởi tạo **Virtual Environment** với một phiên bản chỉ định :
    ```
    $ virtualenv -p /usr/bin/pythonx.x [project_name]
    ```
- Nếu muốn tạo 1 `virtualenv` rỗng và thiết lập mới hoàn toàn các nội dung bên trong , sử dụng lệnh :
    ```
    $ virtualenv --no-site-packages [project_name]
    ```
- Xóa **virtual environment** : tương ứng với việc xóa thư mục `project_name` :
    ```
    $ rm -rf project_name/
## **4) Sử dụng `virtualenv`**
- Đứng tại thư mục chứa folder `project_name` , sử dụng lệnh :
    ```
    $ source [project_name]/bin/activate
    ```
- Tên của **Virtual Environment** sẽ xuất hiện ở phía trước command prompt , cho thấy **Python** đang sử dụng **virtual environment**. Từ đây tất cả những **packages** được cài đặt mới sẽ nằm trong thư mục `project_name` .

    <img src=https://i.imgur.com/HPYyqNq.png>

- Thoát khỏi **virtual environment** , dùng lệnh :
    ```
    $ deactivate
    ```