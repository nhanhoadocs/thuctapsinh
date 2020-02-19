# Tìm hiểu Command trong Iptables

## I. Tạo rule trong iptables
### 1. Cấu trúc câu lệnh cơ bản
```
iptables [-t table] command [match] [target/jump]
```

**Lưu ý**:
- Mặc định iptables sử dụng bảng filter để thực hiện tất cả command
- `command` luôn phải đặt ở đầu bởi nó sẽ cho iptables biết cần phải làm gì. Ví dụ như `insert` hoặc `add rule` vào chain
- `match` là chỗ để bạn gửi tới kernel các đặc tính chi tiết của gói tin, cái làm nó khác biệt với những packets còn lại
- Nếu tất cả các `match` có trong packet, ta sẽ ra lệnh cho kernel thực thi hành động với nó, đó là `target`

### 2. Command
|Command|Mô tả|Ví dụ|
|-------|-----|-----|
|`-A`, `--append`|Chèn rule vào cuối chain hay nói cách khác là đây sẽ là rule được check cuối cùng trong chain này tới khi bạn thêm chain khác vào|`iptables -A INPUT ...`|
|`-D`, `--delete`|Xóa rule trong chain, được thực hiện bằng 2 cách: điền toàn bộ rule (như ở ví dụ) hoặc chỉ định số thứ tự của rule bắt đầu từ 1|`iptables -D INPUT --dport 80 -j DROP`, `iptables -D INPUT 1`|
|`-R`, `--replace`|Thay thế entry cũ dựa theo số thứ tự dòng|`iptables -R INPUT 1 -s 192.168.0.1 -j DROP`|
|`-I`, `--insert`|Chèn rule vào chain theo số thứ tự dòng|`iptables -I INPUT 1 --dport 80 -j ACCEPT`|
|`-L`, `--list`|Hiển thị toàn bộ rules ở chain hoặc table chỉ định|`iptables -L INPUT`|
|`-F`, `--flush`|Xóa toàn bộ rule ở chain chỉ định|`iptables -F INPUT`|
|`-Z`, `--zero`|Xóa toàn bộ counters ở chain chỉ định hoặc tất cả chain|`iptables -Z INPUT`|
|`-N`, `--new-chain`|Tạo mới một chain|`iptables -N allowed`|
|`-X`, `--delete-chain`|Xóa chain chỉ định khỏi table|`iptables -X allowed`|
|`-P`, `--policy`|Chỉ định policy mặc định nếu packet không match với rule nào trong chain. Hai tùy chọn được cho phép đó là ACCEPT và DROP|`iptables -P INPUT DROP`|
|`-E`, `--rename-chain`|Thay đổi tên table, lưu ý nó không làm thay đổi cách table hoạt động|`iptables -E allowed disallowed`|