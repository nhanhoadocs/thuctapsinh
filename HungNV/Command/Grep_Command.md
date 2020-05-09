# Grep Command 

### Tìm kiếm không phân biệt hoa thường

```
grep - i "Word" [filename]
```

### Hiển thị số lượng dòng khớp với từ cần tìm 

```
grep -c "Word" [filename]
```
### Hiển thị các tệp chứa từ cần tìm 

```
grep -l "word" *
```

### Tìm kiếm tất cả các từ trong tệp 

```
grep -w "word" [filename]
```
### Hiển thị nội dung file, bỏ những dòng có dấu #, loại bỏ khoảng trắng 

Có 3 cách : 

```
cat tênfile | egrep -v '^$|^#'
```

```
cat tênfile | egrep -v '^$|^#|^*#'
```

```
cat tênfile | egrep -v '^*#|^$'
```

### Hiển thị tất cả địa chỉ ip có trong file 

 Ví dụ : Hiển thị tất cả địa chỉ ip có trong file secure kể cả những ip trùng lặp
 
```
cat secure | grep -Ec "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
```

Hiển thị các địa chỉ iP có trong file và bỏ đi những địa chỉ trùng lặp 

```
grep -o "[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+" /var/log/secure | sort | uniq
```

### Hiển thị số ip xuất hiện trong file và đếm số lần lặp của chúng 

```
grep -o "[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+" /var/log/secure | sort | uniq -c 
```

Sắp xếp lại lệnh trên theo thứ tự từ thấp đến cao 

```
grep -o "[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+" /var/log/secure | sort | uniq -c | sort -n
```

Hiển thị lại dưới dạng cuộn và thao tác lệnh để đọc dữ liệu 

```
grep -o "[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+" /var/log/secure | sort | uniq -c | sort -n
````

