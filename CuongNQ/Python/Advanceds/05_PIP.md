# PIP
## **1) Khái niệm**
- **PIP** là trình quản lý , cài đặt các **package** , **module** bất kỳ tùy ý cho **Python** .
- Từ phiên bản `3.4` trở đi , **PIP** đã được cài đặt sẵn trong **Python** .
- Trang chủ : https://pypi.org/project/pip/
- Các packages có thể cài qua `pip` : https://pypi.org/
## **2) Cài đặt PIP**
### **2.1) Cài đặt trên Ubuntu**
#### **2.1.1) Cài đặt từ `apt` ( phiên bản thấp )**
- **B1 :** Update các gói phần mềm hệ thống :
    ```
    $ sudo apt-get update
    ```
- **B2 :** Tải về `pip` ( dành cho `python3` ) :
    ```
    $ sudo apt install -y python3-pip
    ```
- **B3 :** Kiểm tra phiên bản `pip` vừa cài đặt :
    ```
    $ pip3 --version     (hoặc pip3 -V)
    ```
    <img src=https://i.imgur.com/PDncPqL.png>

#### **2.1.2) Cài đặt từ source ( phiên bản mới nhất )**
- **B1 :** Tải về file `get-pip.py` :
    ```
    $ sudo apt install -y curl
    $ curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    ```
- **B2 :** Chạy file `get-pip.py` :
    ```
    $ sudo python3 get-pip.py
    ```
- **B3 :** Kiểm tra lại phiên bản `pip` vừa cài đặt :
    ```
    $ pip --version     (hoặc pip -V)
    ```
    <img src=https://i.imgur.com/af966NV.png>
### **2.2) Cài đặt trên CentOS**
#### **2.2.1) Cài đặt từ `yum` ( phiên bản thấp )**
- **B1 :** Update các gói phần mềm hệ thống :
    ```
    # yum -y update
    ```
- **B2 :** Tải về `pip` ( dành cho `python3` ) :
    ```
    # yum -y install python3-pip
    ```
- **B3 :** Kiểm tra phiên bản `pip` vừa cài đặt :
    ```
    # pip3 --version     (hoặc pip3 -V)
    ```
    <img src=https://i.imgur.com/bXWKF8V.png>

#### **2.2.2) Cài đặt từ source ( phiên bản mới nhất )**
- **B1 :** Tải về file `get-pip.py` :
    ```
    # curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    ```
- **B2 :** Chạy file `get-pip.py` :
    ```
    # python3 get-pip.py
    ```
- **B3 :** Kiểm tra lại phiên bản `pip` vừa cài đặt :
    ```
    # pip --version     (hoặc pip -V)
    ```
    <img src=https://i.imgur.com/COYGf1l.png>
### **2.3) Cài đặt trên Windows**
- Mặc định , khi cài `python3` , `pip` đã được cài luôn trên Windows :

    <img src=https://i.imgur.com/OIMFCfT.png>

## **3) Các thao tác với PIP**
### **3.1) Cài đặt các packages**
```
$ pip install <package-name>
```
### **3.2) Gỡ cài đặt packages**
```
$ pip uninstall <package-name>
```
### **3.3) Upgrade package**
- Hiển thị các package lỗi thời ( đã có phiên bản mới ) :
    ```
    $ pip list --outdated
    ```
- Kết quả trả về tên package lỗi thời , tiến hành upgrade :
    ```
    $ pip install --upgrade <package_name>
    ```
### **3.4) Liệt kê các packages đã được cài đặt qua `pip`**
```
$ pip list
```
```
Package                Version            
---------------------- -------------------
apturl                 0.5.2              
asn1crypto             0.24.0             
astroid                2.3.1              
Brlapi                 0.6.6              
certifi                2018.1.18          
chardet                3.0.4              
command-not-found      0.3                
cryptography           2.1.4              
cupshelpers            1.0                
defer                  1.0.6              
distro-info            0.18ubuntu0.18.04.1
httplib2               0.9.2              
.......                ........
```