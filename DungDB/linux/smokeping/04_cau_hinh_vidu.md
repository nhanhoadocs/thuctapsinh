# Các ví dụ

Các vị dụ này khác nhau ở phần Target (mục tiêu) và Probe (thăm dò).

## VD1

**Cấu hình Probe**

    *** Probes ***
    +FPing
    binary = /usr/bin/fping

**Giải thích Probe**

Ở đây có 1 probe là fping, ping 4 host

Probe fping sử dụng các thông số mặc định, một số được cung cấp bởi database ("steps" và "ping"), một số được cung cấp bởi probe module.

**Cấu hình target**

    *** Targets ***
    probe = FPing
    
    menu = Top
    title = Network Latency Grapher
    remark = Welcome to this SmokePing website.
    
    + mysite1
    menu = Site 1
    title = Hosts in Site 1
    
    ++ myhost1
    host = myhost1.mysite1.example
    ++ myhost2
    host = myhost2.mysite1.example
    
    + mysite2
    menu = Site 2
    title = Hosts in Site 2
    
    ++ myhost3
    host = myhost3.mysite2.example
    ++ myhost4
    host = myhost4.mysite2.example

**Giải thích**

Các host được đặt ở 2 site, mỗi site 2 host. Cấu hình chia thành phần site ('+') và phần host ('++')

## VD2

**Cấu hình Probe**

    *** Probes ***
    + FPing
    binary = /usr/bin/fping
    packetsize = 1000
    
    + DNS
    binary = /usr/bin/dig
    lookup = name.example
    pings = 5
    step = 180
    
    + EchoPingHttp
    pings = 5
    url = /test-url

**Giải thích Probe**

Ở đây ta có 3 probe:  FPing cho ICMP pings thông thường, DNS để đo độ trễ của máy chủ và EchoPingHttp cho web servers.

Probe FPing chạy với các tham số mặc định, ngoại trừ kích thước gói ICMP là 1000 byte thay vì 56 byte mặc định.

Các đầu dò DNS và EchoPingHttp đã được cấu hình chỉ thực hiện 5 truy vấn (pings) thay vì 20 mặc định (hoặc bất cứ điều gì được chỉ định trong phần Cơ sở dữ liệu). Tuy nhiên, các truy vấn DNS được thực hiện thường xuyên hơn: 5 truy vấn cứ sau 3 phút thay vì cứ sau 5 phút.

**Cấu hình Target**

    *** Targets ***
    probe = FPing
    menu = Top
    title = Network Latency Grapher
    remark = Welcome to this SmokePing website.
    
    + network
    menu = Net latency
    title = Network latency (ICMP pings)
    
    ++ myhost1
    host = myhost1.example
    ++ myhost2
    host = myhost2.example
    
    + services
    menu = Service latency
    title = Service latency (DNS, HTTP)
    
    ++ DNS
    probe = DNS
    menu = DNS latency
    title = Service latency (DNS)
    
    +++ dns1
    host = dns1.example
    
    +++ dns2
    host = dns2.example
    
    ++ HTTP
    menu = HTTP latency
    title = Service latency (HTTP)
    
    +++ www1
    host = www1.example
    
    +++ www2
    host = www2.example

Giải thích Target 

Cây target được chia theo probe được dùng. Mỗi phần target hoặc subtarget có thể sử dụng một probe khác nhau và cùng một probe có thể được sử dụng trong các phần khác nhau của cây cấu hình.

## VD3

**Cấu hình probe**

    *** Probes ***
    + FPing
    binary = /usr/bin/fping
    
    ++ FPingNormal
    offset = 0%
    
    ++ FPingLarge
    packetsize = 5000
    offset = 50%

**Giải thích Probe**

Ví dụ này cho thấy khái niệm về các trường hợp thăm dò. Probe FPingLarge và FPingNormal độc lập với nhau, chúng chỉ dùng chung module là Fping. FPingNormal sử dụng các thông số mặc định, FPingLarge cũng vậy nhưng khác ở chỗ 5 kilobyte packetsize. Cả hai đều sử dụng cùng fping binary và đường dẫn của nó được cấu hình phần trên cùng của FPing.

Các thông số "ofset" đảm bảo cả 2 probe không chạy cùng 1 lúc. FPingNormal chạy mỗi 5 phút (8:00, 8:05, 8:10,...) còn FPingLarge bắt đầu chạy khi interval được 1 nửa (8:02:30, 8:07:30,...)

Phần + FPing không phải là 1 probe vì bên trong nó có các phần con (subsection). Nếu muốn có 1 probe tên là "Fping" thì ta có thể đặt tên đó cho 1 subsection.

**Cấu hình Target**

    *** Targets ***
    probe = FPingNormal
    menu = Top
    title = Network Latency Grapher
    remark = Welcome to this SmokePing website.
    
    + network
    menu = Net latency
    title = Network latency (ICMP pings)
    
    ++ myhost1
    menu = myhost1
    title = ICMP latency for myhost1
    
    +++ normal
    title = Normal packetsize (56 bytes)
    probe = FPingNormal
    host = myhost1.example
    
    +++ large
    title = Large packetsize (5000 bytes)
    probe = FPingLarge
    host = myhost1.example
    
    ++ myhost2
    menu = myhost2
    title = ICMP latency for myhost2
    
    +++ normal
    title = Normal packetsize (56 bytes)
    probe = FPingNormal
    host = myhost2.example
    
    +++ large
    title = Large packetsize (5000 bytes)
    probe = FPingLarge
    host = myhost2.example

**Giải thích target**

Ở đây có 2 host được ping với hai gói ICMP có kích thước khác nhau. Lần này cây được chia cho host target chứ không phải probe.

## VD4

**Cấu hình probe**

    *** Probes ***
    + Curl
    # probe-specific variables
    binary = /usr/bin/curl
    step = 60
    
    # a default for this target-specific variable
    urlformat = http://%host%/

**Giải thích Probe**

Ví dụ này giải thích sự khác biệt giữa các biến chỉ định probe (probe-specific) và chỉ định target (target-specific). Chúng ta sử dụng probe Curl ở đây.

Mỗi probe hỗ trợ ít nhất và biến chỉ định probe. Giá trị của các biến này phổ biến với tất cả các target và probe và chúng chỉ có thể được cấu hình trong phần Probes. Trong trường hợp này, các biến chỉ định probe là "binary" và "step".

Các biến chỉ định target được hỗ trợ bởi hầu hết các probe. Ngoại lệ đáng chú ý nhất là probe Fping và các dẫn xuất của nó. Các biến chỉ định target có thể có các giá trị khác nhau với các target khác nhau. Chúng có thể được cấu hình ở cả phần Probes và phần Targets. Các giá trị được gán trong chức năng của phần trở thành giá trị mặc định có thể được ghi đè trong phần Targets.

Tài liệu của mỗi probe cho biết biến nào của nó là chỉ định probe và biến nào là chỉ định target.

Trong trường hợp này, biến "urlformat" là biến chỉ đinh target. Nó khá không phổ biến vì nó có thể chứa một trình giữ chỗ cho biến "host" trong phần Targets. Đây không phải là một tính năng chung, ứng dụng của nó chỉ giới hạn ở biến "urlformat" và "%host%" escape.

(Lý do probe FPing không hỗ trợ các biến chỉ định target đơn giản là vì phần mềm fping đo tất cả các target trong 1 lần, vì thế chúng có cùng thông số. Các probe khác ping lần lượt các target)

**Cấu hình Target**

    *** Targets ***
    probe = Curl
    menu = Top
    title = Network Latency Grapher
    remark = Welcome to this SmokePing website.
    
    + HTTP
    menu = http
    title = HTTP latency 
    
    ++ myhost1
    menu = myhost1
    title = HTTP latency for myhost1
    host = myhost1.example
    
    ++ myhost2
    menu = myhost2
    title = HTTP latency for myhost2
    host = myhost2.example
    
    ++ myhost3
    menu = myhost3
    title = HTTP latency for myhost3 (port 8080!)
    host = myhost3.example
    urlformat = http://%host%:8080/
    
    + FTP
    menu = ftp
    title = FTP latency
    urlformat = ftp://%host%/
    
    ++ myhost1
    menu = myhost1
    title = FTP latency for myhost1
    host = myhost1.example
    
    ++ myhost2
    menu = myhost2
    title = FTP latency for myhost2
    host = myhost2.example

**Giải thích Target**

Cây target chia thành một nhánh HTTP và một nhánh FTP. Server myhost1.example và myhost2.example được thăm dò trong cả 2 nhánh. Server myhost3.example chỉ có một HTTP server và nó là một port không tiêu chuẩn (8080).

Biến "urlformat" được chỉ định cho cả nhánh FTP là "ftp://%host%/". Đối với hánh HTTP, mặc định từ phần Probes được sử dụng, ngoại trừ myhost3, ghi đè lên nó để tag số cổng vào URL.

Việc gán myhost3 cũng có thể bao gồm nguyên văn tên máy chủ (vd: urlformat = http://myhost3.example:8080/) thay vì sử dụng giữ chỗ %host%, nhưng vẫn cần phần biến host (mặc dù nó sẽ không được sử dụng cho bất cứ điều gì).

## VD5

**Cấu hình Probe**

    *** Probes ***
    + FPing
    binary = /usr/bin/fping
    
    # these expect to find echoping in /usr/bin
    # if not, you'll have to specify the location separately for each probe
    # + EchoPing         # uses TCP or UDP echo (port 7)
    # + EchoPingDiscard  # uses TCP or UDP discard (port 9)
    # + EchoPingChargen  # uses TCP chargen (port 19)
    + EchoPingSmtp       # SMTP (25/tcp) for mail servers
    + EchoPingHttps      # HTTPS (443/tcp) for web servers
    + EchoPingHttp       # HTTP (80/tcp) for web servers and caches
    + EchoPingIcp        # ICP (3130/udp) for caches
    # these need at least echoping 6 with the corresponding plugins
    + EchoPingDNS        # DNS (53/udp or tcp) servers
    + EchoPingLDAP       # LDAP (389/tcp) servers
    + EchoPingWhois      # Whois (43/tcp) servers

**Giải thích probe**

Ví dụ này cho thấy hầu hết các probe echoping-derived hoạt động

**Cấu hình Target**

    *** Targets ***
    # default probe
    probe = FPing
    
    menu = Top
    title = Network Latency Grapher
    remark = Welcome to this SmokePing website.
    
    + MyServers
    
    menu = My Servers
    title = My Servers 
    
    ++ www-server
    menu = www-server
    title = Web Server (www-server) / ICMP
    # probe = FPing propagated from top
    host = www-server.example
    
    +++ http
    menu = http
    title = Web Server (www-server) / HTTP
    probe = EchoPingHttp
    host = www-server.example 
    # default url is /
    
    +++ https
    menu = https
    title = Web Server (www-server) / HTTPS
    probe = EchoPingHttps
    host = www-server.example
    
    ++ cache
    menu = www-cache
    title = Web Cache (www-cache) / ICMP
    host = www-cache.example
    
    +++ http
    menu = http
    title = www-cache / HTTP
    probe = EchoPingHttp
    host = www-cache.example
    port = 8080 # use the squid port
    url = http://www.somehost.example/
    
    +++ icp
    menu = icp
    title = www-cache / ICP
    probe = EchoPingIcp
    host = www-cache.example
    url = http://www.somehost.example/
    
    ++ mail
    menu = mail-server
    title = Mail Server (mail-server) / ICMP
    host = mail-server.example
    
    +++ smtp
    menu = mail-server / SMTP
    title = Mail Server (mail-server) / SMTP
    probe = EchoPingSmtp
    host = mail-server.example
    
    ++ ldap-server
    menu = ldap-server
    title = ldap-server / ICMP
    host = ldap-server.example
    
    +++ ldap
    menu = ldap-server / LDAP
    title = LDAP Server (ldap-server) / LDAP
    probe = EchoPingLDAP
    ldap_request = (objectclass=*)
    host = ldap-server.example
    
    ++ name-server
    menu = name-server
    title = name-server / ICMP
    host = name-server.example
    
    +++ DNS
    menu = name-server / DNS
    title = DNS Server (name-server) / DNS
    probe = EchoPingDNS
    dns_request = name.example
    host = name-server.example
    
    ++ whois-server
    menu = whois-server
    title = whois-server / ICMP
    host = whois-server.example
    
    +++ Whois
    menu = whois-server / Whois
    title = Whois Server (whois-server) / Whois
    probe = EchoPingWhois
    whois_request = domain.example
    host = whois-server.example

**Giải thích Target**

Tất cả các server được ping bởi cả ICMP (probe FPing) và probe echoping tương ứng. Máy chủ proxy, www-cache, được thăm dò với cả yêu cầu HTTP và yêu cầu ICP cho cùng một URL.

## VD6

**Cấu hình Probe**

    *** Probes ***
    
    + FPing
    
    binary = /usr/sbin/fping
    
    *** Slaves ***
    secrets=/tmp/smokeping-20612-build/etc/smokeping_secrets.dist
    +boomer
    display_name=boomer
    color=0000ff
    
    +slave2
    display_name=another
    color=00ff00

**Giải thích Probe**

Đây là cấu hình mẫu của Smokeping.

**Cấu hình Target**

    *** Targets ***
    
    probe = FPing
    
    menu = Top
    title = Network Latency Grapher
    remark = Welcome to the SmokePing website of xxx Company. \
            Here you will learn all about the latency of our network.
    
    + Test
    menu= Targets
    #parents = owner:/Test/James location:/
    
    ++ James
    
    menu = James
    title =James
    alerts = someloss
    slaves = boomer slave2
    host = james.address
    
    ++ MultiHost
    
    menu = Multihost
    title = James and James as seen from Boomer
    host = /Test/James /Test/James~boomer

**Giải thích Target**

Đây là cấu hình mẫu được của Smokeping.

## Tham khảo

https://oss.oetiker.ch/smokeping/doc/smokeping_examples.en.html