# Tìm hiểu về `dig` command

Với lệnh dig, bạn có thể truy vấn thông tin về các bản ghi DNS, bao gồm: host addresses, mail exchanges, và name servers. Đây là công cụ được các quản trị viên hệ thống sử dụng phổ biến nhất để khắc phục sự cố DNS vì tính linh hoạt và dễ sử dụng của nó.

# I. Cài đặt gói để sử dụng lệnh `dig` trên Linux
### Ubuntu
```
apt-get install dnsutils
```

### CentOS 7
```
yum install bind-utils
```

### CentOS 8
```
dnf install bind-utils
```

### Kiểm tra version của `dig` : 
```
dig -v
```

# II. Cú pháp
Cú pháp đơn giản của lệnh `dig`:
```
dig [server] [name] [type]
```

**Trong đó:**
- `[server]` - địa chỉ IP hoặc hostname của name server sẽ dùng để thực hiện truy vấn.
    - Nếu bạn cung cấp cho đối số server thông tin về hostname thì nó sẽ giải quyết hostname trước khi tiếp tục truy vấn name server.

    - Đây là tùy chọn nên bạn cũng có thể không khai báo ở đây, trong trường hợp không khai báo thì `dig` sẽ lấy thông tin này trong file `/etc/resolv.conf`.

- `[name]` - tên của bản ghi resource sẽ được truy vấn.

- `[type]` - loại truy vấn được yêu cầu bởi dig. Nó có thể là 1 trong số các bản ghi: A, MX, SOA,...Nếu không có bản ghi nào được chỉ định thì dig sẽ mặc định đó là bản ghi A.


# III. Tra cứu DNS cho 1 tên miền
```
dig google.com
```
**Output**

<img src="..\images\Screenshot_23.png">

**Giải thích output:**
- Dòng đầu tiên của đầu ra hiển thị version đã cài đặt và truy vấn được gọi. Dòng thứ hai hiển thị các tùy chọn(theo mặc định chỉ cmd).
    ```
    ; <<>> DiG 9.11.4-P2-RedHat-9.11.4-9.P2.el7 <<>> google.com
    ;; global options: +cmd
    ```

    Nếu bạn không muốn những dòng này xuất hiện ở output, có thể sử dụng tùy chọn `+nocmd` ở ngay sau câu lệnh `dig`.

- Phần tiếp theo, dòng đầu tiên của phần này là tiêu đề, bao gồm `opcode` và trạng thái của hành động. Trong trường hợp này, trạng thái `NOERROR` có nghĩa là yêu cầu truy vấn truy vấn DNS không gặp lỗi.
    ```
    ;; Got answer:
    ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 2006
    ;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 4, ADDITIONAL: 9
    ```

    Bạn cũng có thể cho phép không hiển thị phần này ở output bằng cách sử dụng tùy chọn `+nocomments`, đồng thời nó cũng sẽ disable output của 1 vài phần header khác.

- Phần `OPT` được hiển thị theo mặc định chỉ trên các phiên bản mới hơn.
    ```
    ;; OPT PSEUDOSECTION:
    ; EDNS: version: 0, flags:; udp: 4096
    ```

- Phần `QUESTION` là phần mà lệnh `dig` hiển thị truy vấn của chúng ta. Theo mặc định, dig sẽ yêu cầu bản ghi A.
    ```
    ;; QUESTION SECTION:
    ;google.com.                    IN      A
    ```

    Bạn có thể disable output của phần này bằng cách sử dụng tùy chọn `+noquestion`

- Phần `ANSWER` cung cấp cho chúng ta tên miền `google.com.` trỏ đến địa chỉ IP `172.217.161.174`
    ```
    ;; ANSWER SECTION:
    google.com.             300     IN      A       172.217.161.174
    ```
    Disable phần output này với tùy chọn `+noanswer` nếu bạn cần.

- Phần `AUTHORITY` nói cho chúng ta biết những server nào là `authority` để trả lời truy vấn DNS về truy vấn tên miền.
    ```
    ;; AUTHORITY SECTION:
    google.com.             172799  IN      NS      ns3.google.com.
    google.com.             172799  IN      NS      ns1.google.com.
    google.com.             172799  IN      NS      ns4.google.com.
    google.com.             172799  IN      NS      ns2.google.com.
    ```
    Disable nó bằng tùy chọn `+noauthority`

- Phần `ADDITIONAL` cho chúng ta thông tin về địa chỉ IP của các `authoritative` DNS server
    ```
    ;; ADDITIONAL SECTION:
    ns2.google.com.         172799  IN      A       216.239.34.10
    ns1.google.com.         172799  IN      A       216.239.32.10
    ns3.google.com.         172799  IN      A       216.239.36.10
    ns4.google.com.         172799  IN      A       216.239.38.10
    ns2.google.com.         172799  IN      AAAA    2001:4860:4802:34::a
    ns1.google.com.         172799  IN      AAAA    2001:4860:4802:32::a
    ns3.google.com.         172799  IN      AAAA    2001:4860:4802:36::a
    ns4.google.com.         172799  IN      AAAA    2001:4860:4802:38::a
    ```
    Tùy chọn `+noadditional` sẽ giúp bạn disable phần này.

- Phần cuối của OUTPUT bao gồm các số liệu đầu ra của truy vấn
    ```
    ;; Query time: 587 msec
    ;; SERVER: 10.10.34.161#53(10.10.34.161)
    ;; WHEN: Thu Mar 05 09:14:42 +07 2020
    ;; MSG SIZE  rcvd: 303
    ```
    Bạn có thể disable phần này với tùy chọn `+nostats`

# IV. Sử dụng `dig` với các truy vấn ngắn
## 1. Truy vấn lấy địa chỉ IP
```
dig +short <domain>
```
**Ví dụ:**
```
dig +short google.com
172.217.161.174
```
**Output**

<img src="..\images\Screenshot_24.png">

- Có thể lấy kết quả chi tiết hơn, ta có thể dùng 2 tùy chọn sau: `+noall` và `+answer`
    ```
    dig google.com +noall +answer
    ```
    **Output**

    <img src="..\images\Screenshot_25.png">

    **Trong đó:**
    - `+noall` : tắt tất cả các section
    - `+answer` : chỉ mở với section ANSWER

## 2. Truy vấn với name server cụ thể
- Theo mặc định nếu khi sử dụng lệnh dig mà không chỉ rõ name server nào thì server sẽ sử dụng name server được khai báo trong file `/etc/resolv.conf`

- Để chỉ định name server mà truy vấn sẽ thực hiện, sử dụng biểu tượng `@ + <địa chỉ IP/hostname>`

**Ví dụ:** Truy vấn name server Google có địa chỉ là `8.8.8.8` để lấy thông tin về tên miền `google.com` 
```
dig google.com @8.8.8.8
```
**Output**

<img src="..\images\Screenshot_26.png">

## 3. Truy vấn theo bản ghi
`dig` cho phép thực hiện bất kì truy vấn hợp lệ nào bằng cách nối thêm loại bản ghi vào cuối truy vấn.

### [1]. Truy vấn bản ghi A
- Để có danh sách địa chỉ cho 1 tên miền, sử dụng tùy chọn `a`

**Ví dụ:**
    ```
    dig +nocmd google.com a +noall +answer
    ```
**Output**:
    
<img src="..\images\Screenshot_27.png">

- Tuy nhiên, bạn cũng có thể khôgn cần dùng tùy chọn `a`, vì theo mặc định, nếu không có bản ghi nào được chọn, hệ thống mặc định chọn truy vấn bản ghi A

### [2]. Truy vấn bản ghi CNAME
- Sử dụng tùy chọn `cname`

**Ví dụ:**

```
dig +nocmd mail.google.com cname +noall +answer
```
**Output:**

<img src="..\images\Screenshot_28.png">

### [3]. Truy vấn bản tin TXT
- Sử dụng tùy chọn `txt`

**Ví dụ:**
```
dig +nocmd google.com txt +noall +answer
```
**Output:**

<img src="..\images\Screenshot_29.png">

### [4]. Truy vấn bản ghi MX
- Sử dụng tùy chọn `mx`

**Ví dụ:**
```
dig +nocmd google.com mx +noall +answer
```

**Output:**

<img src="..\images\Screenshot_30.png">

### [5]. Truy vấn bản ghi NS
- Sử dụng tùy chọn `ns`

**Ví dụ:**
```
dig +nocmd google.com ns +noall +answer
```

**Output**

<img src="..\images\Screenshot_31.png">

### [6]. Truy vấn bản ghi SOA
- Sử dụng tùy chọn `soa`

**Ví dụ:**
```
dig +nocmd google.com soa +noall +answer
```

**Output**

<img src="..\images\Screenshot_32.png">

### [7]. Truy vấn bản ghi TTL
- Sử dụng tùy chọn `ttl`

**Ví dụ:**
```
dig +nocmd google.com ttl +noall +answer 
```

**Output:**

<img src="..\images\Screenshot_33.png">

### [8]. Truy vấn tất cả bản ghi
- Sử dụng tùy chọn `any`

**Ví dụ:**
```
dig +nocmd google.com any +noall +answer
```

**Output:**

<img src="..\images\Screenshot_34.png">

### [9]. Tra cứu DNS ngược
- Để truy vấn tên máy chủ được liên kết với một địa chỉ IP cụ thể, hãy sử dụng tùy chọn `-x`.

**Ví dụ:** Tra cứu IP `31.13.95.36` thành tên miền
```
dig -x 31.13.95.36 +noall +answer 
```
**Output**

<img src="..\images\Screenshot_35.png">


### [10]. Truy vấn số lượng lớn tên miền
- Nếu bạn muốn truy vấn một số lượng lớn tên miền, bạn có thể thêm chúng vào một tệp và sử dụng tùy chọn `-f` để truy vấn.

**Ví dụ**: Ta sẽ sử dụng các tên miền được liệt kê trong file `domain.txt`

    ```
    dig -f domain.txt +noall +answer
    ```
**Output**:

<img src="..\images\Screenshot_36.png">

### [11]. Truy vấn DNS bằng TCP
Theo mặc định thì lệnh dig truy vấn DNS qua udp, để có thể dùng lệnh dig truy vấn DNS qua tcp chúng ta thực hiện như sau:
```
dig +tcp [domain]
```

**Ví dụ:**
```
dig +tcp dns-server.dangdohai.com
```
<img src="..\images\Screenshot_37.png">

### [12]. Điều chỉnh mặc định với tệp `~/.digrc`
- Chúng ta có thể tạo tệp `.digrc` trong thư mục chính để bao gồm tùy chọn mà chúng ta muốn lệnh dig thực hiện. Chúng ta có thể chỉ định các tùy chọn khác nhau trong tệp `~/.digrc` sẽ luôn tự động chạy khi sử dụng lệnh dig.

**Ví dụ:**
Ta thêm tùy chọn `+short` vào file `~/.digrc` và thực hiện lệnh `dig`:

<img src="..\images\Screenshot_38.png">