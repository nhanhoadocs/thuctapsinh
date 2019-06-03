# Chuẩn MBR và chuẩn GPT

## 1. MBR 
	
- MBR là gì? 

	- MBR là một chuẩn quản lý thông tin trên ổ cứng
	
	- MBR tiến hành lưu trữ thông tin về những phân vùng trong ổ cứng trong đó các lệnh được ưu tiên thực thi khi tiến hành nạp hệ điều hành 
	
	- MBR chỉ có thể tạo được tối đa 4 phân vùng 
	
	- Dung lượng tối đa cho mỗi phân vùng là 2TB
	
## 2.GPT

	- Cũng là một chuẩn quản lý thông tin trên ổ cứng nhưng nó mới xuất hiện 
	
	- Được xác định bởi một mã số duy nhất trên phạm vi toàn cầu 
	
	- Không bị giới hạn số lượng phân vùng 
	
	- Dung lượng tối đa cho mỗi phân vùng là 1ZB
	
	

# Phân vùng ổ cứng và định dạng ổ cứng

# 1 Phân vùng ổ cứng

- Để kiểm tra xem có bao nhiêu ổ cứng dùng lệnh 

![](https://github.com/duckmak14/anh/blob/master/phan_vung_o_cung/Screenshot_1.png)

- Nếu ổ cứng đã chia rồi ta có thể thấy được ố cứng chia theo chuẩn nào bằng dòng sau 

![](https://github.com/duckmak14/anh/blob/master/phan_vung_o_cung/Screenshot_2.png)

- Nếu ổ cứng chi ở chuẩn GPT thì nó sẽ thay dos = GPT và MBR cũng tưởng tự 

- Muốn phân vùng ổ cứng nào thì ta có lệnh sau: ví dụ ổ cứng sda 

![](https://github.com/duckmak14/anh/blob/master/phan_vung_o_cung/Screenshot_8.png)

- Sau khi đã vào được ổ cứng ta có chữ m để có thể được hỗ trỡ lệnh 

![](https://github.com/duckmak14/anh/blob/master/phan_vung_o_cung/Screenshot_4.png)

- Ta sẽ thấy n là lệnh tao ra một phân vùng mới phần chia số mấy thường ta sẽ để mặc định

![](https://github.com/duckmak14/anh/blob/master/phan_vung_o_cung/Screenshot_5.png)

- Tao sẽ đến phần định dạng vùng ổ cứng xem nó là bao nhiêu GB tùy thuộc vào chúng ta

![](https://github.com/duckmak14/anh/blob/master/phan_vung_o_cung/Screenshot_7.png)