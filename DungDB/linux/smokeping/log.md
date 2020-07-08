# Log

Apache ghi lại các bản ghi của nó trong hai tệp: `/var/log/httpd-access.log` và `/var/log/httpd-error.log`. 

SmokePing có một tệp nhật ký, là `/var/log/smokeping.log`. 

Hãy nhớ rằng nếu bạn thay đổi cấu hình của SmokePing, bạn sẽ cần phải reload daemon bằng lệnh `sudo service smokeping reload` hoặc `systemctl restart smokeping` và `systemctl restart httpd`