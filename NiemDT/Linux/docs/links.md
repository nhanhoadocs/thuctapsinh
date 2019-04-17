# Links
Tạo một liên kết như kiểu shortcut. Có 2 kiểu là `hard links` và `soft links`
### 1. Hard links
Tạo ra một file hoặc thư mục giống thư mục cũ giống cả về inode. Khi xóa file gốc thì links này vẫn còn data.
`ln file1 file2`
`file2` được tạo ra
### 2. Soft links
Tạo một đường links trỏ đến file gốc. Khi file gốc bị xóa thì data trong link này bị mấy
`ln -s file1 file2`