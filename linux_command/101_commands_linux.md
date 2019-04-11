# 101 commands 

36. Hiển thị user id (uid) và group id (gid) của user hiện đang sử dụng

```
id
```

37. Hiển thị địa chỉ IP và netmask trên máy

```
ifconfig
```

38. Hiển thị thông tin của wireless interface

```
iwconfig
```

39. Hiển thị thông tin của wireless network

```
iwconfig
```

40. Kill process theo tên.

```
killall process-name
```

41. Hiển thị khoảng thời gian shutdown gần đây nhất

```
last -x | grep shutdown | head -1 
```

42. Logout khỏi user hiện tại

```
logout
```

43. Hiển thị các file, thư mục không bị ẩn trong thư mục hiện tại. Có thể sử dụng option `-a` để hiển thị cả những file bị ẩn.

```
ls
```

44. Hiển thị quyền truy cập đối với tất cả files bên trong thư mục

```
ls -l filename
```

45. Hiển thị tất cả các lệnh sẵn có trong trường hợp bạn quên

```
ls /usr/bin
```

46. Hiển thị thêm thông tin về network

```
lshw -C network
```

47. Hiển thị các modules hiện đang load trong kernel

```
lsmod
```

48. Show thông tin phần cứng âm thanh, video, network

```
lspci -nv | less
```

49. Hiển thị thông tin về USB bus trong hệ thống và các thiết bị kết nối đến nó.

```
lsusb
```

50. Đọc hướng dẫn sử dụng của câu lệnh

```
man <command>
```

51. Tạo một thư mục tại vị trí chỉ định

```
mkdir <dirname>
```

52. Move một file tới một thư mục khác

```
mv <file> <dir>
```

53. Đổi tên file1 thành file2

```
mv file1 file2
```

54. Show bảng định tuyến

```
netstat -rn
```

55. In ra các biến môi trường

```
printenv
```

56. Hiển thị những process đang chạy được thực thi bởi chính user đang sử dụng.

```
ps -Af
```

57. Hiển thị thư mục đang đứng

```
pwd
```

58. Xóa file

```
rm <filename>

```

59. Xóa thư mục và nội dung bên trong thư mục này

```
rm -rf <dir>
```

60. Xóa tất cả các file có đuôi `.txt` trong thư mục đang đứng

```
rm *.txt
```

61. Xóa thư mục (chỉ xóa khi thư mục đó là trống)

```
rmdir <dir>
```

62. Hiển thị địa chỉ gateway mặc định 

```
route
```

63. Xóa hoàn toàn mọi thông tin và dấu vết của 1 file không cho khôi phục lại. -n 7 ghi đè lên file 7 lần. -z ghi đè lần cuối bằng không để ẩn shred. -u thực hiện xóa file khi thự hiện xong, -v hiển thị quá trình thực hiện

```
shred -zuv -n 7 <file>
```

64. Shutdown now

```
shutdown -h now
```

65. Restart now

```
shutdown -r now
```

66. SSH đến máy tính khác

```
ssh <username>@<IP>
```

67. Sử dụng shell với quyền root. User của bạn cần có quyền su sang user root.

```
sudo -i
```

68. Sử dụng shell với quyền root. Câu lệnh này khác với `sudo -i` là nó giữ nguyên biến mối trường của user.

```
sudo su
```

69. Nén tất cả các file và thư mục bên trong một thư mục xác định thành một file

```
tar czf <dirname>.tgz <dirname>
```

70. Giải nén một file

```
tar xzvf <filename>
```
