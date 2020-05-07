# Tìm hiểu về lệnh `nload`

## Lệnh `nload`
- `nload` là lệnh để theo dõi network traffic (lưu lượng mạng) và bandwidth useage (băng thông sử dụng) trong thời gian thực.

- Nó sẽ giúp giám sát lưu lượng đến và đi bằng biểu đồ và cung cấp thông tin bổ sung như tổng lượng dữ liệu được truyền và mức sử dụng mạng tối thiểu/tối đa.

## Install `nload` 
1. Trên CentOS:
    ```
    yum install epel-release
    yum install nload
    ```

2. Trên Ubuntu
    ```
    apt install nload -y
    ```

## Sử dụng `nload`
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