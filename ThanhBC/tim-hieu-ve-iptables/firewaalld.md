firewalld hoat  động khác với iptables 
- iptables sử fung chain và rules để kiểm soát
- firewalld sử dụng zone và các service dể kiểm soát, khi xác đinh zone và service thì nó từ tạo rules

firewalld có 2 chế độ
- runtime: khi sử dụng reboot lại câu lệnh không bị mất giống cấu hình iptables bằng sửa file( cấu hinh cứng)
- permanent: khi reboot câu lệnh sẽ mất giống cấu hình iptables command.( cấu hinh mềm)git