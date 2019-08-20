# Các chế độ card mạng trong VMware

**1. Network mặc định khi mới cài đặt VMware**
 Khi mới cài đặt VMware Workstation, mặc định phần mềm sẽ cài cho ta 2 card mạng:
- Một card bridge, card này sử dụng chính card mạng thật của ta để kết nối ra ngoài Internet (card ethernet hoặc wireless). Do đó khi sử dụng card mạng này IP của máy ảo sẽ cùng với dải IP của máy thật.
  - Ưu điểm: đơn giản, ra được internet và cùng dải máy thật nên cấu hình gì cũng dễ dàng.
  - Nhược điểm: nhiều trường hợp dùng card bridge cấu hình bình thường và đến khi nơi nào không có mạng, mất mạng là mất hết!!!!
- Một card Nat, card này sẽ Nat địa chỉ IP của máy thật ra một địa chỉ khác cho máy ảo sử dụng. Card này cũng có thể kết nối ra bên ngoài Internet.
- Để xem các card mạng đã có trong VMware Workstation ta chỉ cần bật VMware lên, chọn Edit => Virtual Network Editor

![img](https://camo.githubusercontent.com/685edb82d7771ab1f538102d5af1efb621c9e849/687474703a2f2f692e696d6775722e636f6d2f48513643334e702e706e67)

- Ta có thể thấy trong hình card bridge có tên là VMnet0, card Nat có tên là VMnet8
- Card bridge không có địa chỉ IP do nó sẽ sử dụng dải IP của máy thật. VMware sẽ tự sinh một dải IP và gán cho VMnet8. Trong trường hợp này là dải 192.168.238.0/24.
- Một lưu ý quan trọng đó là việc chọn card mạng trên máy ảo. Khi cài đặt,  VMWare tạo ra ở máy thật 2 card mạng ảo:

  - VMWare Virtual Ethernet Adapter for VMnet1
  - VMWare Virtual Ethernet Adapter for Vmnet8

![img](https://psglee.files.wordpress.com/2015/07/dffdffd.png?w=611)

- Hai card mạng này có thể được sử dụng để máy thật giao tiếp với các máy tính ảo. Khi “gắn” một card mạng vào một máy ảo, card mạng này có thể được chọn 1 trong 3 loại sau:

  - **Bridge**: ở chế độ này, card mạng trên máy ảo được gắn vào VMnet0, VMnet0 này liên kết trực tiếp với card mạng vật lý trên máy thật, máy ảo lúc này sẽ kết nối internet thông qua card mạng vật lý và có chung lớp mạng với card mạng vật lý.
  
  ![img](https://public.sn2.livefilestore.com/y2pt0QnN_xQOE_pgIJRAxtK5EM-sTUw3tPhgNsDZSts-Qh6fZ0W_qxt6WIiUui_jP8QpGgV0aatQfIFo39L_MjwKRk2v0XHixtbEMALXPlrISQ/briged.png?psid=1)
  
    + Card Bridge trên máy ảo chỉ có thể giao tiếp với card mạng thật trên máy thật.
    + Card mạng Bridge này có thể giao tiếp với mạng vật lý mà máy tính thật đang kết nối. 
     
  - **NAT**: ở chế độ này, card mạng của máy ảo kết nối với VMnet8, VNnet8 cho phép máy ảo đi ra mạng vật lý bên ngoài internet thông qua cơ chế NAT (NAT device). Lúc này lớp mạng bên trong máy ảo khác hoàn toàn với lớp mạng của card vật lý bên ngoài, hai mạng hoàn toàn tách biệt. IP của card mạng máy ảo sẽ được cấp bởi DHCP của VMnet8, trong trường hợp bạn muốn thiết lập IP tĩnh cho card mạng máy ảo bạn phải đảm bảo chung lớp mạng với VNnet8 thì máy ảo mới có thể đi internet.
  
  - **Host-only**: máy ảo được kết nối với VMnet có tính năng Host-only, trong trường hợp này là VMnet1 . VNnet Host-only kết nối với một card mạng ảo tương ứng ngoài máy thật. Ở chế độ này,  các máy ảo không có kết nối vào mạng vật lý bên ngoài hay internet thông qua máy thật , có nghĩa là mạng VMnet Host-only và mạng vật lý hoàn toàn tách biệt. IP của máy ảo được cấp bởi DHCP của VMnet tương ứng. Trong nhiều trường hợp đặc biệt cần cấu hình riêng, ta có thể tắt DHCP trên VMnet và cấu hình IP bằng tay cho máy ảo.
  ![img](https://public.sn2.livefilestore.com/y2pP5x5S-hctvRaGYnS19WRmpkhDnqGeWbKsqJrxMmcJgj4nplOWuXgZ6VmlYVVQJhr2O771zgIP0tH7WHIbdaCaAZKF_ms1PqKptl3ioj-COI/host-only.png?psid=1)

    - Card Host-only chỉ có thể giao tiếp với card mạng ảo VMnet1 trên máy thật.
    - Card Host-only chỉ có thể giao tiếp với các card Host-only trên các máy ảo khác.
    - Card Host-only không thể giao tiếp với mạng vật lý mà máy tính thật đang kết nối.


![img](https://pbs.twimg.com/media/CSZpJyvUYAAeH6L.png)
