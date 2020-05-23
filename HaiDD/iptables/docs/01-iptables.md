# Tìm hiểu iptables

## I. Khái niệm
- Iptables là một gói phần mềm để tạo tường lửa cho máy linux của bạn nó có các chức năng lọc gói tin, nat gói tin qua đó để giúp làm nhiệm vụ bảo mật thông tin cá nhân tránh mất mát thông tin và áp dụng nhưng chính sách đổi với người sử dụng.

- iptables bao gồm 2 phần là netfilter nằm bên trong nhân Linux và iptables nằm ở vùng ngoài nhân. iptables chịu trách nhiệm giao tiếp với người dùng và sau đó đẩy rules của người dùng vào cho netfilter xử lý. netfilter thực hiện công việc lọc các gói tin ở mức IP. netfilter làm việc trực tiếp ở trong nhân của Linux nhanh và không làm giảm tốc độ của hệ thống.

- Iptables hoạt động bằng cách giao tiếp với packet filtering hooks trong Linux kernel's networking stack. Các hooks này là netfilter framework.

- iptables đơn giản chỉ là một danh sách các rules được tổ chức theo dạng bảng. Mỗi một rule chứa một loạt các classifiers (iptables matches) và một connected action (iptables target).

Các firewall software khác chỉ đơn giản là sử dụng lại cơ chế hoặc cung cấp GUI interface để người dùng thao tác với iptables.

**Các tính năng chính**

- stateless packet filtering (IPv4 and IPv6)
- stateful packet filtering (IPv4 and IPv6)
- all kinds of network address and port translation, e.g. NAT/NAPT (IPv4 and IPv6)
- flexible and extensible infrastructure
- multiple layers of API's for 3rd party extensions

**stateful filter**: sẽ giữ 1 danh sách các connections đã được thiết lập, nó được cho là có hiệu quả hơn trong việc phát hiện các gói tin giả mạo và có thể thực hiện một loạt các functions của IPsec như tunnels và encryption.

**stateless filter**: không giữ danh sách ấy, mọi packet đều được process một cách độc lập với nhau. Nó được cho là sẽ xử lí gói tin nhanh hơn.

**Người dùng có thể làm gì với iptables?**

- Xây dựng một hệ thống tường lửa cho hệ thống dựa trên stateless và stateful packet filtering
- Triển khai một cụm cluster stateless và stateful firewall
- Dùng NAT và masquerading để chia sẻ kết nối internet
- Dùng NAT để xây dựng transparent proxies
- Thực hiệm một số tác vụ với packet như thay đổi TOS/DSCP/ECN trong IP header

## II. Sự khác biệt giữa iptables với Firewalld
Firewalld là phiên bản firewall mới mặc định được sử dụng trong các phiên bản RHEL 7 để thay thế cho interface của iptables. Về bản chất, nó vẫn kết nối tới netfilter kernel code. Firewalld tập trung chủ yếu vào việc cải thiện vấn đề quản lí rules bằng cách cho phép thay đổi cấu hình mà không bị mất các kết nối hiện tại.

<img src= "..\images\Screenshot_1.png">

Như vậy cả hai đều sử dụng iptables tool để giao tiếp với kernel packet filter.

Tuy vậy, trong khi iptables service lưu cấu hình tại `/etc/sysconfig/iptables` và `/etc/sysconfig/ip6tables` thì firewalld lại lưu nó dưới dạng một loạt các file XML trong `/usr/lib/firewalld/` và `/usr/lib/firewalld/`

**Lưu ý**: `/etc/sysconfig/iptables` không tồn tại nếu chưa cài đặt iptables service bởi mặc định firewalld mới là dịch vụ được cài đặt.

Đối với iptables, mỗi một thay đổi đồng nghĩa với việc hủy bỏ toàn bộ các rules cũ và load lại một loạt các rules mới trong file `/etc/sysconfig/iptables`. Trong khi đó với firewalld, chỉ những thay đổi mới được applied. Vì thế firewalld có thể thay đổi cài đặt trong thời gian runtime mà không làm mât bất cứ kết nối nào.

## III. Cài đặt iptables
Đối với các phiên bản CentOS/RHEL7 trở lên, firewalld đã được dùng để thay thế cho iptables. Tuy nhiên, ta vẫn có thể cài đặt và sử dụng iptables thay cho firewalld.

**Lưu ý**: Chỉ nên dùng 1 trong 2 service này. (hoặc là dùng iptables, hoặc là dùng firewall)

1. Cài đặt packages iptables
    ```
    yum install -y iptables-services
    ```

2. Disable firewalld service
    ```
    systemctl stop firewalld
    systemctl disable firewalld
    ```

3. Cho phép iptables service khởi động cùng hệ thống và khởi chạy nó
    ```
    systemctl enable iptables
    systemctl start iptables
    ```
4. Tiếp theo ta cần cấu hình cho iptables để có thể lưu lại các rule đã tạo ra khi ta restart lại iptables bằng cách thực hiện như sau:
    ```
    vi /etc/sysconfig/iptables-config
    ```
    tìm đến 2 dòng có nội dung:

    ```
    IPTABLES_SAVE_ON_STOP="no"
    IPTABLES_SAVE_ON_RESTART="no"
    ```
    ta đổi các giá trị `no` thành `yes` sau đó lưu lại để hoàn tất.
    ```
    IPTABLES_SAVE_ON_STOP="yes"
    IPTABLES_SAVE_ON_RESTART="yes"
    ```

**Một số lưu ý đối với iptables, firewalld và ufw**
- Đối với CentOS/RHEL 7, khi bạn tắt firewalld (mặc định) hoặc tắt iptables service. Các iptables rules cũng sẽ biến mất -> Một số service hoạt động dựa trên nó như network default của KVM (LB) cũng sẽ bị ảnh hưởng.
- Đối với Ubuntu/Debian, ufw là firewall mặc định. Tuy nhiên khi disable ufw, các iptables rules không bị mất đi. Mặc dù vậy, để có thể lưu lại các iptables rules đã cấu hình, bạn cần cài thêm gói `iptables-persistent`

## IV. Các khái niệm cơ bản
### 1. NAT
- Mỗi một kết nối trước khi được xử lý đều có địa chỉ nguồn (source ip address) và địa chỉ đích (destination ip address) được chứa trong thông tin của các gói tin. NAT trong `netfilter` đơn giản là việc thực hiện thay đổi địa chỉ đích và port theo một cách mong muốn.
- Khi các gói tin được nhận, các kết nối cũng sẽ được thực so sánh lại một lần nữa với địa chỉ đích (bao gồm cả port). Việc không phân mảnh cũng là một yêu cầu quan trọng dành cho NAT. (Nếu cần thiết, các gói tin IPv4 cũng sẽ được sắp xếp lại theo ngăn xếp giống như bình thường.)

### 2. Filtering
- Là quá trình chặn bắt gói tin theo một số tiêu chí mà ta đề ra.

- **Giả sử**: Khi một gói tin đi đến sẽ chứa các giá trị về địa chỉ IP nguồn (source address), địa chỉ IP đích (destination address) và các port tương ứng (port nguồn và port đích). Khi ta thực hiện `filtering` gói tin theo tiêu chí địa chỉ IP nguồn. Thì các gói tin có địa chỉ IP nguồn khớp với địa chỉ IP mà ta đề ra sẽ được giữ lại để chờ xử lý.

### 3. Mangle
Là quá trình bóc tách gói tin và chịu trách nhiệm thay đổi bits của QoS (Quality of Services) trong IP Header bởi vì `mangle` làm việc với các gói tin IP.

### 4. Table
- Trong kiến trúc của iptable có sử dụng các bảng để quy định các chain cùng thực hiện các chức năng trong một không gian nhất định với công việc nhất định.

- iptable cung cấp 5 loại table: 
    - NAT table
    - FILTER table
    - MANGLE table
    - RAW table
    - Security table

- Iptables thường dùng 3 bảng chính: filter, mangle, và nat.

| Table | Description |
|-------|-------------|
| NAT | dùng để NAT, thường dựa vào địa chỉ nguồn hoặc đích. Nó có 3 chains là:  OUTPUT, POSTROUTING, và PREROUTING |
| FILTER | Dùng để thiết lập policies cho các traffic vào, qua và ra khỏi hệ thống. iptables lấy đây làm table default, nếu bạn không khai báo bất cứ thông tin gì về table trong câu lệnh, iptables sẽ mặc định áp dụng nó cho filter table. Nó bao gồm các chains: FORWARD, INPUT, và OUTPUT |
| MANGLE | Dùng để thay đổi một số thông tin cụ thể của packet. Nó có các chains là : FORWARD, INPUT, OUTPUT, POSTROUTING, và PREROUTING |

### 5. Chain
- `chain` là một quy tắc xử lý các gói tin bao gồm nhiều rules có liên quan tới nhau.

- Mỗi table sẽ được tạo với một hoặc nhiều `chain`. `chain` cho phép lọc gói tin tại các điểm khác nhau. `iptable` có thể được thiết lập đối với các loại `chain` như sau:
    - `PREROUTING` : các rule thuộc chain này sẽ được áp dụng ngay sau khi gói tin vừa đi vào đến dải mạng(Network interface). chain này chỉ có thể có ở table NAT, RAW, MANGLE.
    - `INPUT` : Các rule thuộc chain này sẽ áp dụng cho các gói tin ngay trước khi gói tin đi vào hệ thống. chain này có trong table MANGLE và FILTER.
    - `OUTPUT`: Các rule thuộc chain này áp dụng ngay cho các gói tin đi ra từ hệ thống. chain có trong table MANGLE, RAW và FILTER.
    - `FORWARD`: Các rule thuộc chain này áp dụng các gói tin được chuyển tiếp qua hệ thống. chain có trong table MANGLE.
    - `POSTROUTING` : Các rule thuộc chain này áp dụng cho các gói tin tới dải mạng (Network Interface). chain này có trong table MANGLE và NAT

Hình ảnh dưới đây thể hiện thứ tự xử lý các table và chain trong khi xử lý gói tin:

<img src="..\images\Screenshot_2.png">

### 6. Rules
`rule` là một luật, hành động cụ thể xử lý gói tin ứng với mỗi trường hợp, tiêu chí mà ta đề ra.

Ta sẽ xem mỗi rule có các trường nào. `iptables --list -v`

<img src="..\images\Screenshot_5.png">

Như trên hình, ta thấy các cột: target, prot, opt, in, out, source, destination
- `target` : hành động sẽ thực thi cho mỗi rule
- `prot` : viết tắt của protocol. Tức là các giao thức áp dụng thực thi rule này. Có 3 lựa chọn : `all`, `tcp`, `udp` (các giao thức như ssh, ftp, ... đều là kiểu giao thức TCP)
- `opt` : Ít khi được sử dụng, nó mô tả các tùy chọn có liên quan đến IP
- `in` : thiết bị mạng nhận kết nối vào được áp rule. Ví dụ : lo, virbr0, eth0, ...
- `out` : thiết bị mạng gửi yêu cầu kết nối ra ngoài được áp rule. Ví dụ : any, br0, ...
- `source` : địa chỉ nguồn được áp rule
- `destination` : địa chỉ đích được áp rule


### Match
Có vô số các match có thể sử dụng với iptables. Ví dụ như Internet Protocol (IP) matches (protocol, source, hoặc destination address).

### 7. Port
- `port` là một vị trí nào đó mà gói tin TCP/UDP vào và ra trong thiết bị. Một địa chỉ IP có rất nhiều `port`
- Tất cả các `port` đều được định danh bởi các con số `-port number`
- Một vài dịch vụ và port nó sử dụng
    |Services|Port number|
    |-|-|
    |DNS|53|
    |HTTP|80|
    |FTP|20/21|
    |SSH|22|
    |Telnet|23|
    |ICMP|5813|
    |POP3|110|
    |SMTP|25|

### 8. Target
- Mỗi một `chain` là một danh sách các luật có thể được thiết lập cho các gói tin. Mỗi một `rule` sẽ cần phải khai báo những gì cần phải làm với gói tin được gọi là `target`.
- Nói một cách đơn giản thì các hành động áp dụng cho các gói tin được gọi là `target` . Đối với những gói tin đúng theo `rule` mà chúng ta đặt ra thì các hành động (`target`) có thể thực hiện được đó là:
    - `ACCEPT` : chấp nhận gói tin, cho phép gói tin đi qua hay đi vào hệ thống
    - `DROP` : loại bỏ gói tin, không phản hồi lại gói tin giống như việc gói tin đó được gửi đến một hệ thống không tồn tại.
    - `RETURN` : dừng thực thi và áp dụng rule tiếp theo trong chain hiện tại đối với gói tin. Vệc kiểm soát sẽ được trả về đối với chain đang gọi
    - `REJECT` : Thực hiện loại bỏ gói tin và gửi lại gói tin phản hồi thông báo lỗi. **Ví dụ**: 1 bản tin “connection reset” đối với gói TCP hoặc bản tin “destination host unreachable” đối với gói UDP và ICMP.
    - `LOG`: Chấp nhận gói tin và có ghi lại log.

## V. Cách hoạt động của iptables
Cấu trúc cơ bản của iptable

<img src="..\images\Screenshot_3.png">

Iptables hoạt động bằng cách so sánh network traffic với một danh sách các rules. Rule định nghĩa các tính chất mà packet cần có để match với rule kèm theo những hành động sẽ được thực thi với những matching packets.

Có rất nhiều các options để thiết lập rule sao cho nó match với packets đi qua như protocol, ip, interface... Khi một packet match, target được thực thi. Target có thể là quyết định cuối cùng áp dụng đối với packet ví dụ như ACCEPT hoặc DROP. Nó cũng có thể chuyển packet tới chain khác để xử lí hoặc đơn giản log lại.

Các rules này được gộp lại thành nhóm gọi là chains. Chains là danh sách các rules và nó sẽ được check lần lượt. Khi một packet match với 1 rules, nó sẽ được thực thi với hành động tương ứng và không cần phải check với các rules còn lại.

Mỗi chain có thể có một hoặc nhiều rule nhưng mặc định nó sẽ có 1 policy. Trong trường hợp packets không match với bất cứ rules nào, policy sẽ được thực thi, bạn có thể accept hoặc drop nó.

## VI. Quá trình xử lí gói tin trong iptable
### 1. Những gói tin có đích đến là server của bạn

| Step | Table | Chain |Mô tả |
|------|-------|-------|------|
| 1 | | | Trên đường mạng (Internet) |
| 2 | | | Tới interface |
| 3 | raw | PREROUTING | Chain này được dùng để kiểm soát gói tin trước khi thiết lập giám sát đường truyền (connection tracking). |
| 4 | | | Thiết lập giám sát đường truyền |
| 5 | mangle | PREROUTING | Dùng để mangle gói tin vd như thay đổi TOS... |
| 6 | nat | PREROUTING | Sử dụng chủ yếu cho DNAT, không dùng filter ở chain này vì một số gói tin có thể bypassed |
| 7 | | | Các routing decision được thiết lập để xác định đích đến  gói tin |
| 8 | mangle | INPUT | mangle gói tin sau khi route nhưng vẫn chưa được gửi tới process trên máy |
| 9 | filter | INPUT | Đây là nơi ta filter với mọi gói tin được gửi đến server. Lưu ý rằng mọi packets có đích đến là server đều phải đi qua chain này |
| 10 | | | Quá trình xử lí trên máy (Local process or application) |

### 2. Các gói tin bắt đầu từ server của bạn

| Step | Table | Chain | |
|------|-------|-------|-|
| 1 | | | Local process/application |
| 2 | | | Routing decision được đưa ra. Source address, interface nào sẽ được sử dụng... |
| 3 | raw | OUTPUT | đây là nơi bạn có thể đưa ra một số quyết định trước khi gói tin được thiết lập trạng thái giám sát |
| 4 | | | Thiết lập trạng thái giám sát |
| 5 | mangle | OUTPUT | Nơi ta có thể mangle packets |
| 6 | nat | OUTPUT | Sử dụng để nat các gói tin đi từ phía firewall ra ngoài |
| 7 | | | Thêm routing decision bởi có thể quá trình mangle và nat làm thay đổi đích đến của gói tin |
| 8 | filter | OUTPUT | Nơi ta filter các gói tin đi từ phía Local |
| 9 | mangle | POSTROUTING | Được sử dụng chủ yếu nếu ta muốn mangle gói tin sau khi nó được route nhưng chưa rời khỏi host |
| 10 | nat | POSTROUTING | Nơi ta SNAT |
| 11 | | | Đi ra một interface |
| 12 | | | Ra đường truyền |

### 3. Các gói tin được forward

| Step | Table | Chain | |
|------|-------|-------|-|
| 1 | | | Trên đường mạng (Internet) |
| 2 | | | Tới interface |
| 3 | raw | PREROUTING | Chain này được dùng để kiểm soát gói tin trước khi thiết lập giám sát đường truyền (connection tracking). |
| 4 | | | Thiết lập giám sát đường truyền |
| 5 | mangle | PREROUTING | Dùng để mangle gói tin vd như thay đổi TOS... |
| 6 | nat | PREROUTING | Sử dụng chủ yếu cho DNAT, không dùng filter ở chain này vì một số gói tin có thể bypassed |
| 7 | | | Các routing decision được thiết lập để xác định đích đến  gói tin |
| 8 | mangle | FORWARD | dùng để mangle các packet sau khi routing decision được đưa ra nhưng trước routing decision cuối cùng |
| 9 | filter | FORWARD | sau khi đã được route thì chỉ những forwarded packets mới có thể tới chain này, đây là nơi ta filter |
| 10 | mangle | POSTROUTING | dùng để mangle các gói tin sau khi tất cả routing decision được thiết lập nhưng vẫn chưa ra khỏi host |
| 11 | nat | POSTROUTING | dùng cho SNAT |
| 12 | | | Đi ra một interface |
| 13 | | | Ra đường truyền |

Dưới đây là mô hình miêu tả quá trình gói tin traverse qua iptables

<img src="..\images\Screenshot_6.png">

Lưu ý mọi gói tin sẽ đều phải đi qua một hoặc nhiều path trong mô hình trên. Nếu bạn có DNAT cho nó quay về network ban đầu thì nó cũng phải đi hết các chain.

## VII. State Machine
Về bản chất, có thể coi iptables là một stateful packets filtering firewall. Nó có cơ chế giám sát các kết nối đi qua.

Với iptables, có 4 trạng thái của các kết nối đó là: `NEW`, `ESTABLISHED`, `RELATED` và `INVALID`

Iptables sử dụng một framework trong kernel có tên gọi là conntrack, nó có thể được load như một module hoặc cũng có thể là 1 phần của kernel. Tất cả các giám sát kết nối đều được thực hiện ở chain `PREROUTING`, trừ những packet từ local đi ra thì được kiểm soát bởi chain `OUTPUT`.

**Ví dụ:** ta có 1 gói tin gửi đi, nó sẽ có trạng thái `NEW` ở chain `OUTPUT`, khi nó được phản hồi về, trạng thái của nó ở chain `PREROUTING` sẽ là `ESTABLISHED`.

File `/proc/net/nf_conntrack` chứa toàn bộ những entries trong conntrack database.

<img src="..\images\Screenshot_8.png">

```
ipv4     2 tcp      6 430558 ESTABLISHED src=192.168.37.10 dst=192.168.37.15 sport=59576 dport=22 src=192.168.37.15 dst=192.168.37.10 sport=22 dport=59576 [ASSURED] mark=0 secctx=system_u:object_r:unlabeled_t:s0 zone=0 use=2
```

**Ví dụ:** trên cho ta biết conntrack module quản lí các connection cụ thể như thế nào. Đầu tiên ta có protocol, ở đây là tcp. Tiếp theo, cùng giá trị nhưng ở dạng decimal coding. Sau đó là khoảng thời gian mà conntrack entry này có thể tồn tại. Sau đó chính là trạng thái, ở đây là `ESTABLISHED`. Tiếp đó ta thấy source cùng với destination IP, port kèm theo những gì chúng ta mong đợi của packet trả về (thông số được đảo ngược lại)

`[ASSURED]` cho ta biết rằng entry này sẽ được bảo đảm không bị xóa kể cả khi ta đạt đến con số maximum các entries có thể lưu. Con số này phụ thuộc vào số ram bạn có. Mặc định thì 128MB sẽ lưu được khoảng 8192 entries. Bạn có thể xem con số tối đa và sửa nó tại `/proc/sys/net/netfilter/nf_conntrack_max`

### User-land states

|State|Mô tả|
|-----|-----|
|`NEW`|Trạng thái này cho ta biết đó là packet đầu tiên mà conntrack module thấy (những packet có cờ SYN)|
|`ESTABLISHED`|Điều kiện để có trạng thái này đơn giản là 1 host gửi packet đi và nhận lại reply từ host khác|
|`RELATED`|Kết nối ở trạng thái này khi nó liên quan tới kết nối khác ở trạng thái `ESTABLISHED`. Đầu tiên ta có 1 kết nối đã `ESTABLISHED`, sau đó kết nối này tiếp tục tạo ra một kết nối khác ra bên ngoài kết nối chính. Kết nối mới này được coi là `RELATED`|
|`INVALID`|Có nghĩa rằng packet không thể được xác nhận hoặc nó không có bất cứ trạng thái nào, thông thường những paket như này sẽ bị drop|
|`UNTRACKED`|Đây là những packet được đánh dấu trong bảng raw với target là `NOTRACK`. Sau đó nó sẽ được đánh dấu state là `UNTRACKED`|