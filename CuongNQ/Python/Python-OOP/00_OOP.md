# Lập trình hướng đối tượng 
## **1) Khái niệm** <img src=https://i.imgur.com/5yjNoym.png align=right width=40%>
- **Lập trình hướng đối tượng** ( ***object-oriented programming*** - **OOP** ) , là kĩ thuật lập trình hỗ trợ công nghệ đối tượng . **OOP** được xem là giúp tăng năng suất , đơn giản hóa độ phức tạp khi bảo trì cũng như mở rộng phần mềm bằng cách cho phép lập trình viên tập trung vào các đối tượng phần mềm ở bậc cao hơn . 
## **2) Các đặc tính của lập trình hướng đối tượng**
- Lập trình hướng đối tượng nói chung có các đặc tính sau đây :
    - Tính đóng gói ( **Encapsulation** )
    - Tính kế thừa ( **Inheritance** )
    - Tính đa hình ( **Polymorphism** )
    - Tính trừu tượng ( **Abstraction** )
### **2.1) Tính đóng gói ( **Encapsulation** )**
- Là cách để che dấu những tính chất xử lý bên trong của **object** , những **object** khác không thể tác động trực tiếp làm thay đổi trạng thái , chỉ có thể tác động thông qua các method public của **object** đó .
- **VD :**
    ```py
    class Computer:

        def __init__(self):
            self.__maxprice = 900

        def sell(self):
            print("Selling Price: {}".format(self.__maxprice))

        def setMaxPrice(self, price):
            self.__maxprice = price

    c = Computer()
    c.sell()

    # change the price
    c.__maxprice = 1000
    c.sell()

    # using setter function
    c.setMaxPrice(1000)
    c.sell()
    ```
    => Output :
    ```
    Selling Price: 900
    Selling Price: 900
    Selling Price: 1000
    ```
    => Nhận xét : hàm `__init__` được sử dụng để lưu trữ thuộc tính `__maxprice` . Thử thay đổi giá trị `__maxprice` tuy nhiên không thể thay đổi được do `__maxprice` là một thuộc tính private . Chỉ có thể thay đổi được bằng cách gán nó cho 1 biến khác qua hàm `setMaxPrice` .
### **2.2) Tính kế thừa ( **Inheritance** )**
- Là kỹ thuật cho phép kế thừa lại những thuộc tính và phương thức mà một **object** khác đã có , giúp tránh việc code lặp dư thừa mà chỉ xử lý công việc tương tự .
- Có 2 loại kế thừa :
    - **Kế thừa một cấp** ( *Single-level Inheritance* ) : Với một **parent class** và một **child class** .
    - **Kế thừa nhiều cấp** ( *Multiple-level Inheritance* ) : Kế thừa nhiều **class** .
- **VD :**
    ```py
    # parent class
    class Bird:
        
        def __init__(self):
            print("Bird is ready")

        def whoisThis(self):
            print("Bird")

        def swim(self):
            print("Swim faster")

    # child class
    class Penguin(Bird):

        def __init__(self):
            # call super() function
            super().__init__()
            print("Penguin is ready")

        def whoisThis(self):
            print("Penguin")

        def run(self):
            print("Run faster")

    peggy = Penguin()
    peggy.whoisThis()
    peggy.swim()
    peggy.run()
    ```
    => Output :
    ```
    Bird is ready
    Penguin is ready
    Penguin
    Swim faster
    Run faster
    ```
    => Nhận xét : 
### **2.3) Tính đa hình ( **Polymorphism** )**
- Là một **object** thuộc các **class** khác nhau có thể hiểu cùng một thông điệp theo cách khác nhau .
- Có 2 cách để thể hiện tính đa hình :
    - **Method Overloading** ( *compile time polymorphism* ) : là cách nạp chồng các method có cùng tên nhưng khác tham số .
    - **Method Overriding** ( *run time polymorphism* ) : đây là một phương pháp được ghi đè lại các method ảo của một **parent class** nào đó ( được khai báo bằng từ khóa `virtual` ) . Để thể hiện phương pháp này cần dùng 2 từ khóa :
        - `virtual` : từ khoá dùng để khai báo 1 phương thức ảo ( có thể ghi đè được ) .
        - `override` : từ khoá dùng để đánh dấu phương thức ghi đè lên phương thức của **parent class** .
- **VD :**
    ```py
    class Parrot:

        def fly(self):
            print("Parrot can fly")
        
        def swim(self):
            print("Parrot can't swim")

    class Penguin:

        def fly(self):
            print("Penguin can't fly")
        
        def swim(self):
            print("Penguin can swim")

    # common interface
    def flying_test(bird):
        bird.fly()

    #instantiate objects
    blu = Parrot()
    peggy = Penguin()

    # passing the object
    flying_test(blu)
    flying_test(peggy)
    ```
    => Output :
    ```
    Parrot can fly
    Penguin can't fly
    ```
    => Nhận xét : chúng ta tạo ra 2 class `Parrot` và `Penguin` . Mỗi class này đều có một phương thức `fly()` . Tuy nhiên giá trị trong 2 phương thức này là khác nhau . Để cho phép tính đa hình , ta tạo ra 1 interface chung với tên là `flying_test` có thể đưa vào bất kỳ **object** nào .
### **2.4) Tính trừu tượng ( **Abstraction** )**
- Là phương pháp trừu tượng hóa định nghĩa lên những hành động, tính chất của loại **object** nào đó cần phải có .
- Có 2 phương pháp để triển khai tính trừu tượng :
    - **Abstract class** : trong **abstract class** có 2 loại method :
        - **abstract method** : là method rỗng không thực hiện gì .
        - **method thường** : là vẫn có logic trả về data hoặc thực thi hành động nào đó, nó được sử dụng cho mục đích dùng chung .
    - **Interface** : Khá giống với **abstract class** nhưng **interface** không phải là **class** , trong **interface** chỉ  có khai báo những method/properties trống không có thực thi, thực thi sẽ được thể hiện trong các lớp kế thừa, **interface** giống như một cái khung mẫu để các lớp implement và follow.