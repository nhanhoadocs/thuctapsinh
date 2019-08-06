# Linux boot process

- Có 6 giai đoạn của một quy trình khởi động Linux .

![](https://www.linuxnix.com/wp-content/uploads/2013/04/Linux-Booting-process.png)

**1. BIOS (Basic Input/Output System).**
- BIOS là viết tắt của Hệ thống đầu vào / đầu ra cơ bản
- Tìm kiếm, tải và thực hiện chương trình bộ tải khởi động.
- Nó tìm bộ tải khởi động trong đĩa mềm, cd-rom hoặc ổ cứng. Ta có thể nhấn một phím (thường là F12 hoặc F2, nhưng nó phụ thuộc vào hệ thống của bạn) trong quá trình khởi động BIOS để thay đổi trình tự khởi động.
- Thực hiện việc kiểm tra tính toàn vẹn hệ thống.
- Khi chương trình bộ tải khởi động được phát hiện và tải vào bộ nhớ, BIOS sẽ điều khiển nó.
Vì vậy, trong điều kiện đơn giản, BIOS tải và thực thi bộ tải khởi động MBR.

**2. MBR (Master Boot Record).**
- MBR là viết tắt của (bản ghi khởi động chính).
- Nó nằm trong khu vực 1 của đĩa khởi động. Điển hình là được lưu ở trong folder /dev/hda hoặc /dev/sda
- MBR có kích thước nhỏ hơn 512 byte. Điều này có ba thành phần:

   **1. thông tin bộ tải khởi động chính ( 446 byte ).**
   
   **2. thông tin bảng phân vùng ( 64 byte ).**
   
   **3. kiểm tra xác thực MBR  ( 2 byte cuối ).**

- **Thông tin bộ tải khởi động chính**: Thông tin này cung cấp thông tin về trình tải khởi động và chi tiết vị trí của thông bin bộ tải khởi động thực tế trên đĩa cứng. Điều này giúp ích cho CPU để tải giai đoạn thứ hai của Trình tải khởi động.
- **Thông tin bảng phân vùng**: MBR chứa 64 byte dữ liệu lưu trữ thông tin bảng phân vùng, chẳng hạn như bắt đầu và kết thúc của mỗi phân vùng, kích thước của phân vùng, loại phân vùng. Ổ cứng chỉ hỗ trợ 4 phân vùng, điều này là do giới hạn của thông tin trong MBR. Để một phân vùng đại diện cho MBR, nó cần 16 byte không gian trong đó vì vậy nhiều nhất chúng ta sẽ nhận được 4 phân vùng.
- **Kiểm tra xác thực MBR**: Nó sẽ sao lưu MBR của ta.  Nếu MBR bị hỏng, thì 2 byte xác thực này được sử dụng để lấy lại nó.
- Khi CPU của ta biết tất cả các chi tiết này, nó sẽ cố gắng phân tích chúng và đọc phần đầu tiên của MBR để tải Giai đoạn thứ hai của Trình tải khởi động.

**3. GRUB (Grand Unified Bootloader).**
- Grand Unified Bootloader - Bộ khởi động thống nhất.
- Khi Bootloader của giai đoạn 1 hoàn thành và nó có thể tìm thấy vị trí bootloader thực tế, bootloader của giai đoạn 1 bắt đầu giai đoạn thứ hai bằng cách tải Bootloader vào bộ nhớ. Trong giai đoạn này GRUB (Grand Unified Bootloader) nằm trong 30 kilobyte đĩa cứng đầu tiên ngay sau MBR được nạp vào RAM để đọc cấu hình của nó và hiển thị menu khởi động GRUB (nơi người dùng có thể chỉ định thủ công các tham số khởi động) người dùng. GRUB có nghiệm vụ sẽ tải kernel do người dùng chọn vào bộ nhớ và chuyển điều khiển sang kernel. Nếu người dùng không chọn HĐH, sau khi hết thời gian xác định GRUB sẽ tải kernel mặc định trong bộ nhớ để khởi động nó.

**4. KERNEL (Hạt nhân).**
- Khi quyền điều khiển được trao cho kernel, phần trung tâm của tất cả các hệ điều hành và nó đóng vai trò trung gian trung gian của các thành phần phần cứng và phần mềm. Kernel sau khi được nạp vào RAM, nó luôn nằm trên RAM cho đến khi máy bị tắt. Khi Kernel khởi động, nó hoạt động, điều đầu tiên nó làm là thực thi quy trình INIT.

**5. INIT**.
- Quá trình init (khởi tạo) là quá trình gốc / cha của tất cả quá trình chạy trong Linux. Quá trình đầu tiên nó chạy là một tập lệnh tại /etc/rc.d/rc.sysinit, sẽ kiểm tra tất cả các thuộc tính hệ thống, phần cứng, hiển thị, SElinux, tải các mô-đun hạt nhân, kiểm tra hệ thống tệp, gắn hệ thống tệp, v.v. -level, script được thực thi để bắt đầu / dừng các quá trình khác nhau để chạy hệ thống và làm cho nó hoạt động. Quá trình INIT đọc /etc/inittab là bảng khởi tạo xác định bắt đầu các chương trình hệ thống. INIT sẽ bắt đầu mỗi lần Runlevel và bắt đầu thực thi các tập lệnh tương ứng với runlevel đó.
- Runlevel được biểu thị bằng các chữ số đơn và chúng có thể có giá trị từ 0 đến 6:
  - Runlevel 0: Tắt hệ thống.
  - Runlevel 1: Chế độ người dùng đơn.
    - Chỉ 1 user dùng, do đó không cần yêu cầu password
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
