<img src="../../images/nginx/what-is-nginx-คืออะไร.png">  

# Tìm hiểu về NGINX  

## NGINX là gì?  
- NGINX là một phần mềm mã nguồn mở cho web serving, reverse proxying, caching, load balancing, media streaming,...Ban đầu nó giống như một web server được thiết kế để cho hiệu suất(performance) và tính ổn định(stability) cao nhất. Ngoài khả năng là 1 HTTP server, NGINX cũng có thể hoạt động như một proxy server cho email(IMAP, POP3 và SMTP) và reverse proxy và load balancer cho HTTP, TCP, và UDP server.

- NGINX xuất bản chính thức vào tháng 10 năm 2004. Nhà sáng lập của phần mềm này là Igor Sysoev, triển khai dự án từ năm 2002 để giải quyết vấn đề [C10k](https://en.wikipedia.org/wiki/C10k_problem). C10k là giới hạn của việc xử lý 10 ngàn kết nối cùng lúc. Ngày nay, có nhiều web server còn phải chịu nhiều kết nối hơn vậy để xử lý. NGINX sử dụng kiến trúc hướng sự kiện (event-driven) không đồng bộ (asynchronous). Tính năng này khiến NGINX server trở nên đáng tin cậy, tốc độ và khả năng mở rộng lớn nhất.

- Vì khả năng mạnh mẽ, và để có thể xử lý hàng ngàn kết nối cùng lúc, nhiều website có traffic lớn đã sử dụng dịch vụ NGINX. Một vài trong số những ông lớn công nghệ dùng nó là Google, Netflix, Adobe, Cloudflare, WordPress, và còn nhiều hơn nữa.

## Các khái niệm liên quan tới nginx
- Proxy Server: Một proxy server về cơ bản là một máy tính trên mạng internet với địa chỉ IP riêng mà máy tính của người dùng có thể nhận biết được. Khi bạn gửi đi một web request, request đó sẽ tới proxy server trước tiên. Proxy server sau đó sẽ thay bạn thực hiện web request, nhận các phản hồi từ web server và chuyển bạn đến trang web dữ liệu để bạn có thể xem trang trong trình duyệt của mình. Khi proxy server chuyển tiếp web request của bạn, server có thể gây ra các thay đổi trong dữ liệu gửi đi mà vẫn cung cấp cho bạn thông tin mà bạn mong muốn. Một proxy server có thể thay đổi địa chỉ IP nên web server sẽ không thể biết được vị trí chính xác của bạn là ở đâu. Proxy server có thể mã hóa dữ liệu và ẩn chúng (không thể đọc được) trong lúc chuyển tiếp. Và cuối cùng, một proxy server có thể chặn truy cập một trang web nhất định dựa trên địa chỉ IP.

  <img src="../../images/nginx/Minh_họa_về_Proxy.png">
  <img src="../../images/nginx/proxy-server.gif">

  << Xem thêm [tại đây](https://tech.bizflycloud.vn/proxy-la-gi-20181029114707565.htm) >>

- Reverse Proxy: Là một loại proxy server trung gian giữa server và các client. Nó được đặt bên phía server. Nó kiểm soát yêu cầu của các client, nếu hợp lệ, sẽ chuyển đến các server thích ứng.
  > Có 1 loại proxy server khác là forward proxy, nó là một trung gian cho các client liên hệ với nó liên lạc với bất kỳ server nào, còn reverse proxy là một trung gian cho các server liên hệ với nó được liên lạc bởi bất kỳ client nào.  

  <img src="../../images/nginx/image1.jpg">  

  Ảnh từ: [https://docs.microsoft.com](https://docs.microsoft.com/en-us/iis/extensions/configuring-application-request-routing-arr/creating-a-forward-proxy-using-application-request-routing)

- Load balancer: là một phương pháp để tối ưu khả năng sử dụng tài nguyên. Tài nguyên ở đây có thể là network, disk, web server,...  
  Load balancer có thể là thiết bị vật lý hoặc application.  
  Mục đích của load balancer là tối ưu tài nguyên sử dụng, tối đa hóa thông lượng, tối thiểu thời gian phản hồi, tránh quá tải ở một đơn vị tài nguyên từ đó đảm bảm hệ thống ổn định và luôn sẵn có (available).


## TÀI LIỆU THAM KHẢO
- https://www.nginx.com/resources/glossary/nginx/
- https://blog.vietnamlab.vn/2019/11/19/nginx-co-ban/
- https://www.hostinger.vn/huong-dan/nginx-la-gi-no-hoat-dong-nhu-the-nao/
- https://tech.bizflycloud.vn/nginx-la-gi-cach-cai-dat-nginx-20181101092814419.html



