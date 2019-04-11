# Linux swap memory

Swap là một vùng trên ổ đĩa mà nó có thể được sử dụng để lưu trữ các dữ liệu mà không được sử dụng trên bộ nhớ vật lý (RAM). Đây là nơi tạm thời chứa các tài nguyên đang không hoạt động trong bộ nhớ.

Swap được sử dụng khi hệ thống của bạn quyết định rằng nó cần thêm bộ nhớ RAM cho quá trình hoạt động và bộ nhớ RAM không còn dư để sử dụng. Nếu điều đó xãy ra, các tài nguyên và dữ liệu tạm thời không hoạt động trên bộ nhớ RAM sẽ được di chuyển để lưu trữ vào không gian Swap để giải phóng bộ nhớ RAM và sử dụng cho việc khác.

Lưu ý rằng thời gian truy cập vào vùng Swap là chậm hơn rất nhiều, do đó bạn không nên coi việc sử dụng Swap là một phương pháp thay thế hoàn hảo cho bộ nhớ vật lý (RAM). Swap có thể là một phân vùng dành riêng cho Swap (khuyến nghị), một tập tin Swap hoặc một sự kết hợp của phân vùng và tập tin Swap.


## Tại sao cần Swap?
Cũng có thể nói rằng sử dụng Swap là lấy ổ cứng làm RAM, tuy nó là chậm nhưng nó vẫn tốt hơn là không sử dụng nếu máy tính không có đủ lượng RAM. Bạn vẫn có thể chỉ định rằng khi nào hệ thống sẽ được phép sử dụng Swap. Vì vậy bạn nên luôn luôn sử dụng Swap cho máy tính, mặc dù bạn có ít hoặc nhiều bộ nhớ RAM.

- Chế độ ngủ đông (Hibernation) – Trong Ubuntu, nếu bạn muốn sử dụng tính năng ngủ đông (suspend-to-disk) thì bạn cần phải có phân vùng Swap.

- Tối ưu hóa bộ nhớ – Hệ thống sẽ di chuyển các tài nguyên và dữ liệu hiện không được sử dụng trong bộ nhớ RAM đến Swap, điều này giúp hệ thống phục vụ cho các mục đích khác tốt hơn.

- Tránh các trường hợp không lường trước – Trong một số trường hợp, bạn không dự tính được bộ nhớ dành cho các chương trình mà bạn chuẩn bị thử nghiệm, hoặc một chương trình bất kỳ nào đó nổi điên lên, hoặc bất cứ điều gì đó bất thường. Trong trường hợp này, Swap sẽ được sử dụng để hệ thống có thể được duy trì để tiếp tục chạy (mặc dù nó là chậm) thay vì hệ thống đột ngột dừng lại vì thiếu bộ nhớ.


Linux có hai dạng không gian hoán đổi: phân vùng trao đổi và tệp hoán đổi. Phân vùng trao đổi là một phần độc lập của ổ cứng, được sử dụng riêng cho trao đổi, không ai khác có thể cư trú ở đó. Tệp hoán đổi là một tệp đặc biệt nằm trong hệ thống tệp giữa hệ thống và tệp dữ liệu. Để xem cách nó được thực hiện và vị trí không gian hoán đổi bạn có, hãy sử dụng lệnh hoán đổi.
lưu ý rằng tạo Swap dưới dạng tệp, tốc độ truy suất sẽ chậm hơn là tạo thành phân vùng, nhưng đổi lại việc thay đổi kích cỡ Swap lại linh hoạt hơn.

dùng câu lệnh sau để kiểm tra Swap
```
# swapon -s
Filename                                Type            Size    Used    Priority
/dev/dm-0                               partition       4079612 0       -1
```

Mỗi dòng liệt kê một phân vùng Swap riêng được sử dụng bởi hệ thống. Một điểm đặc biệt của Swap trên linux là, nếu bạn gắn hai (hoặc nhiều hơn) không gian hoán đổi (tốt nhất là trên hai thiết bị khác nhau) có cùng mức độ ưu tiên, linux sẽ phân chia các hoạt động Swap giữa chúng. Điều này chuyển thành một sự gia tăng đáng chú ý trong hiệu suất. Tuy nhiên, để thêm phân vùng trao đổi vào hệ thống của bạn, cần phải chuẩn bị trước.


#### Tạo Swap dưới dạng file
```
dd if=/dev/zero of=/var/swapfile bs=1M count=2048
chmod 600 /var/swapfile
mkswap /var/swapfile
echo /var/swapfile none swap defaults 0 0 | sudo tee -a /etc/fstab
swapon -a
```

Một số bài viết hữu ích ngoài lề:

https://kipalog.com/posts/Su-khac-nhau-giua-Buffers-va-Cached

https://www.sitecuatui.com/swap-file-vps-linux-ubuntu-centos/

https://techtalk.vn/linux-dang-ngon-ram-cua-chung-ta-nhu-the-nao.html