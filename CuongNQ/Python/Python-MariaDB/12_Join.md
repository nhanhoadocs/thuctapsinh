# Join các bảng
### **Join 2 hoặc nhiều bảng**
- Có thể gộp các dòng của 2 hoạc nhiều bảng , dựa trên mối quan hệ của các cột của chúng bằng cách sử dụng công thức `JOIN` .
- **VD :** Có 2 bảng sau : `new_table` :
    ```sh 
    +-----+----------------+  
    | id  | name           |
    +-----+----------------+
    |   1 | Nguyen Van Anh |
    |   3 | Bui Thi Binh   |
    |  49 | Ngo Quoc Cuong |
    | 159 | Tran Van Hieu  |
    | 471 | Dinh Cong Hung |
    +-----+----------------+
    ```
    và `old_table` :
    ```sh
    +-------+------------+  
    | class | university |
    +-------+------------+
    |   VT1 | PTIT       |
    |   VT5 | PTIT       |
    |   VT1 | PTIT       |
    |   VT1 | PTIT       |
    |   VT3 | PTIT       |
    +-----+--------------+
    ```
- 
