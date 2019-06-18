# X86 and X64

### 1. What is x86 and x64?
- Thuật ngữ x86 được đề cập đến hệ thống 32-bit và x64 dành cho hệ thống 64-bit
- Về mặt kỹ thuật x86 chỉ đơn giản đề cập đến một họ bộ xử lý và tập lệnh mà tất cả chúng sử dụng.
- Như vậy x86 hay x64 là đề cập đến phần cứng, là một máy vi tính được trang bị bộ vi xử lý 32-bit hay 64-bit, không phải nói đến hệ điều hành 32-bit hay 64-bit.

### 2. Hệ điều hành 32-bit và 64-bit.
- Một máy tính có bộ xử lý 32-bit không thể cài đặt ứng dụng 64-bit của hệ điều hành. Nó chỉ có thể cài đặt ứng dụng 32-bit của hệ điều hành.

- Ngược lại một máy tính có bộ xử lý 64-bit có thể cài đặt ứng dụng 64 bit hoặc 32bit của hệ điều hành. Tuy nhiên, với hệ điều hành 32- bit, bộ xử lý 64-bit sẽ không chạy hết công suất.

- Các chương trình 32 bit thường được cài đặt vào thư mục C:\Program Files (x86) \folder của Windows 64 bit, trong khi các chương trình 64 bit có xu hướng thường được cài đặt vào thư mục C:\Program Files\folder.

- Đối với linux các chương trình sẽ được lưu trong /lib và lib64

### 3. CPU (Central Processing Unit).

![](https://image.slidesharecdn.com/cutovnguynlhotngcpu-120407024039-phpapp02/95/cu-to-v-nguyn-l-hot-ng-cpu-36-728.jpg?cb=1333767045)

- CPU có ba khối cơ bản chính: 
  - **Control unit** sẽ phát ra các tín hiệu read hoặc write đến memory nhằm thông báo cho memory biết CPU muốn lấy data hay ghi data. 

  - **ALU (Arithmetic Logic Unit)** là khối tính toán cơ bản. ALU sẽ thực hiện các phép tính số học, logic...

  - **Register** dùng để giao tiếp và lưu trữ data phép toán phục vụ cho ALU. 

    - Register là một thanh nhớ nằm trong CPU, có tốc độ xử lý nhanh gần hoặc bằng CPU. Chính vì không có đồng bộ về tốc độ giữa các thành phần lưu trữ register với memory với disk nên sẽ có một số khoảng thời gian chết khi mà memory bận không đáp ứng kịp đòi hỏi của CPU.

- Hạn chế về công nghệ không cho phép các thiết bị lưu trữ ngoài CPU đạt được tốc độ nhanh bằng CPU nên các kỹ sư đã phải khắc phục bằng cách bổ sung cho CPU các bộ nhớ cache. Bộ nhớ cache sẽ lưu các data thường được sử dụng, CPU sẽ thay vì phải đợi memory cung cấp sẽ tận dụng data trong cache trước.



### Tài liệu tham khảo:

http://coffeecode101.blogspot.com/2016/01/x86-x64-nghia-la-gi.html
