# Cài đặt Jitsi

## Yêu cầu :

Server Ubuntu 18.04 LTS Blank với 1 IP public. Bạn có thể đăng ký tại Cloud365.
Sudo user
Domain trỏ tới IP của server (optional)

## Bước 1: Đặt hostname
```
hostnamectl set-hostname jitsimeet
```

## Bước 2: Đặt rule firewall
Nếu bạn sử dụng ufw bạn cần allow ssh, http, https và traffic inbound UDP port 10000 tới 20000:
```
sudo ufw allow OpenSSH
sudo ufw allow http
sudo ufw allow https
sudo ufw allow in 10000:20000/udp
sudo ufw enable
```
## Bước 3: Update system
```
sudo apt update
sudo apt upgrade -y && sudo shutdown -r now
```
## Bước 4: Cài đặt OpenJDK Java Runtime Environment (JRE) 8
Enable repo universe nếu chưa được kích hoạt
```
sudo add-apt-repository universe
```

Cài đặt OpenJDK JRE 8:
```
sudo apt install -y openjdk-8-jre-headless
```

Kiểm tra:
```
java -version
```

Cấu hình môi trường JAVA_HOME
```
echo "JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")" | sudo tee -a /etc/profile

source /etc/profile
```
## Bước 5: Cài đặt Nginx
```
sudo apt install -y nginx
sudo systemctl start nginx.service
sudo systemctl enable nginx.service
```

## Bước 6: Cài đặt Jitsi Meet
Cài Jitsi repo:
```
cd
wget -qO - https://download.jitsi.org/jitsi-key.gpg.key | sudo apt-key add -

sudo sh -c "echo 'deb https://download.jitsi.org stable/' > /etc/apt/sources.list.d/jitsi-stable.list"

sudo apt update -y
```

Cài đặt Jitsi Meet:
```
apt-get install jicofo=1.0-549-1 jitsi-meet=2.0.4468-1 jitsi-meet-prosody=1.0.4025-1 jitsi-meet-turnserver=1.0.4025-1 jitsi-meet-web=1.0.4025-1 jitsi-meet-web-config=1.0.4025-1 jitsi-videobridge2=2.1-183-gdbddd169-1 -y
```

**Lưu ý :** Trong quá trình cài, bạn sẽ được yêu cầu cung cấp hostname. Tại đây, bạn cần điền domain đã được trỏ về IP máy chủ cài đặt.

Trường hợp bạn không có domain, bạn cũng có thể nhập IP của chính máy chủ đó.

Bạn cũng sẽ được hỏi về SSL cert, lựa chọn **Generate a new self-signed certificate (You will later get a chance to obtain a Let’s Encrypt certificate)**.

Sau khi quá trình cài đặt hoàn tất, bạn có thể chạy script để cài đặt SSL Let’s Encrypt miễn phí:
```
sudo /usr/share/jitsi-meet/scripts/install-letsencrypt-cert.sh
```
Trong quá trình cài đặt, bạn sẽ được yêu cầu nhập email. Phần còn lại script sẽ tự động cài cho bạn.

**Lưu ý:** Bạn chỉ có thể sử dụng script trên để cài đặt SSL nếu bạn sử dụng domain ở bước trước đó.

Cuối cùng, bạn hãy truy cập vào domain để kiểm tra kết quả.