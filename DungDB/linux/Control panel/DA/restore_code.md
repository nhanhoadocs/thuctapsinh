# Restore source code của 1 site

DA Source Code để ở `/home/user/`

Vào thư mục `/home/user1/domains/user1.dungdb.xyz/public_html` xóa hết các thứ trong đó

    cd /home/user1/domains/user1.dungdb.xyz/public_html/
    ls -lah
    rm -rf *

Upload file source code lên server

![Imgur](https://i.imgur.com/tMmf9yk.png)

Giải nén. Cách giải nén các file gz, zip

    tar -xvzf backup-shophoatay.tar.gz

    unzip Source\ code.zip

Copy source code về thư mục chính xác 

Copy file .htaccess vì file này không giống các file khác

    cp -R * /home/user1/domains/user1.dungdb.xyz/public_html
    cp .htaccess /home/user1/domains/user1.dungdb.xyz/public_html

Phân quyền 

    chown -R user1:user1 /home/user1/domains/user1.dungdb.xyz/public_html/*
    chown -R user1:user1 /home/user1/domains/user1.dungdb.xyz/public_html/.htaccess

Tạo database trên DA. 

![Imgur](https://i.imgur.com/gzt8f3X.png)

Create new Database

Lấy các thông tin DB này sửa vào file `wp-config.php` tại 3 trường tên db, tên user và password.

Vào phpmyadmin

![Imgur](https://i.imgur.com/0KknOmE.png)

![Imgur](https://i.imgur.com/gTNVScr.png)

upload file database lên, chú ý tên.

![Imgur](https://i.imgur.com/mQZZRT2.png)

Vào `wp_options` sửa 2 trường trên hình thành domain của mình để khi truy cập domain không bị quay sang trang cũ.

Xong.


    1  19/06/20 00:04:13 df -h
    2  19/06/20 00:04:23 mount | grep ' / '
    3  19/06/20 00:04:35 /etc/default/grub
    4  19/06/20 00:04:59 vi /etc/default/grub
    5  19/06/20 00:06:28 cp /boot/grub2/grub.cfg /boot/grub2/grub.cfg.orig
    6  19/06/20 00:06:34 grub2-mkconfig -o /boot/grub2/grub.cfg
    7  19/06/20 00:06:50 reboot
    8  19/06/20 00:07:24 mount | grep ' / '
    9  19/06/20 00:07:38 cd /usr/local/directadmin
   10  19/06/20 00:07:44 ./directadmin c | grep use_xfs_quota
   11  19/06/20 00:08:15 echo "action=rewrite&value=quota" >> /usr/local/directadmin/data/task.queue
   12  19/06/20 00:10:45  cd
   13  19/06/20 00:10:46 ls
   14  19/06/20 00:11:15 cd
   15  19/06/20 00:11:56 cd /home/user1/domains/user1.dungdb.xyz/public_html/
   16  19/06/20 00:12:21 ls -lah
   17  19/06/20 00:12:37 rm -rf *
   18  19/06/20 00:12:39 ls
   19  19/06/20 00:13:27 tar -xvzf backup-shophoatay.tar.gz
   20  19/06/20 00:13:30 ls
   21  19/06/20 00:13:34 cd backup-shophoatay
   22  19/06/20 00:13:35 ls
   23  19/06/20 00:13:40 cd Su
   24  19/06/20 00:13:43 cd Source\ code/
   25  19/06/20 00:13:48 ls -alh
   26  19/06/20 00:14:27 ls
   27  19/06/20 00:14:41 unzip Source\ code.zip
   28  19/06/20 00:14:49 ls
   29  19/06/20 00:15:06 rm -rf Source\ code.zip
   30  19/06/20 00:15:06 ls
   31  19/06/20 00:15:23 pwd
   32  19/06/20 00:15:54 ls -alh
   33  19/06/20 00:16:09 pwd
   34  19/06/20 00:16:29 cp -R * /home/user1/domains/user1.dungdb.xyz/public_html
   35  19/06/20 00:17:20 cp .htaccess /home/user1/domains/user1.dungdb.xyz/public_html
   36  19/06/20 00:33:15 history


    1  19/06/20 00:04:13 df -h
    2  19/06/20 00:04:23 mount | grep ' / '
    3  19/06/20 00:04:35 /etc/default/grub
    4  19/06/20 00:04:59 vi /etc/default/grub
    5  19/06/20 00:06:28 cp /boot/grub2/grub.cfg /boot/grub2/grub.cfg.orig
    6  19/06/20 00:06:34 grub2-mkconfig -o /boot/grub2/grub.cfg
    7  19/06/20 00:06:50 reboot
    8  19/06/20 00:07:24 mount | grep ' / '
    9  19/06/20 00:07:38 cd /usr/local/directadmin
   10  19/06/20 00:07:44 ./directadmin c | grep use_xfs_quota
   11  19/06/20 00:08:15 echo "action=rewrite&value=quota" >> /usr/local/directadmin/data/task.queue
   12  19/06/20 00:10:45  cd
   13  19/06/20 00:10:46 ls
   14  19/06/20 00:15:32 cd /home/user1/domains/user1.dungdb.xyz/public_html/
   15  19/06/20 00:15:33 ls
   16  19/06/20 00:16:23 pwd
   17  19/06/20 00:16:51 /home/user1/domains/user1.dungdb.xyz/public_htmlls -alh
   18  19/06/20 00:16:58 ls -alh
   19  19/06/20 00:18:14 chmod -R user1:user1 /home/user1/domains/user1.dungdb.xyz/public_html
   20  19/06/20 00:18:19 chmod -R user1:user1 /home/user1/domains/user1.dungdb.xyz/public_html/*
   21  19/06/20 00:18:46 chown -R user1:user1 /home/user1/domains/user1.dungdb.xyz/public_html/*
   22  19/06/20 00:18:52 ls -alh
   23  19/06/20 00:19:02 chown -R user1:user1 /home/user1/domains/user1.dungdb.xyz/public_html/.htaccess
   24  19/06/20 00:20:05 vi wp-config.php
   25  19/06/20 00:26:40 cd /usr/local/directadmin/custombuild
   26  19/06/20 00:26:51 ./build update
   27  19/06/20 00:27:08 ./build letsencrypt
   28  19/06/20 00:27:14 ./build rewrite_confs
   29  19/06/20 00:31:55 cd
   30  19/06/20 00:31:59 cd /var/log
   31  19/06/20 00:32:00 ls
   32  19/06/20 00:32:11 cd directadmin/
   33  19/06/20 00:32:11 ls
   34  19/06/20 00:32:18 tailf system.log
   35  19/06/20 00:33:20 history
