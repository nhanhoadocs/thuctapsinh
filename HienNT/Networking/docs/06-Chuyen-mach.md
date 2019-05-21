> ## **1,Các yếu tố ảnh hưởng đến hiệu quả hoạt động của mạng**  
- Mạng LAN ngày càng trở nên quá tải, tình trạng nghẽn mạch tăng.  
- Số lượng người dùng tăng lên nhanh chóng + yếu tố khác: 
   - Môi trường đa nhiệm của các hệ điều hành cho phép thực hiện đồng thời nhiều phiên giao dịch mạng --> yêu cầu tài nguyên mạng càng tăng.  
   - Việc sử dụng các ứng dụng chuyên sâu gia tăng.
> ## **2,Mạng bán song công**  
- Với chế độ bán song công, host chỉ có thể truyền hoặc nhận tại một thời điểm chứ không thể thực hiện đồng thời cả 2.
> ## **3,Hoạt động cơ bản của Switch**  
- Chuyển mạch Frame
- Bảo trì hoạt động chuyển mạch
- Khả năng truy cập riêng biệt trên port
- Loại trừ được đụng độ và tăng thông lượng đường truyền
- Hỗ trợ được nhiều phiên giao dịch cùng 1 lúc
- Chuyển frame dựa trên bảng chuyển mạch
- Chuyển frame dựa trên địa chỉ MAC(lớp 2)
- Hoạt động ở lớp 2 của mô hình OSI
- Học vị trí kết nối của từng máy trạm bằng cách ghi nhận địa chỉ nguồn trên frame nhận vào.
> ## **4,Chuyển mạch lớp 2 và lớp 3**  
- Chuyển mạch là tiến trình nhận frame vào từ một cổng và chuyển frame ra một cổng khác. 
- Chuyển mạch lớp 2 dựa trên thông tin về địa chỉ MAC, chuyển mạch lớp 3 dự a trên thông tin về địa chỉ mạng ví dụ như địa chỉ IP
> ## **5,Chuyển mạch đối xứng và bất đối xứng**
- Chuyển mạch đối xứng là chuyển mạch giữa  các port có cùng băng thông. Chuyển mạch bất đối xứng là chuyển mạch giữa các port khác băng thông.  
> ## **6,Hai phương pháp chuyển mạch**
- Store - and - forward: nhận vào toàn bộ frame xong rồi mới bắt đầu chuyển đi. Sw đọc địa chỉ nguồn, đích và lọc frame nếu cần trước khi frame được chuyển ra.
- Cut - through: frame được chuyển đi trước khi nhận đủ frame.