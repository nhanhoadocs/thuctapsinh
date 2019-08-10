# VLSM ( Variable Length Subnet Masking ): 
- Chia địa chỉ ban đầu thành những địa chỉ mạng con không đồng nhất với nhau.
 VD: Khi bạn chỉ có 1 địa chỉ ip public thuê từ nhà cung cấp mà có 2 hay nhiều chi nhánh, mỗi chi nhánh cần số địa chỉ cho host khác nhau. Nếu chia đều nhau thì có thể xảy ra tình trạng nơi có nhiều host thiếu địa chỉ mà nơi có ít host thừa địa chỉ nên VLSM sinh ra để giải quyết vấn đề này. Kỹ thuật VLSM sẽ chia địa chỉ theo nhu cầu của mỗi chi nhánh.

- Net ID : Xác định mạng mà thiết bị kết nối vào ( xác định địa chỉ được cung cấp cho từng mạng riêng )
- Host ID : Xác định thiết bị của mạng đó. 

###### Các bước thực hiện:
- Sắp xếp các mạng có số host yêu cầu từ cao nhất xuống thấp nhất 
- Chia Subnet theo thứ tự đã ưu tiên. Sử dụng kết quả thu được ở bước trước để chia subnet cho bước sau.
- Lặp lại quá trình trên cho đến khi các subnet đều thỏa mãn yêu cầu.
###### Công thức tính:
 - Gọi n là số bit phần Net ID mượn phần Host ID  
 - Gọi m là số bit 0 còn lại của Subnet Mask (m = 32 – n – SM hiện tại). 
 - => Số Subnet: 2n  
 - Số Host/Subnet : 2m – 2 (trừ đi địa chỉ Subnet Address và Broadcast) 
 - Bước nhảy: 28 - n  
 - Subnet mask mới: 256 – Bước nhảy


> Lớp e để nghiên cứu, lớp D sử dụng làm địa chỉ multicas.