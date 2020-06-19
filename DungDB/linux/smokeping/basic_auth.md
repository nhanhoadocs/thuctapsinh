# Basic Auth cho smokeping

    vi /etc/httpd/conf.d/smokeping.conf

Sửa nội dung thành

    <Directory "/usr/share/smokeping" >
    Options +ExecCGI
    #  Require all granted
    AuthType Basic
    AuthName "Basic Authentication"
    AuthUserFile /etc/httpd/conf/.htpasswd
    require valid-user
    </Directory>

    <Directory "/var/lib/smokeping" >
    Require all granted
    </Directory>

    ScriptAlias /smokeping/sm.cgi /usr/share/smokeping/cgi/smokeping.fcgi
    ScriptAlias /smokeping/smokeping.cgi /usr/share/smokeping/cgi/smokeping.fcgi

    Alias /smokeping/images /var/lib/smokeping/images
    Alias /smokeping /usr/share/smokeping/htdocs

    RedirectMatch permanent "^/smokeping/?$" "/"
    RedirectMatch permanent "^/smokeping/smokeping.cgi" "/"
    RedirectMatch permanent "^/smokeping/sm.cgi" "/"

Thêm user và password tài khoản đăng nhập basic auth

    htpasswd -c /etc/httpd/conf/.htpasswd nhanhoard

Nhập pass.

Restart service 

    systemctl restart httpd
    systemctl restart smokeping