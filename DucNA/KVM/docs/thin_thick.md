# 1. Thick 
## a) Khái niệm. 
- Thick là một loại phân bổ lưu trữ trước
- Với cơ chế này khi ta tạo một disk ảo cho máy ảo nó sẽ nhận nguyên dung lượng disk đó làm disk của nó dù cho nó chưa sử dụng hết dung lượng disk đó. Thick có 2 loại là:
- ![](https://www.nakivo.com/blog/wp-content/uploads/2018/11/thick-provisioning-1024x460-1024x460.jpg)
- `Thick Lazy` khi tạo một disk cho máy ảo nó sẽ ánh xạ đến một phân vùng trên disk thật. Nó nhận đủ dung lượng disk mà ta tạo cho máy ảo và nó sẽ không xóa dữ liệu cũ trên disk. khi chúng ta ghi cái ghì lên đó thì nó mới xóa dữ liệu đó đi. Chính vì vậy nên việc tạo đĩa ảo sẽ rất nhanh nhưng sẽ mất nhiều thời gian cho lần ghi đầu tiên do phải xóa dữ liệu cũ
- `Thick Eager` cũng gần giống như thick lazy có cũng nhận toàn bộ dung lượng mà ta tạo disk cho VM. Nó sẽ ghi toàn bộ bit 0 lên phần dung lượng chưa được sử dụng của disk ảo(giống như ta tạo file với câu lệnh dd). Vì vậy khi tạo disk cho VM ở kiểu này sẽ lâu hơn so với thick lazy nhưng với lần ghi đầu tiên sẽ nhanh hơn
- Như ta thấy thì nó sẽ rất lãng phí disk. Ví dụ ta có 100G dung lượng disk và ta tạo 5 máy ảo mỗi máy 20G disk và ta không thể tạo thêm một máy nào khác cho dù 5 VM kia chưa sử dụng hết 20G. Như vậy dung lượng bị lãng phí là rất lớn. Nhưng nó sẽ đảm bảo sự độc lập giữa các máy ảo 
# 2.Thin 
- ![](https://www.nakivo.com/blog/wp-content/uploads/2018/11/thin-provisioning-1024x447-1024x447.jpg)
- Thin là một loại chia ra trước lưu trữ. nó chỉ tiêu thụ dung lượng mà nó cần ban đầu và cấp phát theo sự phát triển 
- Với cơ chế này sẽ tránh được sự lạng phí dung lượng ổ cứng so với thick. Cơ chế này thì máy ảo chỉ chiếm dung lượng bằng đúng phần dung lượng mà nó đang lưu trữ. Vì vậy với phần dung lượng còn trống ta vẫn có thể làm việc khác
- Với cơ chế này ta có thể tận dụng được hết dung lượng disk nhưng nó có nhược điểm là nếu dung lượng đĩa cứng bị hết thì tất cả các VM trên đó sẽ gặp vấn đề vì không còn dung lượng disk để sử dụng