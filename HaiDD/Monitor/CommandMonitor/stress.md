# Lệnh `stress`

Sử dụng `stress` để kiểm tra CPU và RAM của máy chủ Linux.

Nó sẽ thực hiện việc đẩy sự tiêu tốn tài nguyên của RAM và CPU lên một mức nào đó để kiểm tra.

Nó như là việc tạo ra một kịch bản xấu để kiểm tra mức ổn định của máy chủ.

# I. Install `stress`
### 1. Trên CentOS 7:
```
yum install epel-release
yum install -y stress
```

### 2. Trên Ubuntu:
```
apt-get install stress
```

# II. Sử dụng `stress`
## 1. `stress` test CPU
Để thực hiện việc kiểm tra CPU, ta cần biết CPU máy kiểm tra có bao nhiêu CPU. Để biết điều đó, ta thực hiện lệnh sau:
```
grep -c ^processor /proc/cpuinfo
```

- Ví dụ: Kết quả câu lệnh trên trả về là 2. Ta sẽ thử kiểm tra với `stress` trong thời gian 120 giây với 2 CPU:
    ```
    stress --cpu 2 --timeout 120
    ```

## 2. `stress` test RAM
Cũng như việc kiểm tra CPU, ta cần phải xác định dung lượng RAM tối đa của máy. Ta sẽ kiểm tra như sau:
```
free -m
```

- Ví dụ: Ta sẽ thấy kết quả tương tự như sau:
    ```
                  total        used        free      shared  buff/cache   available
    Mem:           3944        1439        1549           0         955        2275
    Swap:           979          14         965
    ```

    Ta sẽ thử buff RAM sử dụng lên 3 GB như sau:

    ```
    stress --vm 3 --vm-bytes 1024M
    ```