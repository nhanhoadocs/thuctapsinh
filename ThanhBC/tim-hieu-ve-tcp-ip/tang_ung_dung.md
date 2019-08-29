# giao thức tầng ứng dụng.
-- m� h�nh kh�ch h�ng / ngu?i ph?c v? (client /server)
    + client  l� ph?n y�u c?u s? dung d?ch v? 
    + server � ph?n cung c?p d?ch v? cho ngu?i s? sung d?ch v?
 vd: trong gio th?c stmp th� ph�a ngu?i g?i th? v?a l� ph�a client v?a l� ph�a server 

-- truy?n th�ng gi?a c�c ti?n tr�nh:   
        c�c ti?n tr�nh giao ti?p v?i nhau  b?ng c�ch g?i th�ng di?p cho nhau th�ng qua socket c?a ch?ng
        socket l� c�c c?ng k?t n?i c?a c� ti?n tr�nh , n� du?c cxem nhu l�  API g?i ?ng d?ng v� m?ng

-- d?a ch? ti?n tr�nh:
    ++ c� 2 ph?n l� :
            - t�n hay d?a ch? c?a m�y t�nh
            - d?nh danh x�c d?nh ti?n trinh tr�n m�y t�nh nh?n
-- chuong tr�nh giao tieepsp ngu?i d�ng (user agent):
    VD  trong thu di?n t? user agent l� gmail reader.
            trong web user agent l� brower.
-- y�u c?u c?a c�c ?ng d?ng
    + m?t m�t d? li?u( data loss)
     + bang th�ng (bandwitch)
    + th?i gian (timming)
## d?ch v?  c?a giao th?c giao v?n 
    +  TCP    ( transmission controll protocol)
        -  c� hu?ng n?i, ki?m tra t�nh tin c?y
    + UDP ( user datagram protocol)
        - kh�ng hu?ng n?i, kh�ng ki?m tra t�nh tin c?y
3. m?t s� ?ng d?ng ph? bi?n trong t�ng ?ng d?ng 
3.1. web, s? d?ng web server , v� c�c brower d? giao ti?p th�ng qua giao th?c http
3.2. ftp : file transfer protocol:  truy?n g?i nh?n file qua c�c m�y t�nh trong c�ng m?ng
3.3. smtp: (simple mail transfer protocol):  truy?n g?i nh?n mail qua mail client v� mail server (m� h�nh client/server)
3.4. dns: (domain name server): d?ch v? ph�n gi? t�n mi?n

3.1 world wide web  http
-http ( hyper text transfer protocol) l� tr�i tim c?t l�i c?a web
- c�c ph?n:
-giao th?c ki?u k�o v? t? server (pull protocol)
        + trang web (webpage) j ch?a t�p tin , c�c file ch?a c�c d?i tu?ng vd h�nh ?nh, text, html,..
        + tr�nh duy?t (brower): giao ti?p ngu?i d�ng d? hi?n th? trang web, c� 2 phi�n b?n http 1.0 v� 1.1 d?u s? dung  TCP l� giao th?c
-k?t n?i ko li�n t?c v�  li�n t?c ( kh�ng ki�n tr� of ki�n tr�)
    + kh�ng ki�n tr� khi t?o 1 phi�n k?t n?i  s? d?ng xong s? d?ng lu�n k?t n?i ( g?i th�ng di?p)), http 1.0
    + ki�n tr� th� khi tao k?t n?i s? d?ng xong s? kh�ng d?ng l?i m� v?n c�n ( http 1.1)
    + khu�n d?ng th�ng di?p
{

}
-tuowng t�c ngu?i d�ng v� http-server
    + authentication (ki?m ch?ng): password v�  username
    + cookie ; ghi l?i d�u v?t truy c?p:
            . t? client d?n server nh�n: set-cookies
            . t? server v? client nh?n  cookies
-GET  c� di?u ki?n (conditional GET)
    {
}
-web cache ( proxy server) l� m�y server l�m vieecjc tr?c ti?p v?i client c� n?i luu tr? d? li�u ri�ng.
    + cache llieen hop ( cooperative caching): k?t h?p nhi?u  webcache li�n k?t v?i nhau  d? n�ng cao hieu su?t
     + cum cache ( cache cluster): d?t tr�n cung m?ng  LAN giao th?c (CARP)cache array routing.
-web d?ng :
    + web tinh l� 1 file html tr�n webserver :
            + kh�ng linh ho?t, kh� c?p nh?t d?ng b? 
            + d? c�i d?t, d?n gi?n
    + web d?ng l� t?p h?p file du?c luu tr�n web server:
            +kh? nang hi?n th? l?p t?c , hi?n th?i t? server
            + d? s?a d?i d?ng b? 
            + chi ph� c�i d?t cao, khi c?p nh?t thi ph?i load l?i to�n trang
    + web t�ch c?c : gi?ng nhu web tinh nhung khi c?p nh?t th� ch? c?p nh?t s? thay d?i ch? kh�ng c?p nh?t to�n trang damt b?o bang th�ng �t.
-chu?n CGI( common gatewway, interface)
{
}

3.2 truy?n file ( file transfer protocol)
l� gioa th?c truy?n file gi?a c�c m�y t�nh 
d? s? dung th� ngu?i dung ph?i d?nh danh ng?i d�ng  qua username v� passwword
 s? d?ng TCP  qua c?ng 20 d? t?o du?ng truy?n
s? d?ng TCP qua c�ng 21 d? g?i d? li?u
c�c l?nh co b?n;
        + USER username g?i th�ng di?p d?nh danh 
        + PASS passwword g?i pass wod cho ngu?i d�ng
        + LIST y�u c?u  danh s�ch file
        + RETR filename l�y file t? thu m?c hi?n th?i
        + STOR filename t?i file l�n 
c�u tr? l?i
    + 331 usernaem OK , password  requiered
    + 125 connection allready open; transfer staring
    + 425 can't openn data connection
    +452 error writing file
3.4 thu di?n t? ( E-mail) 
c�c ph?n :
    +user agent , mail-server v� smtp or imap
usser agent v?a l� mail- client v?a l� mail-server

+ l� giao th?c ki?u d?y l�n server ( push protocol)
SMTP ( simple mail transfer protocol)
 m� h�a sang ASCII tru?c khi truy?n 
c�c bu?c truy?n file:  
    + s? d?ng user agent danh d?a ch? v� y�u c?u user g?i mail di
    + user agent g?i d?n mail server v� d?t v�o hang d?i 
    + smtp ch?y trrn mail-server  l?y thu v� t?o k?t n?i TCP   d?n mail server c?a ngu?i nh?n
    + t?i mail-server c?a nguoi nh?n  t?o k?t n?i TCP d?n user agetn d�n m�y ngu?i nh?n 
+ s? d?ng usser agent d? d?c thu
c� 5 c�u l�n dc s? d?ng  : HELO, MAIL, FROM, RCPT TO, DATA  v�  QUIT.

khu�n dang th? v� chu?n MIME
{
}

3.4 d?ch v? t�n mi?n DNS (domain name server)
d�i t? t�n ra d?a ch?  th�ng qua b?ng t�n mi�n
ch?y tr�n n?n UDP c?ng  53
## c�c d?ch v? c?a DNS    
 dns l� co s?  d? li?u ph�n t�n, d?t tr�n m?t h? th�ng ph�n c?p c�c m�y ph?c v?  t�n (nameserver)
dns l� giao th?c thu�c t?ng �ng d?ng  cho ph�p m�y t�nh v� m�y ch? t�n mi?n trao d?i th�ng tin ph?c v? m?c d�ch  xac d?nh d?a ch?
tr�n unix s? d?ng BIND( berkely  internet namen domain)

# d?ch v?  d?t b� danh cho m�y t�nh ( host alliasing):
c� th? c� nhi?u b� d�nh cho m?t m�y t�nh
b� danh d? nh? hon t�n d?y d?( canonical name) 
# d?t b� danh cho email ( mail server aliasing)

#  ph�n t�n t?i( load distribution):
webserver nh�n b?n  c�c site c� nhi?u ngu?i c�ng truy c?p du?c d?t tr�n nhi?u server gi?ng h?t nhau
vi?c ho�n v? DNS dc �p d?ng cho email khi nhi?u mailserver c� chung b� danh

# co ch? ho?t d?ng c?a DNS
c�c client g?i th�ng di?p truy v?n t?i h?p den DNS  trong th�ng di?p ch?a t�n m�y v� dia ch? ip 
d�y l� d?ng thi?t k? t?p trung khi d� x?y ra �c v?n d? 
    + di?m h?ng duy nh�t,
    + kh?i lu?ng c�ng vi?c ( traffic volume)
    +co s? d? li?u t?p trung ? xa
    + b?o tr? ghi nh? th�ng tin  v? t?t c? c�c m�y t�nh d� dc luu
h? th�ng ko kh? thi 
c?u tr�c lai DNS the h? th?ng ph�n c?p v� ph�n t�n tr�n to�n c�u
c� 3 laoij nameserver l� 
    + local nameserver 
    + root nameserver 
    + authoritative nameserver