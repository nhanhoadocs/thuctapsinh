# Linux boot process

- Có 6 giai đoạn của một quy trình khởi động Linux .

![](https://www.linuxnix.com/wp-content/uploads/2013/04/Linux-Booting-process.png)

**1. Bios**
-  Nó tìm bộ tải khởi động trong đĩa mềm, cd-rom hoặc ổ cứng
-  Thực hiện việc kiểm tra tính toàn vẹn hệ thống.
-  tải và thực hiện chương trình bộ tải khởi động.
-  BIOS tải và thực thi bộ tải khởi động MBR.

**2. MBR (Master Boot Record).**
- Nó nằm trong khu vực 1 của đĩa khởi động. Điển hình là được lưu ở trong folder /dev/hda hoặc /dev/sda
- MBR có kích thước nhỏ hơn 512 byte. Điều này có ba thành phần:

   **1. thông tin bộ tải khởi động chính ( 446 byte ).**
- cung cấp thông tin về trình tải khởi động và chi tiết vị trí của thông bin bộ tải khởi động thực tế trên đĩa cứng   
   **2. thông tin bảng phân vùng ( 64 byte ).**
- MBR chứa 64 byte dữ liệu lưu trữ thông tin bảng phân vùng.
- Chẳng hạn như bắt đầu và kết thúc của mỗi phân vùng, kích thước của phân vùng, loại phân vùng.
- Ổ cứng chỉ hỗ trợ 4 phân vùng, điều này là do giới hạn của thông tin trong MBR. Để một phân vùng đại diện cho MBR, nó cần 16 byte không gian trong đó vì vậy nhiều nhất chúng ta sẽ nhận được 4 phân vùng.

   **3. kiểm tra xác thực MBR  ( 2 byte cuối ).**
-  Nó sẽ sao lưu MBR của ta.  Nếu MBR bị hỏng, thì 2 byte xác thực này được sử dụng để lấy lại nó.

- **Khi CPU của ta biết tất cả các chi tiết này, nó sẽ cố gắng phân tích chúng và đọc phần đầu tiên của MBR để tải Giai đoạn thứ 2 của quá trình khởi động.**

**3. GRUB (Grand Unified Bootloader).**
- Trong giai đoạn này GRUB (Grand Unified Bootloader) nằm trong 30 kilobyte đĩa cứng đầu tiên ngay sau MBR được nạp vào RAM để đọc cấu hình của nó và hiển thị menu khởi động GRUB.
- GRUB có nghiệm vụ sẽ tải kernel do người dùng chọn vào bộ nhớ và chuyển điều khiển sang kernel. Nếu người dùng không chọn HĐH, sau khi hết thời gian xác định, GRUB sẽ tải kernel mặc định trong bộ nhớ để khởi động nó.

**4. KERNEL (Hạt nhân).**
- Khi quyền điều khiển được trao cho kernel, phần trung tâm của tất cả các hệ điều hành và nó đóng vai trò trung gian trung gian của các thành phần phần cứng và phần mềm. Kernel sau khi được nạp vào RAM, nó luôn nằm trên RAM cho đến khi máy bị tắt. Khi Kernel khởi động, nó hoạt động, điều đầu tiên nó làm là thực thi quy trình INIT.

**5. INIT**.
- Quá trình INIT đọc /etc/inittab là bảng khởi tạo xác định bắt đầu các chương trình hệ thống. INIT sẽ bắt đầu mỗi lần Runlevel và bắt đầu thực thi các tập lệnh tương ứng với runlevel đó.
  -  Runlevel được biểu thị bằng các chữ số đơn và chúng có thể có giá trị từ 0 đến 6:
     - Runlevel 0: Tắt hệ thống.
     - Runlevel 1: Chế độ cứu hộ, người dùng đơn.
     - Runlevel 2: Đa người dùng, không có NFS.
     - Runlevel 3: Chế độ nhiều người dùng.
     - Runlevel 4: không sử dụng.
     - Runlevel 5: x11 (Nhiều người dùng, mạng được kích hoạt, chế độ đồ họa).
     - Runlevel 6: Khởi động lại hệ thống.
 
**6. USER PROMPT**
- Bước này đơn giản chỉ là cung cấp cho bạn lời nhắc đăng nhập vào hệ thống.


### Tổng kết.

0. Bật nguồn 
1. CPU nhảy lên BIOS 
2. BIOS chạy POST 
3. Tìm thiết bị có thể khởi động đầu tiên 
4. Tải và thực thi MBR 
5. Load OS 
6. Dấu nhắc người dùng.
