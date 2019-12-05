# Cài đặt Python `3.7`
## **1) Cài đặt trên Windows**
- **B1 :** Download **Python for Windows** tại link [trang chủ](https://www.python.org/downloads/)  :

    <img src=https://i.imgur.com/cwP2d5W.png>

- **B2 :** Click vào file `python-3.7.4-amd64.exe` vừa tải về :

    <img src=https://i.imgur.com/y77ZRm7.png>

- **B3 :** Quá trình cài đặt diễn ra :

    <img src=https://i.imgur.com/36f8nOb.png>

- **B4 :** Quá trình cài đặt thành công , chọn ***Close*** :

    <img src=https://i.imgur.com/QVPjtdT.png>

    Giao diện phần mềm sau khi cài đặt :
    
    <img src=https://i.imgur.com/Qf31BP5.png>

## **2) Cài đặt trên CentOS/RHEL**
- Mặc định , khi cài đặt qua `yum` , chỉ có phiên bản `2.7.5` được cài đặt :

    <img src=https://i.imgur.com/ypXnEWR.png>

### **2.1) Cài đặt từ repo**
- **B1 :** Update các gói phần mềm :
    ```
    # yum -y update
    ```
- **B2 :** Cài đặt repo `ius` :
    ```
    # yum install -y https://centos7.iuscommunity.org/ius-release.rpm
    ```
- **B3 :** Cập nhật lại thông tin các repo :
    ```
    # yum repolist
    ```
- **B4 :** Cài đặt **Python** và các gói phần mềm phụ thuộc ( **add-ons** ) :
    ```
    # yum install -y python37u python37u-libs python37u-devel python37u-pip
    ```
- **B5 :** Sau khi cài đặt thành công , kiểm tra phiên bản **Python** vừa cài đặt :
    ```
    # python3.7 -V
    ```
### **2.2) Biên dịch từ source**
- **B1 :** Cài đặt bộ phần mềm `Development Tools` :
    ```
    # yum groupinstall -y "Development Tools"
    ```
- **B2 :** Download phiên bản mới nhất của **Python** ( `3.7.4` ) từ trang chủ :
    ```
    # wget https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tar.xz
    ```
- **B3 :** Giải nén file :
    ```
    # tar -xvf Python-3.7.4.tar.xz
    ```
- **B4 :** Vào thư mục vừa giải nén , chạy script `configure` để thực hiện 1 vài bước kiểm tra các gói phần mềm phụ thuộc :
    ```
    # cd Python-3.7.4
    # ./configure --enable-optimizations
    ```
- **B5 :** Biên dịch file cài đặt :
    ```
    # make
    # make altinstall
    ```
- **B6 :** Sau khi cài đặt thành công , kiểm tra phiên bản **Python** vừa cài đặt :
    ```
    # python3.7 -V
    ```
## **3) Cài đặt trên Ubuntu/Debian**
- Mặc định , khi cài đặt qua `apt-get` , chỉ có phiên bản `2.7.5` được cài đặt :

    <img src=https://i.imgur.com/hp2rTVo.png>

### **3.1) Cài đặt từ repo**
- **B1 :** Update các gói phần mềm :
    ```
    $ sudo apt-get update
    $ sudo apt install software-properties-common
    ```
- **B2 :** Thêm deadsnakes PPA vào source list :
    ```
    $ sudo add-apt-repository ppa:deadsnakes/ppa
    ```
- **B3 :** Cài đặt `python 3.7` :
    ```
    $ sudo apt install python3.7
    ```
- **B4 :** Sau khi cài đặt thành công , kiểm tra phiên bản **Python** vừa cài đặt :
    ```
    $ python3.7 --version
    ```
### **3.2) Biên dịch từ source**
- **B1 :** Update các gói phần mềm :
    ```
    $ sudo apt-get update
    ```
- **B2 :** Cài đặt các gói cần thiết :
    ```
    $ sudo apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget
    ```
- **B3 :** Download phiên bản mới nhất của **Python** ( `3.7.4` ) từ trang chủ :
    ```
    $ wget https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tar.xz
    ```
- **B4 :** Giải nén file :
    ```
    $ tar -xvf Python-3.7.4.tar.xz
    ```
- **B5 :** Vào thư mục vừa giải nén , chạy script `configure` để thực hiện 1 vài bước kiểm tra các gói phần mềm phụ thuộc :
    ```
    $ cd Python-3.7.4
    $ ./configure --enable-optimizations
    ```
- **B6 :** Biên dịch file cài đặt :
    ```
    $ make
    $ sudo make altinstall
    ```
- **B7 :** Sau khi cài đặt thành công , kiểm tra phiên bản **Python** vừa cài đặt :
    ```
    $ python3.7 --version
    ```

