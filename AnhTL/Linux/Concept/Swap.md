# Swap
Swap được sử dụng để làm RAM ảo cho máy tính và nó có thể sử dụng trong các hệ điều hành Linux như Ubuntu, CentOS.

![](https://www.maketecheasier.com/assets/uploads/2015/07/swappiness-feaured.png)

**Swap là gì?**
- Swap (hoán đổi) là một vùng trên ổ đĩa mà nó có thể được sử dụng để lưu trữ các dữ liệu mà không được sử dụng trên bộ nhớ vật lý (RAM). Đây là nơi tạm thời chứa các tài nguyên đang không hoạt động trong bộ nhớ.
- Swap được sử dụng khi hệ thống của ta quyết định rằng nó cần thêm bộ nhớ RAM cho quá trình hoạt động và bộ nhớ RAM không còn dư để sử dụng. Các tài nguyên và dữ liệu tạm thời không hoạt động trên bộ nhớ RAM sẽ được di chuyển để lưu trữ vào không gian Swap để giải phóng bộ nhớ RAM và sử dụng cho việc khác.
- Thời gian truy cập vào vùng Swap là chậm hơn rất nhiều, do đó ta không nên coi việc sử dụng Swap là một phương pháp thay thế tốt cho bộ nhớ vật lý (RAM). Swap có thể là một phân vùng dành riêng cho Swap (khuyến nghị), một tập tin Swap hoặc một sự kết hợp của phân vùng và tập tin Swap.
  - Để xem dung lượng Swap ta có thể dùng lệnh:
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
![](https://static.sitecuatui.com/wp-content/uploads/2015/11/swap-la-gi-swap-trong-he-dieu-hanh-linux-ubuntu.jpg)

## Tài liệu tham khảo:
https://www.sitecuatui.com/swap-la-gi-swap-trong-he-dieu-hanh-linux-ubuntu-centos/