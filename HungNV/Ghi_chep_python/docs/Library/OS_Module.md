# Thư viện OS trong python 

Trước tiên thực hiện các hàm ta phải import thư viện 

```
import os
```
### os.getcwd() and os.chdir()

Hàm `os.getcwd()` trả về thư mục làm việc hiện tại của os và hàm `os.chdir()` dùng để thay đổi vị trí hiện tại 

Muốn kiểm tra thư mục làm việc hiện tại 

```
>>> os.getcwd()
'/var/log'
```

Di chuyển đến thư mục root

```
>>> os.chdir('/root')
```
Kiểm tra lại :  

```
>>> os.getcwd()
'/root'
```

### os.listdir()

Để liệt kê thư mục và file tại vị trí truy cập  hiện tại

Ví dụ liệt kê thư mục và file tại `/var/log` 

```
>>> os.listdir('.')
['lastlog',
 'auth.log.2.gz',
 'kern.log.2.gz',
 'syslog.2.gz',
 'btmp',
 'syslog.6.gz',
 'alternatives.log',
 'auth.log',
 'syslog.1',
 'apt',
 'faillog',
 'journal',
 'syslog.5.gz',
 'syslog.7.gz',
 'bootstrap.log',
 'tallylog',
 'syslog.3.gz',
 'installer',
 'unattended-upgrades',
 'wtmp',
 'kern.log.1',
 'dpkg.log',
 'dist-upgrade',
 'syslog',
 'syslog.4.gz',
 'auth.log.1',
 'kern.log']
```

hoặc ta có thể sử dụng system cho việc này :

Sử dụng system và truyền vào lệnh `ls` để liệt kê thư mục 

```
>>> os.system('ls')
alternatives.log  btmp          kern.log       syslog.2.gz  tallylog
apt               dist-upgrade  kern.log.1     syslog.3.gz  unattended-upgrades
auth.log          dpkg.log      kern.log.2.gz  syslog.4.gz  wtmp
auth.log.1        faillog       lastlog        syslog.5.gz
auth.log.2.gz     installer     syslog         syslog.6.gz
bootstrap.log     journal       syslog.1       syslog.7.gz
```

### os.system()

Sử dụng system ta có thể truyền vào các lệnh thường làm đối với os, cụ thể là centos 7. 

Ví dụ muốn xem thời gian ta có thể sử dụng các lệnh như `date`, `timedatectl` để xem. Còn trong python ta dùng như sau : 

```
>>> os.system('timedatectl')
                      Local time: Tue 2020-04-14 16:20:29 +07
                  Universal time: Tue 2020-04-14 09:20:29 UTC
                        RTC time: Tue 2020-04-14 09:20:39
                       Time zone: Asia/Ho_Chi_Minh (+07, +0700)
       System clock synchronized: no
systemd-timesyncd.service active: yes
                 RTC in local TZ: no
```

### os.mkdir()

dùng để tạo 1 thư mục 

Nếu muốn tạo 1 thư mục có tên newDir, ta sử dụng như sau: 

```
>>> os.mkdir('newDir')
```

Để kiểm tra có thể thoát shell và kiểm tra với lệnh ls : 

```
>>> exit
```
```
root@CentOS ~# ls
hello  logssh.txt  log.txt  newDir  python.py
```

### os.name 
 
Khi chạy os.name có thể nhận được các kết quả tương tự như: `posix`, `nt`, `os2`, `ce`, `java`, `riscos` 

Sử dụng tại ubuntu : 

```
>>> os.name
'posix'
```

Tại window thì sẽ là `'nt'`, ...

### os.environ, os.getenv() and os.putenv()

Sử dụng `os.environ` sẽ hiển thị các biến môi trường

ví dụ sau khi sử dụng giá trị trên sẽ có kết quả như sau: 

```
environ{'LS_COLORS': 'rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:',
        'LESSCLOSE': '/usr/bin/lesspipe %s %s',
        'LANG': 'en_US.UTF-8',
        'SUDO_GID': '1000',
        'DISPLAY': 'localhost:10.0',
        'OLDPWD': '/home/thuctap',
        'USERNAME': 'root',
        'SUDO_COMMAND': '/bin/su root',
        'USER': 'root',
        'PWD': '/root',
        'HOME': '/root',
        'SUDO_USER': 'thuctap',
        'SUDO_UID': '1000',
        'MAIL': '/var/mail/root',
        'SHELL': '/bin/bash',
        'TERM': 'xterm',
        'SHLVL': '1',
        'LOGNAME': 'root',
        'PATH': '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games',
        'LESSOPEN': '| /usr/bin/lesspipe %s',
        '_': '/usr/local/bin/ipython'}

```

Để xem từng biến môi trường ta làm như sau: 

```
>>> os.environ["MAIL"]
'/var/mail/root'
```
hoặc 

```
>>> os.getenv("MAIL")
'/var/mail/root'
``` 

### os.remove() and os.rmdir()

Để xóa 1 file, di chuyển đến vị trí thư mục chứa file và thực hiện câu lệnh sau: 

```
>>> os.remove("test.txt")
```

Đối với thư mục ta thực hiện tương tự với ham `rmdir()`
```
>>> os.rmdir("pytest")
``` 

### os.rename(src, dst)

hàm trên sẽ đổi tên 1 file hoặc thư mục : 

Di chuyển đên thư mục chứa file hoặc thư mục, làm tương tự như sau :

``` 
>>> os.rename("test.txt", "pytest.txt")
```
 

