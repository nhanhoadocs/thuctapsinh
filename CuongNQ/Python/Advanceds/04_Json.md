# Python JSON
## **1) Giới thiệu**
- **JSON ( JavaScript Object Notation )** là một định dạng file `text` dễ đọc , dễ hiểu để lưu trữ và trao đổi dữ liệu .
- **Python** có một **package** được tích hợp sẵn là `json` , có thể được sử dụng để làm việc với kiểu dữ liệu `JSON` .
- Import module `json` trước khi sử dụng :
    ```py
    import json
    ```
## **2) Chuyển đổi định dạng dữ liệu từ JSON sang Python - Parse JSON**
- Nếu có một chuỗi `JSON` , có thể sử dụng phương thức `loads()` để chuyển đổi về **Python** . Kết quả sau khi chuyển đổi sẽ ở dạng `dict` .
- **VD :**
    ```py
    import json
    # JSON :
    x = '{"name": "Cuong", "age": "22", "city": "Ha Noi"}'
    # parse x :
    y = json.loads(x)
    # Kết quả ở dạng dict
    print(y["age"])
    ```
    => Output :
    ```
    22
    ```
## **3) Chuyển đổi Python sang định dạng JSON**
- Nếu có một **object Python** , có thể chuyển đổi sang chuỗi `JSON` bằng phương thức `dumps()` .
- **VD1 :**
    ```py
    import json
    # Object Dict
    x = {"name": "Cuong", "age": "22", "city": "Ha Noi"}
    # Convert
    y = json.dumps(x)
    # Kết quả :
    print(y)
    ```
    => Output :
    ```
    {"name": "Cuong", "age": "22", "city": "Ha Noi"}
    ```
- **Python** có thể chuyển đổi định dạng của các **object** sau thành `JSON` :

    | **Python** | **JSON** |
    |------------|----------|
    | `dict` | Object |
    | `list` | Array |
    | `tuple` | Array |
    | `str` | String |
    | `int` | Number |
    | `float` | Number |
    | `True` | true |
    | `False` | false |
    | `None` | null |

- **VD2 :** 
    ```py
    import json

    x = {
    "name": "John",                              
    "age": 30,
    "married": True,
    "divorced": False,
    "children": ("Ann","Billy"),
    "pets": None,
    "cars": [
        {"model": "BMW 230", "mpg": 27.5},
        {"model": "Ford Edge", "mpg": 24.1}
    ]
    }

    print(json.dumps(x))
    ```
    => Output :
    ```
    {"name": "John", "age": 30, "married": true, "divorced": false, "children": ["Ann","Billy"], "pets": null, "cars": [{"model": "BMW 230", "mpg": 27.5}, {"model": "Ford Edge", "mpg": 24.1}]}
    ```
## **4) Chuẩn hóa định dạng file JSON**
- File trên tuy trả về một chuỗi `JSON` , nhưng không phải ở định dạng dễ đọc , không có những phần thụt vào và xuống dòng .
- Cú pháp phương thức `dumps()` :
    ```py
    json.dumps(var, indent=a, separators=(", ", ": "), sort_keys=True
    ```
    - Trong đó :
        - `var` là **object Python** cần chuyển đổi thành `JSON`
        - `indent=a` : giá trị tùy chọn. Thụt đầu dòng các **object** so với lề là `a` khoảng trắng . Thường đặt `indent=4`
        - `separators=(", ", ": ")` : giá trị mặc định . Sử dụng một `dấu phẩy` + `khoảng trắng` để ngăn cách mỗi **object** , `dấu :` + `khoảng trắng` để ngăn cách các `key` trong các giá trị .
        - `sort_keys=True` : giá trị tùy chọn . Sắp xếp các `key` theo thứ tự bảng chữ cái .
- **VD :**
    ```py
    import json

    x = {
    "name": "John",
    "age": 30,
    "married": True,
    "divorced": False,
    "children": ("Ann","Billy"),
    "pets": None,
    "cars": [
        {"model": "BMW 230", "mpg": 27.5},
        {"model": "Ford Edge", "mpg": 24.1}
    ]
    }
    print(json.dumps(x, indent=4, sort_keys=True))
    ```
    => Output :
    ```json
    {
        "age": 30,
        "cars": [
            {
                "model": "BMW 230",
                "mpg": 27.5
            },
            {
                "model": "Ford Edge",
                "mpg": 24.1
            }
        ],
        "children": [
            "Ann",
            "Billy"
        ],
        "divorced": false,
        "married": true,
        "name": "John",
        "pets": null
    }
    ```