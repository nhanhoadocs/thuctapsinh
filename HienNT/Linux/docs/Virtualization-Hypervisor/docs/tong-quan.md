# Tìm hiểu về Hypervisor và Virtualization  

## Khái niệm
- `Virtualization` có nghĩa là ảo hóa - Là một thuật ngữ trong ngành công nghiệp máy tính ra đời từ những năm 60. Ban đầu thuật ngữ này được dùng để chỉ các phương pháp để thực hiện chạy nhiều dịch vụ trên cùng một máy tính lớn . Sau này nó được dùng để chỉ các phương pháp tạo ra một phiên bản ảo của 1 cái gì đó như máy tính ảo ( virtual machine ) , ổ đĩa ảo ( virtual disk) , mạng ảo ( virutal network). Hiểu đơn giản là khi tạo ra cái gì không phải thật mà dùng như thật thì gọi là `ảo hóa`.

- `Hypervisor` hay còn có tên khác là `Virtual machine monitor` (VMM) - là từ dùng để chỉ các phần mềm , firmware hoặc thậm chí là một phần cứng chuyên dụng dùng để tạo ra các máy ảo ( virtual machine). Nói 1 cách đơn giản tức là muốn ảo hóa máy tính thì ... cài hypervisor vào nó.
  Có 2 loại hypervisor là `Native` hay `Bare metal` và `Host Based`

### Hypervisor Type 1 - Native - Bare metal - Hypervisor based  
