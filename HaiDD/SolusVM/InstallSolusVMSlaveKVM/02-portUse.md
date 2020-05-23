# Port sử dụng cho SolusVM Slave


|Port|Mục đích|
|-|-|
|6767|Port này được sử dụng để liên lạc với node Master. Port này phải được mở cho IP nút Master|
|22(*)|Cổng SSH được sử dụng cho bảng điều khiển HTML 5 trong trường hợp OpenVZ. Nó nên được mở trên các slave nodes cho IP node Master|
|5901 ... 5999(**)|Các cổng này được sử dụng cho VNC. Nó nên được mở cho tất cả internet|

(*) Bất kỳ cổng SSH nào cũng có thể được sử dụng, không chính xác là cổng 22

(**) Cổng này có thể lên cao hơn, ví dụ như 6001, trong trường hợp node có hơn 99 VPS