# Script trỏ domain BBB v2

Đăng nhập vào Server

Cài đặt certbot

    sudo apt-get install certbot

Thực hiện cấu hình HTTPS cho server sử dụng Let's Enscrypt. Nhập đúng domain của bạn ở bước này. Ví dụ ở đây domain là **bbbv2.workfromhome.vn**

    cd /root
    wget https://scripts.cloud365.vn/bbb-letcert-v2.sh
    bash bbb-letcert-v2.sh bbbv2.workfromhome.vn


Khi chạy script này, sẽ có thông báo nhập email quản trị. Nếu nhập sai format email sẽ dừng việc cài đặt SSL lại và quay về lại cấu hình cũ.

Khi nhập đúng format email quản trị. Quá trình đổi domain và cài đặt SSL sẽ bắt đầu. Sau đó script sẽ tự tạo cho ta một tài khoản quản trị. 

**Mẫu:** Nếu không nhập domain khi chạy script, sẽ có thông báo cần nhập domain.

```
root@bbb1:~# bash bbb-letcert-v2.sh
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following packages were automatically installed and are no longer required:
  authbind libcommons-collections3-java libcommons-dbcp-java
  libcommons-pool-java libecj-java libservlet3.0-java libtomcat7-java tomcat7
  tomcat7-common
Use 'apt autoremove' to remove them.
The following additional packages will be installed:
  python-acme python-certbot python-cffi-backend python-chardet
  python-configargparse python-configobj python-cryptography python-enum34
  python-funcsigs python-idna python-ipaddress python-josepy python-mock
  python-ndg-httpsclient python-openssl python-parsedatetime python-pbr
  python-pkg-resources python-pyasn1 python-pyicu python-requests
  python-requests-toolbelt python-rfc3339 python-setuptools python-six
  python-tz python-urllib3 python-zope.component python-zope.event
  python-zope.hookable python-zope.interface
Suggested packages:
  python-certbot-apache python-certbot-nginx python-certbot-doc
  python-acme-doc python-configobj-doc python-cryptography-doc
  python-cryptography-vectors python-enum34-doc python-funcsigs-doc
  python-mock-doc python-openssl-doc python-openssl-dbg doc-base
  python-setuptools-doc python-ntlm
The following NEW packages will be installed:
  certbot python-acme python-certbot python-cffi-backend python-chardet
  python-configargparse python-configobj python-cryptography python-enum34
  python-funcsigs python-idna python-ipaddress python-josepy python-mock
  python-ndg-httpsclient python-openssl python-parsedatetime python-pbr
  python-pkg-resources python-pyasn1 python-pyicu python-requests
  python-requests-toolbelt python-rfc3339 python-setuptools python-six
  python-tz python-urllib3 python-zope.component python-zope.event
  python-zope.hookable python-zope.interface
0 upgraded, 32 newly installed, 0 to remove and 3 not upgraded.
Need to get 1878 kB of archives.
After this operation, 10.4 MB of additional disk space will be used.
Get:1 http://us.archive.ubuntu.com/ubuntu xenial/main amd64 python-cffi-backend                                                                                     amd64 1.5.2-1ubuntu1 [58.1 kB]
Get:2 http://us.archive.ubuntu.com/ubuntu xenial/main amd64 python-enum34 all 1.                                                                                    1.2-1 [35.8 kB]
Get:3 http://us.archive.ubuntu.com/ubuntu xenial/main amd64 python-idna all 2.0-                                                                                    3 [35.1 kB]
Get:4 http://us.archive.ubuntu.com/ubuntu xenial/main amd64 python-ipaddress all                                                                                     1.0.16-1 [18.0 kB]
Get:5 http://us.archive.ubuntu.com/ubuntu xenial/main amd64 python-pkg-resources                                                                                     all 20.7.0-1 [108 kB]
Get:6 http://us.archive.ubuntu.com/ubuntu xenial/main amd64 python-pyasn1 all 0.                                                                                    1.9-1 [45.1 kB]
Get:7 http://us.archive.ubuntu.com/ubuntu xenial/main amd64 python-six all 1.10.                                                                                    0-3 [10.9 kB]
Get:8 http://us.archive.ubuntu.com/ubuntu xenial-updates/main amd64 python-crypt                                                                                    ography amd64 1.2.3-1ubuntu0.2 [199 kB]
Get:9 http://us.archive.ubuntu.com/ubuntu xenial-updates/main amd64 python-opens                                                                                    sl all 0.15.1-2ubuntu0.2 [84.9 kB]
Get:10 http://us.archive.ubuntu.com/ubuntu xenial-updates/universe amd64 python-                                                                                    josepy all 1.1.0-1~ubuntu16.04.1 [27.9 kB]
Get:11 http://us.archive.ubuntu.com/ubuntu xenial/main amd64 python-funcsigs all                                                                                     0.4-2 [12.6 kB]
Get:12 http://us.archive.ubuntu.com/ubuntu xenial/main amd64 python-pbr all 1.8.                                                                                    0-4ubuntu1 [46.6 kB]
Get:13 http://us.archive.ubuntu.com/ubuntu xenial/main amd64 python-mock all 1.3                                                                                    .0-2.1ubuntu1 [46.5 kB]
Get:14 http://us.archive.ubuntu.com/ubuntu xenial-updates/main amd64 python-urll                                                                                    ib3 all 1.13.1-2ubuntu0.16.04.3 [58.4 kB]
Get:15 http://us.archive.ubuntu.com/ubuntu xenial/main amd64 python-chardet all                                                                                     2.3.0-2 [96.3 kB]
Get:16 http://us.archive.ubuntu.com/ubuntu xenial-updates/main amd64 python-requ                                                                                    ests all 2.9.1-3ubuntu0.1 [55.9 kB]
Get:17 http://us.archive.ubuntu.com/ubuntu xenial/universe amd64 python-requests                                                                                    -toolbelt all 0.6.0-2 [31.5 kB]
Get:18 http://us.archive.ubuntu.com/ubuntu xenial/main amd64 python-tz all 2014.                                                                                    10~dfsg1-0ubuntu2 [31.5 kB]
Get:19 http://us.archive.ubuntu.com/ubuntu xenial/universe amd64 python-rfc3339                                                                                     all 1.0-4 [6290 B]
Get:20 http://us.archive.ubuntu.com/ubuntu xenial/main amd64 python-setuptools a                                                                                    ll 20.7.0-1 [169 kB]
Get:21 http://us.archive.ubuntu.com/ubuntu xenial-updates/universe amd64 python-                                                                                    acme all 0.31.0-2~ubuntu16.04.1 [49.2 kB]
Get:22 http://us.archive.ubuntu.com/ubuntu xenial/universe amd64 python-configar                                                                                    gparse all 0.10.0-2 [20.2 kB]
Get:23 http://us.archive.ubuntu.com/ubuntu xenial/main amd64 python-configobj al                                                                                    l 5.0.6-2 [34.2 kB]
Get:24 http://us.archive.ubuntu.com/ubuntu xenial/main amd64 python-ndg-httpscli                                                                                    ent all 0.4.0-3 [25.1 kB]
Get:25 http://us.archive.ubuntu.com/ubuntu xenial/main amd64 python-parsedatetim                                                                                    e all 1.4-1 [37.6 kB]
Get:26 http://us.archive.ubuntu.com/ubuntu xenial/main amd64 python-pyicu amd64                                                                                     1.9.2-2build1 [179 kB]
Get:27 http://us.archive.ubuntu.com/ubuntu xenial/universe amd64 python-zope.eve                                                                                    nt all 4.2.0-1 [7412 B]
Get:28 http://us.archive.ubuntu.com/ubuntu xenial/main amd64 python-zope.interfa                                                                                    ce amd64 4.1.3-1build1 [81.0 kB]
Get:29 http://us.archive.ubuntu.com/ubuntu xenial/universe amd64 python-zope.hoo                                                                                    kable amd64 4.0.4-4build2 [9172 B]
Get:30 http://us.archive.ubuntu.com/ubuntu xenial/universe amd64 python-zope.com                                                                                    ponent all 4.2.2-1 [38.5 kB]
Get:31 http://us.archive.ubuntu.com/ubuntu xenial-updates/universe amd64 python-                                                                                    certbot all 0.27.0-1~ubuntu16.04.1 [201 kB]
Get:32 http://us.archive.ubuntu.com/ubuntu xenial-updates/universe amd64 certbot                                                                                     all 0.27.0-1~ubuntu16.04.1 [18.0 kB]
Fetched 1878 kB in 2s (633 kB/s)
Extracting templates from packages: 100%
Selecting previously unselected package python-cffi-backend.
(Reading database ... 194140 files and directories currently installed.)
Preparing to unpack .../python-cffi-backend_1.5.2-1ubuntu1_amd64.deb ...
Unpacking python-cffi-backend (1.5.2-1ubuntu1) ...
Selecting previously unselected package python-enum34.
Preparing to unpack .../python-enum34_1.1.2-1_all.deb ...
Unpacking python-enum34 (1.1.2-1) ...
Selecting previously unselected package python-idna.
Preparing to unpack .../python-idna_2.0-3_all.deb ...
Unpacking python-idna (2.0-3) ...
Selecting previously unselected package python-ipaddress.
Preparing to unpack .../python-ipaddress_1.0.16-1_all.deb ...
Unpacking python-ipaddress (1.0.16-1) ...
Selecting previously unselected package python-pkg-resources.
Preparing to unpack .../python-pkg-resources_20.7.0-1_all.deb ...
Unpacking python-pkg-resources (20.7.0-1) ...
Selecting previously unselected package python-pyasn1.
Preparing to unpack .../python-pyasn1_0.1.9-1_all.deb ...
Unpacking python-pyasn1 (0.1.9-1) ...
Selecting previously unselected package python-six.
Preparing to unpack .../python-six_1.10.0-3_all.deb ...
Unpacking python-six (1.10.0-3) ...
Selecting previously unselected package python-cryptography.
Preparing to unpack .../python-cryptography_1.2.3-1ubuntu0.2_amd64.deb ...
Unpacking python-cryptography (1.2.3-1ubuntu0.2) ...
Selecting previously unselected package python-openssl.
Preparing to unpack .../python-openssl_0.15.1-2ubuntu0.2_all.deb ...
Unpacking python-openssl (0.15.1-2ubuntu0.2) ...
Selecting previously unselected package python-josepy.
Preparing to unpack .../python-josepy_1.1.0-1~ubuntu16.04.1_all.deb ...
Unpacking python-josepy (1.1.0-1~ubuntu16.04.1) ...
Selecting previously unselected package python-funcsigs.
Preparing to unpack .../python-funcsigs_0.4-2_all.deb ...
Unpacking python-funcsigs (0.4-2) ...
Selecting previously unselected package python-pbr.
Preparing to unpack .../python-pbr_1.8.0-4ubuntu1_all.deb ...
Unpacking python-pbr (1.8.0-4ubuntu1) ...
Selecting previously unselected package python-mock.
Preparing to unpack .../python-mock_1.3.0-2.1ubuntu1_all.deb ...
Unpacking python-mock (1.3.0-2.1ubuntu1) ...
Selecting previously unselected package python-urllib3.
Preparing to unpack .../python-urllib3_1.13.1-2ubuntu0.16.04.3_all.deb ...
Unpacking python-urllib3 (1.13.1-2ubuntu0.16.04.3) ...
Selecting previously unselected package python-chardet.
Preparing to unpack .../python-chardet_2.3.0-2_all.deb ...
Unpacking python-chardet (2.3.0-2) ...
Selecting previously unselected package python-requests.
Preparing to unpack .../python-requests_2.9.1-3ubuntu0.1_all.deb ...
Unpacking python-requests (2.9.1-3ubuntu0.1) ...
Selecting previously unselected package python-requests-toolbelt.
Preparing to unpack .../python-requests-toolbelt_0.6.0-2_all.deb ...
Unpacking python-requests-toolbelt (0.6.0-2) ...
Selecting previously unselected package python-tz.
Preparing to unpack .../python-tz_2014.10~dfsg1-0ubuntu2_all.deb ...
Unpacking python-tz (2014.10~dfsg1-0ubuntu2) ...
Selecting previously unselected package python-rfc3339.
Preparing to unpack .../python-rfc3339_1.0-4_all.deb ...
Unpacking python-rfc3339 (1.0-4) ...
Selecting previously unselected package python-setuptools.
Preparing to unpack .../python-setuptools_20.7.0-1_all.deb ...
Unpacking python-setuptools (20.7.0-1) ...
Selecting previously unselected package python-acme.
Preparing to unpack .../python-acme_0.31.0-2~ubuntu16.04.1_all.deb ...
Unpacking python-acme (0.31.0-2~ubuntu16.04.1) ...
Selecting previously unselected package python-configargparse.
Preparing to unpack .../python-configargparse_0.10.0-2_all.deb ...
Unpacking python-configargparse (0.10.0-2) ...
Selecting previously unselected package python-configobj.
Preparing to unpack .../python-configobj_5.0.6-2_all.deb ...
Unpacking python-configobj (5.0.6-2) ...
Selecting previously unselected package python-ndg-httpsclient.
Preparing to unpack .../python-ndg-httpsclient_0.4.0-3_all.deb ...
Unpacking python-ndg-httpsclient (0.4.0-3) ...
Selecting previously unselected package python-parsedatetime.
Preparing to unpack .../python-parsedatetime_1.4-1_all.deb ...
Unpacking python-parsedatetime (1.4-1) ...
Selecting previously unselected package python-pyicu.
Preparing to unpack .../python-pyicu_1.9.2-2build1_amd64.deb ...
Unpacking python-pyicu (1.9.2-2build1) ...
Selecting previously unselected package python-zope.event.
Preparing to unpack .../python-zope.event_4.2.0-1_all.deb ...
Unpacking python-zope.event (4.2.0-1) ...
Selecting previously unselected package python-zope.interface.
Preparing to unpack .../python-zope.interface_4.1.3-1build1_amd64.deb ...
Unpacking python-zope.interface (4.1.3-1build1) ...
Selecting previously unselected package python-zope.hookable.
Preparing to unpack .../python-zope.hookable_4.0.4-4build2_amd64.deb ...
Unpacking python-zope.hookable (4.0.4-4build2) ...
Selecting previously unselected package python-zope.component.
Preparing to unpack .../python-zope.component_4.2.2-1_all.deb ...
Unpacking python-zope.component (4.2.2-1) ...
Selecting previously unselected package python-certbot.
Preparing to unpack .../python-certbot_0.27.0-1~ubuntu16.04.1_all.deb ...
Unpacking python-certbot (0.27.0-1~ubuntu16.04.1) ...
Selecting previously unselected package certbot.
Preparing to unpack .../certbot_0.27.0-1~ubuntu16.04.1_all.deb ...
Unpacking certbot (0.27.0-1~ubuntu16.04.1) ...
Processing triggers for man-db (2.7.5-1) ...
Setting up python-cffi-backend (1.5.2-1ubuntu1) ...
Setting up python-enum34 (1.1.2-1) ...
Setting up python-idna (2.0-3) ...
Setting up python-ipaddress (1.0.16-1) ...
Setting up python-pkg-resources (20.7.0-1) ...
Setting up python-pyasn1 (0.1.9-1) ...
Setting up python-six (1.10.0-3) ...
Setting up python-cryptography (1.2.3-1ubuntu0.2) ...
Setting up python-openssl (0.15.1-2ubuntu0.2) ...
Setting up python-josepy (1.1.0-1~ubuntu16.04.1) ...
Setting up python-funcsigs (0.4-2) ...
Setting up python-pbr (1.8.0-4ubuntu1) ...
update-alternatives: using /usr/bin/python2-pbr to provide /usr/bin/pbr (pbr) in                                                                                     auto mode
Setting up python-mock (1.3.0-2.1ubuntu1) ...
Setting up python-urllib3 (1.13.1-2ubuntu0.16.04.3) ...
Setting up python-chardet (2.3.0-2) ...
Setting up python-requests (2.9.1-3ubuntu0.1) ...
Setting up python-requests-toolbelt (0.6.0-2) ...
Setting up python-tz (2014.10~dfsg1-0ubuntu2) ...
Setting up python-rfc3339 (1.0-4) ...
Setting up python-setuptools (20.7.0-1) ...
Setting up python-acme (0.31.0-2~ubuntu16.04.1) ...
Setting up python-configargparse (0.10.0-2) ...
Setting up python-configobj (5.0.6-2) ...
Setting up python-ndg-httpsclient (0.4.0-3) ...
Setting up python-parsedatetime (1.4-1) ...
Setting up python-pyicu (1.9.2-2build1) ...
Setting up python-zope.event (4.2.0-1) ...
Setting up python-zope.interface (4.1.3-1build1) ...
Setting up python-zope.hookable (4.0.4-4build2) ...
Setting up python-zope.component (4.2.2-1) ...
Setting up python-certbot (0.27.0-1~ubuntu16.04.1) ...
Setting up certbot (0.27.0-1~ubuntu16.04.1) ...
[INFORMATION] Script can truyen vao domain
---------------------------
VD: bash ./bbb-letcert-v2.sh domain.example.com
```

**Mẫu:** Nếu nhập sai format email, sẽ quay lại cấu hình ban đầu.

```
root@bbb1:~# bash bbb-letcert-v2.sh bbbv2.workfromhome.vn
Reading package lists... Done
Building dependency tree
Reading state information... Done
certbot is already the newest version (0.27.0-1~ubuntu16.04.1).
The following packages were automatically installed and are no longer required:
  authbind libcommons-collections3-java libcommons-dbcp-java
  libcommons-pool-java libecj-java libservlet3.0-java libtomcat7-java tomcat7
  tomcat7-common
Use 'apt autoremove' to remove them.
0 upgraded, 0 newly installed, 0 to remove and 3 not upgraded.
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100    15  100    15    0     0     58      0 --:--:-- --:--:-- --:--:--    58
[INFORMATION] Doi domain name cua BBB
Assigning bbbv2.workfromhome.vn for testing for firewall in /var/www/bigbluebutt                                                                                    on/client/conf/config.xml
Assigning bbbv2.workfromhome.vn for rtmp:// in /var/www/bigbluebutton/client/con                                                                                    f/config.xml
Assigning bbbv2.workfromhome.vn for servername in /etc/nginx/sites-available/big                                                                                    bluebutton
Assigning bbbv2.workfromhome.vn for http[s]:// in /var/www/bigbluebutton/client/                                                                                    conf/config.xml
Assigning bbbv2.workfromhome.vn for publishURI in /var/www/bigbluebutton/client/                                                                                    conf/config.xml
Assigning bbbv2.workfromhome.vn for web application URL in /usr/share/bbb-web/WE                                                                                    B-INF/classes/bigbluebutton.properties
Assigning bbbv2.workfromhome.vn for web application URL in /usr/share/bbb-apps-a                                                                                    kka/conf/application.conf
Assigning bbbv2.workfromhome.vn for record and playback in /usr/local/bigbluebut                                                                                    ton/core/scripts/bigbluebutton.yml
Assigning bbbv2.workfromhome.vn for playback of recordings:
Restarting the BigBlueButton 2.2.6 ...
Stopping BigBlueButton

Starting BigBlueButton

[INFORMATION] Tien hanh cai dat Cert
---------------------------
[REQUIRE] Nhap email quan tri: dungz1207@gmail.cxczczxc
[WARNING] Email khong dung format su dung admin@localhost.local
Saving debug log to /var/log/letsencrypt/letsencrypt.log
Plugins selected: Authenticator webroot, Installer None
Starting new HTTPS connection (1): acme-v02.api.letsencrypt.org
Unable to register an account with ACME server

[WARNING] Cai dat Cert khong thanh cong, revert lai setting cu
---------------------------
Assigning 103.101.160.202 for testing for firewall in /var/www/bigbluebutton/cli                                                                                    ent/conf/config.xml
Assigning 103.101.160.202 for rtmp:// in /var/www/bigbluebutton/client/conf/conf                                                                                    ig.xml
Assigning 103.101.160.202 for servername in /etc/nginx/sites-available/bigbluebu                                                                                    tton
Assigning 103.101.160.202 for http[s]:// in /var/www/bigbluebutton/client/conf/c                                                                                    onfig.xml
Assigning 103.101.160.202 for publishURI in /var/www/bigbluebutton/client/conf/c                                                                                    onfig.xml
Assigning 103.101.160.202 for web application URL in /usr/share/bbb-web/WEB-INF/                                                                                    classes/bigbluebutton.properties
Assigning 103.101.160.202 for web application URL in /usr/share/bbb-apps-akka/co                                                                                    nf/application.conf
Assigning 103.101.160.202 for record and playback in /usr/local/bigbluebutton/co                                                                                    re/scripts/bigbluebutton.yml
Assigning 103.101.160.202 for playback of recordings:
Restarting the BigBlueButton 2.2.6 ...
Stopping BigBlueButton

Starting BigBlueButton
```

**Mẫu:** Nếu nhập đúng format email. Quá trình trỏ domain và cài đặt SSL sẽ bắt đầu. Script sẽ tự động tạo một tài khoản admin với email quản trị đã nhập cho chúng ta. Ví dụ ở đây tài khoản admin bạn có thể thấy ở dưới là dungz1207@gmail.com / ZmMxMTgxOD

```
root@bbb1:~# bash bbb-letcert-v2.sh bbbv2.workfromhome.vn
Reading package lists... Done
Building dependency tree
Reading state information... Done
certbot is already the newest version (0.27.0-1~ubuntu16.04.1).
The following packages were automatically installed and are no longer required:
  authbind libcommons-collections3-java libcommons-dbcp-java
  libcommons-pool-java libecj-java libservlet3.0-java libtomcat7-java tomcat7
  tomcat7-common
Use 'apt autoremove' to remove them.
0 upgraded, 0 newly installed, 0 to remove and 3 not upgraded.
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100    15  100    15    0     0     54      0 --:--:-- --:--:-- --:--:--    54
[INFORMATION] Doi domain name cua BBB
Assigning bbbv2.workfromhome.vn for testing for firewall in /var/www/bigbluebutt                                                                                    on/client/conf/config.xml
Assigning bbbv2.workfromhome.vn for rtmp:// in /var/www/bigbluebutton/client/con                                                                                    f/config.xml
Assigning bbbv2.workfromhome.vn for servername in /etc/nginx/sites-available/big                                                                                    bluebutton
Assigning bbbv2.workfromhome.vn for http[s]:// in /var/www/bigbluebutton/client/                                                                                    conf/config.xml
Assigning bbbv2.workfromhome.vn for publishURI in /var/www/bigbluebutton/client/                                                                                    conf/config.xml
Assigning bbbv2.workfromhome.vn for web application URL in /usr/share/bbb-web/WE                                                                                    B-INF/classes/bigbluebutton.properties
Assigning bbbv2.workfromhome.vn for web application URL in /usr/share/bbb-apps-a                                                                                    kka/conf/application.conf
Assigning bbbv2.workfromhome.vn for record and playback in /usr/local/bigbluebut                                                                                    ton/core/scripts/bigbluebutton.yml
Assigning bbbv2.workfromhome.vn for playback of recordings:
Restarting the BigBlueButton 2.2.6 ...
Stopping BigBlueButton

Starting BigBlueButton

[INFORMATION] Tien hanh cai dat Cert
---------------------------
[REQUIRE] Nhap email quan tri: dungz1207@gmail.com
Email dung format
Saving debug log to /var/log/letsencrypt/letsencrypt.log
Plugins selected: Authenticator webroot, Installer None
Starting new HTTPS connection (1): acme-v02.api.letsencrypt.org
Obtaining a new certificate
Performing the following challenges:
http-01 challenge for bbbv2.workfromhome.vn
Using the webroot path /var/www/bigbluebutton-default for all unmatched domains.
Waiting for verification...
Cleaning up challenges

IMPORTANT NOTES:
 - Congratulations! Your certificate and chain have been saved at:
   /etc/letsencrypt/live/bbbv2.workfromhome.vn/fullchain.pem
   Your key file has been saved at:
   /etc/letsencrypt/live/bbbv2.workfromhome.vn/privkey.pem
   Your cert will expire on 2020-07-27. To obtain a new or tweaked
   version of this certificate in the future, simply run certbot
   again. To non-interactively renew *all* of your certificates, run
   "certbot renew"
 - Your account credentials have been saved in your Certbot
   configuration directory at /etc/letsencrypt. You should make a
   secure backup of this folder now. This configuration directory will
   also contain certificates and private keys obtained by Certbot so
   making regular backups of this folder is ideal.
 - If you like Certbot, please consider supporting our work by:

   Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
   Donating to EFF:                    https://eff.org/donate-le


[INFORMATION] Cau hinh tu dong renew Cert Let's Encrypt
---------------------------

[INFORMATION] Cau hinh Nginx su dung SSL
---------------------------
--2020-04-28 15:05:02--  https://scripts.cloud365.vn/bbb-nginx.conf
Resolving scripts.cloud365.vn (scripts.cloud365.vn)... 103.101.161.201
Connecting to scripts.cloud365.vn (scripts.cloud365.vn)|103.101.161.201|:443...                                                                                     connected.
HTTP request sent, awaiting response... 200 OK
Length: 2723 (2.7K) [text/plain]
Saving to: '/etc/nginx/sites-available/bigbluebutton'

/etc/nginx/sites-av 100%[===================>]   2.66K  --.-KB/s    in 0s

2020-04-28 15:05:02 (20.8 MB/s) - '/etc/nginx/sites-available/bigbluebutton' sav                                                                                    ed [2723/2723]

--2020-04-28 15:05:02--  https://scripts.cloud365.vn/bbb-nginx-default.conf
Resolving scripts.cloud365.vn (scripts.cloud365.vn)... 103.101.161.201
Connecting to scripts.cloud365.vn (scripts.cloud365.vn)|103.101.161.201|:443...                                                                                     connected.
HTTP request sent, awaiting response... 200 OK
Length: 2135 (2.1K) [text/plain]
Saving to: '/etc/nginx/sites-available/default'

/etc/nginx/sites-av 100%[===================>]   2.08K  --.-KB/s    in 0s

2020-04-28 15:05:02 (198 MB/s) - '/etc/nginx/sites-available/default' saved [213                                                                                    5/2135]


[INFORMATION] Cau hinh FreeSWITCH su dung SSL
---------------------------

[INFORMATION] Cau hinh BBB load session thong qua HTTPS
---------------------------
Restarting BigBlueButton 2.2.6 ...
Stopping BigBlueButton
Starting BigBlueButton



# Potential problems described below
# Not running:  tomcat7 or grails LibreOffice
............................................

[INFORMATION] Cau hinh Greenlight su dung domain
---------------------------
Stopping greenlight-v2   ... done
Stopping greenlight_db_1 ... done
Removing greenlight-v2   ... done
Removing greenlight_db_1 ... done
Removing network greenlight_default
Creating network "greenlight_default" with the default driver
Creating greenlight_db_1 ... done
Creating greenlight-v2   ... done
[INFORMATION] Cho 30s Greenlight start....
---------------------------

[INFORMATION] Cau hinh tai khoan admin
---------------------------
Account succesfully created.
Email: dungz1207@gmail.com
Password: ZmMxMTgxOD
Role: admin

[INFORMATION] Remove scripts
---------------------------
[INFORMATION] Hoan tat
---------------------------
```

Đăng nhập bằng tài khoản đã được tạo.

![Imgur](https://i.imgur.com/q0tRu5b.png)

Nếu có người muốn đăng ký sử dụng trang Big Blue Button này thì yêu cầu đăng ký của họ phải được Admin chấp thuận mới được sử dụng. Hạn chế những người khác sử dụng trang Big Blue Button của ta.

Để xem các tài khoản đã đăng ký trên trang này. Đăng nhập bằng tài khoản quản trị và thực hiện như sau:

Click vào **Admin** > **Organization**

![Imgur](https://i.imgur.com/qHW4AhK.png)

Click vào **Pending**

![Imgur](https://i.imgur.com/VbE5Swm.png)

Ở đây ta thấy có một người đã đăng ký sử dụng trên trang của ta.

![Imgur](https://i.imgur.com/8ppgKst.png)

Click vào **Approve** để cho phép người này sử dụng trang của ta. 

Click vào **Decline** để từ chối.