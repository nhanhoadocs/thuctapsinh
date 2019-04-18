Như cấu hình dash board ở bài trước các biểu đồ đươc cài đặt cố định chỉ hiển thị thông tin của một host mà ta đã cấu hình từ trước. Với cách này sẽ rất bất tiện khi thực hiện muốn monitor nhiều host. Nếu như cách này ta sẽ phải thực hiện tạo nhiều màn hình Dashboard để hiển thị cho từng máy. Như vậy mất rất nhiều thời gian và không linh hoạt. 

Để giải quyết vấn đề này ta sẽ gán các biến cho các giá trị và ta tiến hành khai báo biến trong các biểu đồ và khi hiển thị ta sẽ chọn các giá trị phù hợp và grafana sẽ goị đến các giá trị đó để hiển thị.

## Cài đặt

Bạn có thể tạo một dashboard mới hoặc sử dụng dashboard bạn đã tạo cho một host và muốn nó hiển thị cho các host khác.

### Tạo variables

Bạn vào một dashboard có thể là dashboard mới hoặc dashboard đã tạo từ trước

![](https://github.com/niemdinhtrong/thuctapsinh/blob/master/NiemDT/Ghichep-zabbix/images/variables/1.png)

Chọn `Variables` -> `Add variable`

![](https://github.com/niemdinhtrong/thuctapsinh/blob/master/NiemDT/Ghichep-zabbix/images/variables/2.png)

Thực hiện add các thông số cho biến

![](https://github.com/niemdinhtrong/thuctapsinh/blob/master/NiemDT/Ghichep-zabbix/images/variables/3.1.png)

Một số thông số cần chú ý

* `Name`: tên biến
* `Lable`: Tên hiển thị ra ngoài
* `Data source`: Nơi truy vấn dữ liệu
* `Refresh`: Cách load dữ liệu
* `Query`: Dữ liệu query (để * ở đây sẽ thực hiện query toàn bộ dữ liệu)

Ở dòng `Preview of values` bạn sẽ thấy những giá trị bạn có thể lựa chọn cho biến này với những gì bạn cấu hình ở bên trên.

Sau khi xong click vào `Add`

Sau khi add xong bạn có thể thấy

![](https://github.com/niemdinhtrong/thuctapsinh/blob/master/NiemDT/Ghichep-zabbix/images/variables/4.png)

Làm tương tự với các biến khác. Có một lưu ý là nếu bạn muốn lấy các giá trị là một giá trị con của một biến đã khai báo thì ở phần query ta để như sau

![](https://github.com/niemdinhtrong/thuctapsinh/blob/master/NiemDT/Ghichep-zabbix/images/variables/5.1.png)

Như ví dụ trên thì Host nằm ở bên trong Group nên thôi khai báo như vậy thì tôi sẽ query được các giá trị bên trong của group.

Khi lưu lại thì ta thấy

![](https://github.com/niemdinhtrong/thuctapsinh/blob/master/NiemDT/Ghichep-zabbix/images/variables/6.png)

Bây giờ tiến hành cấu hình ở trong từng đồ thị. Thay vì ta chọn hiển thị thông tin của một máy nào đó thì ta thay vào đó là ta cấu hình là các biến thích hợp như ta đã khai báo

![](https://github.com/niemdinhtrong/thuctapsinh/blob/master/NiemDT/Ghichep-zabbix/images/variables/7.png)

Làm như vậy với các đồ thị khác. Làm như vậy ta sẽ có thể hiển thị thông tin của nhiều Host trên một màn Dashboard bằng cách chọn group và host phù hợp.

![](https://github.com/niemdinhtrong/thuctapsinh/blob/master/NiemDT/Ghichep-zabbix/images/variables/8.png)

Như vậy bạn khi bạn cấu hình xong dashboard thì bạn có thể lưu nó lại và có thể import lại được màn dashboard này trên một nơi khác. Để export ra một file ta vào màn Dashboard cần export click `Share`

![](https://github.com/niemdinhtrong/thuctapsinh/blob/master/NiemDT/Ghichep-zabbix/images/variables/9.png)

Sau đó chọn `Export` và click `Save to file`. Như vậy nó sẽ export ra một file và lưu file này về máy. Bạn có thể lưu nó nó lên trang chủ của grafana và nếu mọi người thấy hay thì có thể tải về dùng.

![](https://github.com/niemdinhtrong/thuctapsinh/blob/master/NiemDT/Ghichep-zabbix/images/variables/10.png)

Để Import lại một dashboard có đã có bạn click vào `Import`. Ở đây bạn có thể lấy một Dashboard có sẵn ở trên trang chủ Dashboard của grafana do mọi người chia sẻ. Bạn lấy ID của dashboard đó để tiến hành Import. Hoặc bạn có thể Import thừ một file `.json` mà bạn đã export ra. Với cách này bạn click vào `Update .json file` sau đó chọn một file để Import

![](https://github.com/niemdinhtrong/thuctapsinh/blob/master/NiemDT/Ghichep-zabbix/images/variables/11.1.png)