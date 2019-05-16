# Collision Domain và Broadcast Domain

##### 1: Collision domain - miền xung đột:
- Miền xung đột được định nghĩa là vùng mạng mà trong đó các dữ liệu phát ra có thể gây xung đột với nhau. Càng nhiều trạm trong cùng một miền xung đột thì sẽ làm tăng sự xung đột và làm giảm tốc độ truyền, vì thế mà miền xung đột có thể gọi là miền băng thông( các trạm trong cùng miền này sẽ chia sẻ băng thông của miền) một trong những nguyên nhân chính làm cho hoạt động của mạng không hiệu quả .Mỗi khi một đụng độ xảy ra trên một mạng, tất cả các hoạt động truyền dừng lại trong một khoảng thời gian.

- Các thiết bị như Hub hay các Repeater làm việc ở tầng vật lý nên không nhận ra địa chỉ MAC nên mỗi khi chúng nhận được một tín hiệu từ một cổng nó sẽ phát tin ra tất cả các cổng còn lại, vì vậy hình thành lên các vung xung đột .

  - VD:  Các PC kết nối với nhau thông qua con hub thì các PC chỉ có thể hoạt động ở Half Duplex mà thôi, túc là tại 1 thời điểm chỉ có 1 thiết bị được truyền dữ liệu. Nếu 2 thiết bị cùng truyền dữ liệu cùng lúc khi mà kết nối với nhau thông qua con hub này thì sẽ có thể sinh ra Collision domain.
![img](https://scontent.fhan3-2.fna.fbcdn.net/v/t1.15752-9/60330985_288605508715870_4385278075844165632_n.png?_nc_cat=103&_nc_oc=AQmUs0IPvv5q_8FAdVgsOI2CXQU7Qebq0yZT1CzutNTIuOY3sH7hiBwdtdZ0RGEiwr0&_nc_ht=scontent.fhan3-2.fna&oh=4df2d0b07fe51471aefd6c11b06ad80a&oe=5D664D8F)
- Để chia 1 Collision domain lớn thành 1 Collision domain nhỏ và để hạn chế các đụng độ xảy ra trên hệ thông mạng thì ta nên dùng Switch vì mỗi port của switch được coi là 1 collision domain.



![img](https://cdn.networklessons.com/wp-content/uploads/2016/11/xswitch-each-interface-collision-domain.png.pagespeed.a.ic.BFF6Fw30pG.png)

                                Hình minh họa về collision domain
                                
##### 2: Broadcast domain - miền quảng bá:
- 1 Broadcast domain là 1 vùng mạng, khi mà bất kỳ thiết bị nào trong vùng mạng gửi ra dữ liệu thì tất cả các thiết bị khác trong vùng mạng đều nhận được dữ liệu.
- 1 Broadcast domain chỉ được sử dụng 1 lớp mạng duy nhất mà thôi 
- Thiết bị giới hạn miền quảng bá là các Router. Và cũng chính Router tạo ra các miền quảng bá. Như vậy mỗi một Port của Router là một Broadcast domain. Một Broadcast domain có thể gồm nhiều Collision domain.
- Nếu 1 Broadcast domain quá lớn thì sẽ ảnh hưởng đến nguy cơ về bảo mật.
  - VD: Nếu 1 máy tính bất kỳ sử dụng netcut được cài đặt trên hệ điều hành Window. Thì ngay lập tức trong Broadcast đó sẽ bị mất mạng.
  - Để khác phục tình trạng này thì ta nên chia thành nhiều Broadcast domain nhỏ bằng cách sử dụng thiết bị định tuyến router để chia thành nhiều địa chỉ mạng.

![img](https://media.geeksforgeeks.org/wp-content/uploads/Computer-Network-Broadcast-Domain-Collision.png)

## END
