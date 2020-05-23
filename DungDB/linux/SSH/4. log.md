# Log
Trên CentOS 7, SSH log được đặt ở /var/log/secure. Nếu muốn giám sát realtime, sử dụng lệnh

    tail -f -n 50 /var/log/secure | grep sshd