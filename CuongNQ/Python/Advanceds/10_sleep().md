# Hàm `time.sleep()`
## **1) Giới thiệu**
- `sleep()` là một hàm hữu ích để xử lý thời gian trong **Python** .
- `sleep()` sử dụng để dừng thực thi luồng hiện tại trong số giây truyền vào .
    ```py
    import time

    time.sleep(<seconds>)
    ```
- **VD :**
    ```py
    import time
  
    print ("In kết quả ra màn hình ngay lập tức.")
    time.sleep(3)
    print ("In kết quả ra màn hình sau 3s.")
    ```
    - Luồng hoạt động :
        - Thực thi tác vụ để hiển thị kết quả "`In kết quả ra màn hình ngay lập tức.`"
        - Trì hoãn trình thực thi trong vòng 3s.
        - Tiếp tục thực thi tác vụ và hiển thị "`In kết quả ra màn hình sau 3s.`"
        - Chương trình sẽ chạy cho đến khi `Ctrl + C` .
## **2) MultiThread trong Python**
### **2.1) Cú pháp multithread**
- Cú pháp :
    ```py
    import threading 

    var = threading.Thread(target=function_name)
    var.start()
    ```
- **VD :**
    ```py
    import threading 
   
    def print_hello_three_times():
    for i in range(3):
        print("Hello")
    
    def print_hi_three_times(): 
        for i in range(3): 
        print("Hi") 
    
    t1 = threading.Thread(target=print_hello_three_times)  
    t2 = threading.Thread(target=print_hi_three_times) 
    
    t1.start()
    t2.start()
    ```
    - Giải thích : Chương trình trên có hai luồng `t1` và `t2` . Các luồng này được chạy bằng cách sử dụng các câu lệnh `t1.start()` và `t2.start()` . `t1` được `start` trước nên sẽ chạy trước rồi sẽ chạy `t2` . Nếu `t1` và `t2` chạy đồng thời thì kết quả sẽ khác .
    - Output :
        ```
        Hello
        Hello
        Hello
        Hi
        Hi
        Hi
        ```
### **2.2) `sleep()` trong các chương trình đa luồng**
- Hàm `sleep()` tạm dừng thực thi thread hiện tại trong một số giây nhất định .
- Trong trường hợp các chương trình single-thread , `sleep()` tạm dừng thực thi thread và xử lý . Tuy nhiên , trong các chương trình multi-thread , hàm này chỉ tạm dừng một thread thay vì toàn bộ quá trình multi-thread .
- **VD :**
    ```py
    import threading 
    import time
    
    def print_hello():
        for i in range(4):
            time.sleep(0.5)
            print("Hello")
    
    def print_hi(): 
        for i in range(4): 
            time.sleep(0.7)
            print("Hi") 
    
    t1 = threading.Thread(target=print_hello)  
    t2 = threading.Thread(target=print_hi)  
    t1.start()
    t2.start()
    ```
    => Output :
    ```sh
    Hello      # 0,5s      Hello-1
    Hi         # 0,7s      Hi-1
    Hello      # 1,0s      Hello-2
    Hi         # 1,4s      Hi-2
    Hello      # 1,5s      Hello-3
    Hello      # 2,0s      Hello-4-end
    Hi         # 2,1s      Hi-3
    Hi         # 2,8s      Hi-4-end
    ```
> Chương trình tạo đồng hồ điện tử :
```py
import time
while True:
    localtime = time.localtime()
    result = time.strftime("%I:%M:%S %p", localtime)
    print(result)
    time.sleep(1)
```
