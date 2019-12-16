# Cài đặt Nginx Open Source trên Centos8  

## I - Stable vs. mainline version
Nginx Open Source có sẵn trong hai phiên bản:
- Mainline  – Bao gồm các tính năng mới nhất và sửa lỗi và luôn cập nhật. Nó đáng tin cậy, nhưng nó có thể bao gồm một số mô-đun thử nghiệm và nó cũng có thể có một số lỗi mới.
- Ổn định(Stable)  – Không bao gồm tất cả các tính năng mới nhất, nhưng có các sửa lỗi nghiêm trọng luôn được đưa vào phiên bản chính.

## Core modules vs. third-party modules <Mô-đun lõi và mô-đun của bên thứ 3>  
Nginx có hai loại mô-đun mà bạn có thể sử dụng: core modules và mô-đun của bên thứ ba.

Các core module được xây dựng bởi các nhà phát triển Nginx cốt lõi và chúng là một phần của chính phần mềm.

Các mô-đun của bên thứ ba được xây dựng bởi cộng đồng và bạn có thể sử dụng chúng để mở rộng chức năng Nginx. Có rất nhiều mô-đun bên thứ ba hữu ích, nổi tiếng nhất trong số đó là: PageSpeed, ModSecurity, RTMP, Lua, v.v.

## Static modules vs. dynamic modules <Mô-đun tĩnh và mô-đun động>  

