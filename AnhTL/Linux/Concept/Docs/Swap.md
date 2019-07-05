# Swap
Swap được sử dụng để làm RAM ảo cho máy tính và nó có thể sử dụng trong các hệ điều hành Linux như Ubuntu, CentOS.

![](https://www.maketecheasier.com/assets/uploads/2015/07/swappiness-feaured.png)

**Swap là gì?**
- Swap (hoán đổi) là một vùng trên ổ đĩa mà nó có thể được sử dụng để lưu trữ các dữ liệu mà không được sử dụng trên bộ nhớ vật lý (RAM). Đây là nơi tạm thời chứa các tài nguyên đang không hoạt động trong bộ nhớ.
- Swap được sử dụng khi hệ thống của ta quyết định rằng nó cần thêm bộ nhớ RAM cho quá trình hoạt động và bộ nhớ RAM không còn dư để sử dụng. Các tài nguyên và dữ liệu tạm thời không hoạt động trên bộ nhớ RAM sẽ được di chuyển để lưu trữ vào không gian Swap để giải phóng bộ nhớ RAM và sử dụng cho việc khác.
  - Ví dụ: Ta có một máy tính có RAM 8GB. Nếu ta khởi động các chương trình, mọi thứ sẽ vẫn ổn nếu RAM chưa đầy. Nhưng giả sử các chương trình ấy phát sinh thêm các dữ liệu mà ta không xác định được và làm đầy RAM. Nếu không có **swap space** thì ta sẽ phải ngừng hoạt động các chương trình ấy cho đến khi ta giải phóng một số lượng RAM giới hạn của mình bằng cách đóng một số chương trình khác.  

**Kernel**
- Kernel sử dụng chương trình quản lý bộ nhớ phát hiện các khối, còn gọi là các trang của bộ nhớ trong đó chứa nội dung không được sử dụng gần đây. Chương trình quản lý bộ nhớ hoán đổi đầy đủ các trang của bộ nhớ được sử dụng tương đối ít này ra một phân vùng đặc biệt trên ổ cứng được chỉ định cụ thể cho phân trang. Điều này giải phóng RAM và dành chỗ cho nhiều dữ liệu khác.
  - Các trang bộ nhớ được hoán đổi vào ổ cứng được theo dõi bởi mã quản lý bộ nhớ của kernel và có thể được phân trang lại vào RAM nếu cần thiết.
- Tổng dung lượng bộ nhớ trong máy tính Linux là **RAM cộng với dung lượng swap** và được gọi là bộ nhớ ảo.

**Các loại Swap**
- Linux cung cấp hai loại swap space. Theo mặc định, hầu hết 

```
watch -n 1 free -m
```

**Tại sao cần Swap?**
- Sử dụng Swap là lấy ổ cứng làm RAM, tuy nó chậm nhưng nó vẫn tốt hơn là không sử dụng nếu máy tính không có đủ lượng RAM. Ta vẫn có thể chỉ định rằng khi nào hệ thống sẽ được phép sử dụng Swap. Vì vậy ta nên luôn luôn sử dụng Swap cho máy tính, mặc dù có ít hoặc nhiều bộ nhớ RAM.
  - **Chế độ ngủ đông (Hibernation)** – Trong Ubuntu, nếu ta muốn sử dụng tính năng ngủ đông (suspend-to-disk) thì ta cần phải có phân vùng Swap.
  - **Tối ưu hóa bộ nhớ** – Hệ thống sẽ di chuyển các tài nguyên và dữ liệu hiện không được sử dụng trong bộ nhớ RAM đến Swap, điều này giúp hệ thống phục vụ cho các mục đích khác tốt hơn.
  - **Tránh các trường hợp không lường trước** – Trong một số trường hợp, một chương trình nào đó phát sinh các dữ liệu không xác định, hoặc bất cứ điều gì đó bất thường. Trong trường hợp này, Swap sẽ được sử dụng để hệ thống có thể được duy trì để tiếp tục chạy (mặc dù nó là chậm) thay vì hệ thống đột ngột dừng lại vì thiếu bộ nhớ.

**Nên để kích thước Swap là bao nhiêu?**
- Nếu ta có bộ nhớ RAM ít hơn hoặc bằng 1Gb, ta nên sử dụng Swap có kích thước tối thiểu là bằng với lượng RAM. Hoặc cũng có thể để kích thước của Swap tối đa là gấp đôi dung lượng RAM tùy thuộc vào dung lượng ổ đĩa ta đang có.
- Nếu ta không sử dụng **Hibernation** thì kích thước tối thiểu của Swap là “round(sqrt(RAM))” và kích thước tối đa là gấp đôi lượng RAM. Có một nhược điểm khi ta thiết lập kích thước của Swap quá lớn, đó là ta đang lãng phí dung lượng ổ đĩa mặc dù Swap không được sử dụng.

**Ví dụ về kích thước của Swap**

![](https://scontent.fhan5-7.fna.fbcdn.net/v/t1.15752-9/66414905_859349591075415_7460111335611695104_n.png?_nc_cat=100&_nc_oc=AQmekrN7fEV-VLIiNhvXI5v_KAxulZo1XYF3X7SFii784cONT0frrwUs1qauUmDjW-A&_nc_ht=scontent.fhan5-7.fna&oh=be31546a54531ec2e429a93e2e7c0465&oe=5DAA9680)


## Tài liệu tham khảo:

https://www.sitecuatui.com/swap-la-gi-swap-trong-he-dieu-hanh-linux-ubuntu-centos/
