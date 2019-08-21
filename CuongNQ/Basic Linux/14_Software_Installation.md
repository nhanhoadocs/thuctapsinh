# Software Installation
## **1) Cài đặt từ `rpm`**
- **RedHat Package Manager ( RPM )** là 1 hệ thống quản lý những package được Linux hỗ trợ cho người dùng .
- Đặc tính của **RPM** :
    - Khả năng nâng cấp phần mềm
    - Truy vấn thông tin hiệu quả
- Package được đóng gói có dạng : <br>&nbsp;&nbsp;&nbsp;&nbsp;`<Tên_package>-<phiên_bản>.<số_hiệu>.<kiến trúc>.rpm`<br>**VD :** `teamviewer-14.2.8352.x86_64.rpm`
- Cú pháp lệnh `rpm` :
    ```
    # rpm [options] <package/package_name>
    ```
    - **Options** :
        - `-i` : cài đặt
        - `-e` : xóa
        - `-u` : update
        - `-qa` : tìm phần mềm ( đã được cài đặt trên hệ thống )
        - `-ql` : tìm nơi cài đặt
        - `--nodeps` : không kiểm tra các gói phụ thuộc<br>
    => Cách cài đặt gói `.rpm` :
        ```
        # rpm -ivh <package>
        ```
- Một số trường hợp lỗi :
    - Tập tin đã được cài : `package is already installed`
    - Xung đột tập tin : `...package...conflicts with...`
    - Phụ thuộc vào package khác : `failed dependencies`<br><br>
    <img src=https://i.imgur.com/L2mMnmS.png>
- **VD1 :** Cài đặt **Teamviewer 14** :
    ```
    # rpm -ivh teamviewer-14.2.8352.x86_64.rpm
    ```
- **VD2 :** Tìm nơi cài đặt phần mềm **Teamviewer 14**:
    ```
    # rpm -qa | grep teamviewer
    ```
- **VD3 :** Xóa phần mềm **Teamviewer 14** :
    ```
    # rpm -e teamviewer-14.2.8352.x86_64.rpm
    ```
## **2) Cài đặt từ `yum`**
- **YUM ( yellowdog updater modifier )** : cài đặt , xóa , truy vấn các phần mềm từ các **repository** trên Internet hay Local một cách tự động ( **repository** ) là nơi lưu trữ các phần mềm trên Internet ) .
- Với phương thức này , phần mềm sẽ tự động cài đặt , tự động cập nhật phần mềm .
- `yum` phải chạy dưới quyền của user `root` .
- Cú pháp lệnh `yum` :
    ```
    # yum [options] <name/group_of_softwares>
    ```
    - **Options** :
        - `-y` : thực hiện theo lệnh mà không cần hỏi
        - `install` : cài đặt phần mềm
        - `remove` : xóa phần mềm
        - `list installed` : xem các phần mềm đã cài
        - `groupinstall` : cài 1 nhóm phần mềm
        - `groupremove` : gỡ bỏ 1 nhóm phần mềm
        - `clean` : xóa các cache , plugin , meta-data...
        - `search` : tìm kiếm phần mềm trên các repo
        - `update` : 
        - `upgrade` ;
- Lệnh kiểm tra các repo có sẵn :
    ```
    # cd /etc/yum.repos.d/
    # ls
    ```
    <img src=https://i.imgur.com/iU4xubQ.png>
- **VD1 :** Tìm package **telnet** :
    ```
    # yum search telnet
    ```
- **VD2 :** Chọn gói tin muốn cài và cài đặt **telnet** :
    ```
    # yum install telnet.x86_64
    ```
## **3) Cài đặt từ `dnf`**
## **4) Cài đặt từ source**
