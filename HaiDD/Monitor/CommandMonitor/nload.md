# Tìm hiểu về lệnh `nload`

## I. Lệnh `nload`
- `nload` là lệnh để theo dõi network traffic (lưu lượng mạng) và bandwidth useage (băng thông sử dụng) trong thời gian thực.

- Nó sẽ giúp giám sát lưu lượng đến và đi bằng biểu đồ và cung cấp thông tin bổ sung như tổng lượng dữ liệu được truyền và mức sử dụng mạng tối thiểu/tối đa.

## II. Install `nload` 
1. Trên CentOS:
    ```
    yum install epel-release
    yum install nload
    ```

2. Trên Ubuntu
    ```
    apt install nload -y
    ```

## III. Sử dụng `nload`

### 1. `nload`
- Lệnh 
    ```
    nload
    ```
    hoặc
    ```
    nload <interface_name>
    ```

- Ví dụ:
    ```
    nload
    ```

    <img src="https://i.imgur.com/vu5pK0d.png">

- Để chuyển qua các interface khác, sử dụng phím mũi tên hoặc Enter/Tab, ...

### 2. `nload -m`
- Hiển thị nhiều thiết bị cùng một lúc, không hiển thị biểu đồ lưu lượng. Các phím mũi tên chuyển đổi nhiều thiết bị qua lại như được hiển thị trên màn hình

    <img src="https://i.imgur.com/vPUeTSJ.png">

### 3. `nload -a <thời_gian>`
- Dùng `-a` để đặt thời gian tính bằng giây của cửa sổ thời gian để tính giá trị trung bình. Thời gian tính bằng giây

- Ví dụ: 
    ```
    nload -a 400
    ```

### 4. `nload -t <thời_gian>`
-  Dùng `-t` đặt khoảng thời gian làm mới của màn hình bằng mili giây (mặc định là 500).

- **Lưu ý:** Nếu đặt giá trị nhỏ hơn 100 sẽ có thể dẫn đến trường hợp kết quả lưu lượng truy cập bị sai lệch, không chính xác.

- Ví dụ:
    ```
    nload -ma 400 -t 600
    ```

### 5. Một số phím tắt sử dụng trong giao diện nload
1. **F2** : Hiển thị cửa sổ các tùy chỉnh

    <img src="https://i.imgur.com/8Tc437b.png">

2. **F5** : Lưu lại cấu hình đang sử dụng vào file config của người dùng
    - Vị trí lưu file config người dùng: `~$HOME/.nload`

    <img src="https://i.imgur.com/LbSPeVo.png">

3. **F6** : Load lại cài đặt từ file cấu hình

4. **q** hoặc **Ctrl+C** để thoát giao diện `nload`

## IV. Ý nghĩa các thông số trong giao diện `nload`

### 1. Các thông số trong Option
<img src="https://i.imgur.com/v8NXaqe.png">

- `Window length for average (s):` : Thời gian để tính giá trị trung bình. Được tính bằng giây

- `Max Incoming deflection (kBit/s):` : Độ lệch tối đa của Incoming traffic. Đo bằng kBit/s

- `Max Outgoing deflection (kBit/s):` : Độ lệch tối đa của Outgoing traffic. Đo bằng kBit/s

- `Unit for data numbers:` : Kiểu hiển thị (đơn vị) các thông số

- `Devices to show:` : Thiết bị hiển thị thông số

### 2. Các thông số traffic
<img src="https://i.imgur.com/amVrB9Q.png">

- Cột **Incoming**: Lưu lượng mạng gửi tới thông qua device

- Cột **Outgoing**: Lưu lượng mạng mà device gửi đi

- Các giá trị trong 2 cột:
    - `Curr` : Tốc độ truyền dữ liệu hiện tại
    - `Avg` : Tốc độ truyền dữ liệu trung bình
    - `Min` : Tốc độ truyền dữ liệu nhỏ nhất
    - `Max` : Tốc độ truyền dữ liệu tối đa
    - `Ttl` : Tổng lượng dữ liệu truyền được