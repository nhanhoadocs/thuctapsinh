# Add agent cho host và thêm host vào checkmk để giám sát

## Đối với Centos 7

Vào trang checkmk -> monitor agent 

![Imgur](https://i.imgur.com/EeuJIn1.png)

Copy đường dẫn `.rpm`

![Imgur](https://i.imgur.com/FZIZ7eD.png)

SSH vào host Centos 7 cần add agent

Tắt selinux

    sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux
    sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
    setenforce 0

Cài đặt gói wget

    yum install wget -y 

Dùng gói wget download agent đã chọn ở bước trên

    wget http://172.16.4.251/monitoring/check_mk/agents/check-mk-agent-1.6.0p13-1.noarch.rpm

Cấp quyền thực thi cho file vừa download về

    chmod +x check-mk-agent-1.6.0p13-1.noarch.rpm

Cài đặt agent

    rpm -ivh check-mk-agent-1.6.0p13-1.noarch.rpm

Cài đặt xinetd

    yum install xinetd -y

Khởi động xinetd

    systemctl start xinetd
    systemctl enable xinetd

Cài đặt gói `net-tools` để kiểm tra dễ dàng hơn

    yum install net-tools -y

Mở port trên client để có thể giao tiếp với check_mk server

    vi /etc/xinetd.d/check_mk

Sửa các thông số sau

    only_from      = 172.16.4.251
    disable        = no
    port           = 6556

Kiểm tra port mặc định của check_mk sử dụng để giám sát được chưa

    [root@kvm124 ~]# netstat -npl | grep 6556
    tcp        0      0 0.0.0.0:6556            0.0.0.0:*               LISTEN      1/systemd

Mở port trên firewall

    firewall-cmd --add-port=6556/tcp --permanent
    firewall-cmd --reload

Tiếp theo vào trang checkmk để thêm host vào để giám sát

![Imgur](https://i.imgur.com/FB2SSHF.png)

Đặt tên cho host và thêm IP của host đó vào

![Imgur](https://i.imgur.com/nqwJYfD.png)

Lưu lại và đi đến phần dịch vụ

![Imgur](https://i.imgur.com/wjsJvAQ.png)

Nó sẽ tự scan dịch vụ cho mình. Nếu không thì bấm nút full scan. Sau khi xong thì vào phần change.

![Imgur](https://i.imgur.com/xzcJ5kW.png)


Ở đây chúng ta sẽ đi vào việc quyết định giám sát những service nào. Nếu muốn giám sát tất cả những service mà check_mk phát hiện được hãy chọn monitor không thì hãy chọn disable. Còn nếu muốn loại bỏ hay giám sát 1 service riêng lẻ nào đó hãy chọn dấu x hoặc tick

![Imgur](https://i.imgur.com/zFrscGd.png)

Kích hoạt xong sẽ thấy giao diện sau

![Imgur](https://i.imgur.com/46lycyI.png)

Để xem các host đang được giám sat thì làm theo các bước dưới đây

![Imgur](https://i.imgur.com/g34G0xq.png)

## Đối với ubuntu 18

    apt-get install -y wget

Sao chép địa chỉ liên kết agent

![Imgur](https://i.imgur.com/PI4mTCO.png)

![Imgur](https://i.imgur.com/Vr7U9wh.png)

Tải và cài đặt agent

    wget http://172.16.4.251/monitoring/check_mk/agents/check-mk-agent_1.6.0p13-1_all.deb

    dpkg -i check-mk-agent_1.6.0p13-1_all.deb

Cài đặt xinetd

    apt-get install -y xinetd
    systemctl start xinetd
    systemctl enable xinetd

    vi /etc/xinetd.d/check_mk

Sửa các thông số sau

    #only_from      = 192.168.80.222
    disable        = no
    port           = 6556

Khởi động lại dịch vụ

    systemctl restart xinetd

Kiểm tra

    root@hostu18test:~# check_mk_agent | head
    <<<check_mk>>>
    Version: 1.6.0p13
    AgentOS: linux
    Hostname: hostu18test
    AgentDirectory: /etc/check_mk
    DataDirectory: /var/lib/check_mk_agent
    SpoolDirectory: /var/lib/check_mk_agent/spool
    PluginsDirectory: /usr/lib/check_mk_agent/plugins
    LocalDirectory: /usr/lib/check_mk_agent/local
    <<<df>>>
    root@hostu18test:~#

Mở port

    ufw allow 6556/tcp
    ufw reload

Thêm host tương tự như với Centos 7

## Đối với Windows 

Xem https://github.com/datkk06/meditech-ghichep-omd/blob/master/docs/2.Install-agent.md#3

Ví dụ với windows server 2019

Remote vào host cần cài agent

![Imgur](https://i.imgur.com/5X2rK2j.png)

Copy link agent

Vào host windows mở trình duyệt và dán link đã copy vào.

Tải file đó về và cài đặt.

Sau khi cài xong vào task manager kiểm tra xem dịch vụ đã chạy chưa.

![Imgur](https://i.imgur.com/bXVpxma.png)

Mở cmd bằng quyền admin và chạy 2 lệnh sau

    netsh advfirewall firewall add rule name="Check_MK Agent 6556 IN" dir=in action=allow protocol=TCP localport=6556
    netsh advfirewall firewall add rule name="Check_MK Agent 6556 OUT" dir=out action=allow protocol=TCP localport=6556

Sau đó add host tương tự như đối với Centos 7

## Kết quả

![Imgur](https://i.imgur.com/GE7pIgv.png)