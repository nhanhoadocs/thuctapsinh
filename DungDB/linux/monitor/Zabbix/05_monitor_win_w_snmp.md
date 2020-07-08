# Giám sát Windows Server sử dụng SMNP

Thao tác trên Windows server 2019

Thêm tính năng SNMP cho host này

![Imgur](https://i.imgur.com/sDLzvs7.png)

![Imgur](https://i.imgur.com/tfEnPXM.png)

![Imgur](https://i.imgur.com/fKMVVAr.png)

![Imgur](https://i.imgur.com/eRVmx48.png)

Kiểm tra trong service. Mở task manager tìm service SNMP. Chuột phải -> open services

![Imgur](https://i.imgur.com/FgnhE1H.png)

Tìm dịch vụ SNMP, Properties 

![Imgur](https://i.imgur.com/P6BoisC.png)

Sửa phần Agent

![Imgur](https://i.imgur.com/fG5bspR.png)

Sửa phần Security

![Imgur](https://i.imgur.com/hqiXkis.png)

Chọn OK

Sang zabbix server kiểm tra

    yum install net-snmp-utils -y

    snmpwalk -v2c -c <CONTACT_NAME> <IP_WINDOWS_SERVER>

Ví dụ cụ thể trong bài sẽ là

    snmpwalk -v2c -c nhanhoa 10.10.10.118

Có kết quả trả về là thành công

Tiếp theo, thêm host trên web GUI

![Imgur](https://i.imgur.com/eKBZjVF.png)

Điền thông tin host. **Lưu ý** ở đây dùng SNMP interface

![Imgur](https://i.imgur.com/RoLMCBo.png)

Sau đó chọn template

![Imgur](https://i.imgur.com/0WL7jDC.png)

Tiếp theo sang tab Macro chọn như hình dưới

![Imgur](https://i.imgur.com/pXntDmH.png)

Sau đó chọn Add

Chờ 1 phút. Khi thành công thì ô SNMP sẽ hiển thị màu xanh như trong hình dưới. 

![Imgur](https://i.imgur.com/khpEacE.png)

Nếu cần thiết có thể restart dịch vụ SNMP và SNMP Trap trên host tại task manager.