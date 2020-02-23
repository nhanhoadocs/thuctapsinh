# Chapter 3. Scaling to Multiple Hosts
- Có thể chỉ định máy chủ qua cmdline nhưng việc này chỉ làm được khi chạy số lượng ít máy

- > Không làm được khi số lượng máy nhiều

Chương này về:
- inventories
- host/group variables
- loops

# 1. Làm việc với inventory file
- inventory file tuân theo định dạng INI
- nói cho Ansible biết danh sách các remote host mà nó có thể thử "động tới"
- Truyền inventory file cho ansible -> ansible search trong inventory các host/group sẽ được thực hiện task (define trong PB) - > Chạy task

- Thêm tùy chọn **-i** hoặc **--inventory-file** theo sau là đường dẫn đến inventory file để truyền inventory file cho ansible trên cmdline

```
#ansible-playbook -i /etc/ansible/hosts web.yml
```

**NOTE**: Nếu viết path của inventory file thì không thêm dấu , như chương 2 đã đề cập. Nếu thêm ansible sẽ có đó là 1 inventory list.

=================
## 1.1 Inventory file cơ bản
**Mặc định inventory file**: /etc/ansible/hosts
- Có thể thêm FQDN hay IP
```
[centos7_webserver]
Node_CentOs7_1 ansible_host=192.168.91.171 ansible_port=22 ansible_user=root

Node_CentOs7_2 ansible_host=192.168.91.172 ansible_port=22 ansible_user=root

[ubuntu16]
Node_Ubuntu16 ansible_host=192.168.91.173 ansible_port=22 ansible_user=khanh
```

## 1.2 Group trong inventory file
Nhóm các máy chủ dựa trên vai trò
```
[centos7_webserver]
Node_CentOs7_1 ansible_host=192.168.91.171 ansible_port=22 ansible_user=root

Node_CentOs7_2 ansible_host=192.168.91.172 ansible_port=22 ansible_user=root

[ubuntu16]
Node_Ubuntu16 ansible_host=192.168.91.173 ansible_port=22 ansible_user=khanh
```
Bình thường file yaml ta viết
```
---
- hosts: all
```

Giờ ta có thể viết lại thành
```
---
- hosts: centos7_webserver
```
Để chỉ định rõ ràng group sẽ chạy tasks

## 1.3 Regular expression trong inventory file
Nêu số lượng máy chủ trong 1 group trở nên lớn -> việc viết ra sẽ dài dòng

Ta có thể dùng cách sau:
```
[webserver]
ws[01:20].fale.io

[database]
db01.fale.io

```

# 2. Làm việc với biến (variable)
Trong Ansible, ta có thể define biến theo nhiều cách
- file biến trong 1 play book
- passing từ cmd sử dụng -e/--extra-vars
- passing qua 1 inventory file

Ta có thể define biến trong 1 inventory file trên cơ cở của từng host, từng group hoặc tạo 1 file biến trong folder - nơi inventory file của ta tồn tại

## 2.1 Host variable
Các biến khai báo trên cơ sở từng host
```
[webserver]
ws01.fale.io domainname=example1.fale.io
ws02.fale.io domainname=example2.fale.io
[database]
db01.fale.io
```

Như vậy tất cả playbook chạy trên group web server đều chó thể tham chiếu đến biến domainname (cùng trên biến nhưng giá trị khác nhau với mỗi host)

## 2.2 Group variable
Set biến cho cả group webserver
```
[webserver]
ws01.fale.io
ws02.fale.io

[webserver:vars]
https_enabled=True

[database]
db01.fale.io
```

Set biến cho cả group centos7
![Imgur](https://i.imgur.com/MMyjYJY.png)

**NOTE** : Các **host variable** sẽ ghi đè lên các **group variable** trong trường hợp cùng 1 biến được khai báo


## 2.3 Variable file (File biến) (? tách bị lỗi)
Khi có quá nhiều biến cần khai báo cho từng host và group. Sẽ dẫn đến việc rối, khó đọc. 
--> Ta có thể dời chúng qua các file cụ thể
- Với các biến mức host, ta tạo 1 file có tên giống như máy chủ trong thư mục host_vars
- Với các biến mức group, ta tạo 1 file có tên giống như máy chủ trong thư mục group_vars

```
Tạo file host_vars/ws01.fale.io với nội dung:
domainname=example1.fale.io

Tạo file host_vars/ws01.fale.io với nội dung:
domainname=example2.fale.io

Muốn tách group variable 
Tạo file host_vars/ws01.fale.io với nội dung:
https_enabled=True
```
**NOTE**
Các biến inventory tuân theo hệ thống phân cấp
- Cao nhất là các common variable file  
-> sẽ ghi đè bất cứ host var, group var và inventory var file
- Sau đó đến host var sẽ ghi đè bất cứ group var
- Cuối cùng group var sẽ ghi đè inventory var file

**NOTE**: tách bị lỗi 
```
ERROR! failed to combine variables, expected dicts but got a 'dict' and a 'AnsibleUnicode':
{}
"https_enabled=True"
```
## 2.4 Ghi đè tham sô cấu hình bằng inventory file
Có thể ghi đè 1 số tham số cấu hình của Ansible qua inventory file. (các tham số cấu hình đặt trong ansible.cfg)

```
[centos7]
Node_CentOs7 ansible_host=192.168.91.171 ansible_port=22 ansible_user=root

[ubuntu16]
Node_Ubuntu16 ansible_host=192.168.91.172 ansible_port=22 ansible_user=khanh

```

Danh sách các tham số ta có thể ghi đè thông qua inventory file:

• ansible_user : Tham số này được sử dụng để ghi đè người dùng được sử dụng để liên lạc với máy chủ từ xa. Đôi khi, một máy nhất định cần một người dùng khác, trong những trường hợp đó, biến này sẽ giúp bạn.

• ansible_port : Tham số này sẽ ghi đè cổng SSH mặc định bằng cổng do người dùng chỉ định . Đôi khi sysadmin chọn chạy SSH trên một cổng không chuẩn. Trong trường hợp này, bạn sẽ cần hướng dẫn cho Ansible về sự thay đổi.

• ansible_host : Tham số này được sử dụng để ghi đè máy chủ cho bí danh.

• ansible_connection : Điều này chỉ định loại kết nối đến máy chủ từ xa. Các giá trị là SSH, Paramiko hoặc cục bộ

• ansible_private_key_file : Tham số này sẽ ghi đè khóa riêng được sử dụng cho SSH; điều này sẽ hữu ích nếu bạn muốn sử dụng các khóa cụ thể cho một máy chủ cụ thể. Trường hợp sử dụng phổ
biến là nếu bạn có máy chủ trải rộng trên nhiều trung tâm dữ liệu, nhiều vùng AWS hoặc các loại ứng dụng khác nhau. Khóa riêng có khả năng khác nhau trong các tình huống như vậy.

• ansible__type : Theo mặc định, Ansible sử dụng sh shell ; bạn có thể ghi đè lên điều này bằng tham số ansible_shell_type . Thay đổi điều này thành csh , ksh , v.v. sẽ khiến Ansible sử dụng các lệnh của shell đó.

## 2.5 Làm việc với dynamic inventory ( SKIP qua vì chưa cần dùng tới)
1 số môi trường, ta có các machine được tạo, phá hủy tự động (Cloud) 
-> danh sách máy chủ thay đổi nhanh 
-> hosts file trở nên rối loạn 
-> Sử dụng dynamic inventory để giải quyết

Ý tưởng:
- Không đọc hosts file
- Thực thi 1 script -> trả về list các host cho Ansible ở định dạng JSON -> cho phép truy vấn đến Cloud Provider (AWS, Digital Ocean)

# 3. Làm việc với các vòng lặp
- Giảm thiểu các thao tác lặp lại
ví dụ:
```
---
- hosts: centos7
  remote_user: root
  tasks:
  - name: Ensure the HTTPd package is installed
    yum:
      name: httpd
      state: present
    become: True
  - name: Ensure the HTTPd service is enabled and running
    service:
      name: httpd
      state: started
      enabled: True
    become: True
  - name: Ensure HTTP can pass the firewall
    firewalld:
      service: http
      state: enabled
      permanent: True
      immediate: True
    become: True
  - name: Ensure HTTPS can pass the firewall
    firewalld:
      service: https
      state: enabled
      permanent: True
      immediate: True
    become: True
```
## 3.1 Lặp tiêu chuẩn (with_items)
```
---
- hosts: centos7
  remote_user: root
  tasks:
  - name: Ensure the HTTPd package is installed
    yum:
      name: httpd
      state: present
    become: True
  - name: Ensure the HTTPd service is enabled and running
    service:
      name: httpd
      state: started
      enabled: True
    become: True
  - name: Ensure HTTP and HTTPS can pass the firewall
    firewalld:
      service: '{{item}}'
      state: enabled
      permanent: True
      immediate: True
    become: True
    with_items:
    - http
    - https  
```

Khi dùng cùng 1 module, cùng các thông số cấu hình cho nhiều đối tượng (yum, service, firewalld,.....)
## 3.2 Vòng lặp lồng nhau (with_nested)
Có những trường hợp ta phải lặp lại tất cả yếu tố của 1 list với tất cả item từ 1 list khác.

Ví dụ: tạo nhiều folder theo nhiều đường dẫn

```
---
- hosts: centos7
  remote_user: root
  vars:
    users:
    - alice
    - bob
    folders:
    - mail
    - public_html
  tasks:
  - name: Ensure user exist
    user:
      name:'{{item}}'
    become: True
    with_items:
    - '{{users}}'
  - name: Ensure the folder exist
    file:
     path: 'home/{{item.0}}/{{item.1}}'
     state: directory
    become: True
    with_nested:
    - '{{users}}'
    - '{{folders}}'
```

## 3.3 Vòng lặp Filelobs  (with_filelobs)
- Làm các hành động với các file trong 1 thư mục nhất định

Ví dụ : sao chép nhiều file có tên tương tự từ thư mục này qua thư mục khác (with_filelobs.yml)

```
---
- hosts: centos7
  remote_user: root
  tasks:
  - name: Ensure the folder /tmp/iproute2 is present
  file:
    dest: '/tmp/iproute2'
    state: directory
    become: True
  - name: Copy files that start with rt to the tmp folder
    copy:
      src: '{{ item }}'
      dest: '/tmp/iproute2'
      remote_src: True
    become: True
    with_fileglob:
    - '/etc/iproute2/rt_*'
```
PB trên sẽ tạo folder iproute2 trong /tmp nếu nó chưa tồn tại (thậm chí tạo cả /tmp nếu nó chưa tồn tại luôn)

Tìm kiếm trong /etc/iproute2  trên remote_machine (chứ không phải trên máy chủ) những file bắt đầu bằng rt_ và copy vào folder mới tạo phía trên

## 3.4 Vòng lặp số nguyên (with_resultence)

Nhiều trường hợp ta phải lặp lại các số nguyên

Ví dụ: tạo 10 thư mục WebXY , XY chạy từ 01 đến 10
Tạo PB (with_resultence.yml)
```
---
- hosts: centos7
  remote_user: root
  tasks:
  - name: Create the folders /tmp/dirXY with XY from 1 to 10
    file:
      dest: '/tmp/dir{{ item }}'
      state: directory
    with_sequence: start=1 end=10
    become: True
```

# 4. Tổng kết
- Có được 1 số khái niệm giúp scale (mở rộng) cơ sở hạ tầng ra ngoài single node.
- Làm việc với các inventory
- Các host variable, group variable
- Các loại vòng lặp