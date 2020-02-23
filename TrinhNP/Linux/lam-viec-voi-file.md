### NHỮNG THỨ CHƯA NHỚ CẦN NOTE LẠI :

**rmdir** : xóa thư mục

```diff -c file1 file2``` : so sánh 2 thư mục

`file <path to file> ` :show ra thông tin của file

## LỆNH NÉN VÀ GIẢI NÉN 


- Các option dùng với lệnh `tar`
    - `c` : tạo file nén .tar.
    - `x` : bung file nén .tar.
    - `v` : show quá trình nén hoặc giải nén dữ liệu ra màn hình.
    - `f` : chỉ định nén thành file.
    - `t` : Xem dữ liệu trong file nén.
    - `j` : tạo file nén với bzip2 có định dạng file.tar.bz2
    - `z` : tạo file nén với gzip có định dạng file.tar.gz.
    - `r` : thêm một file và thư mục vào file nén đã tồn tại.
    - `--wildcards` : tìm và xuất file bất kỳ trong file nén.
    
    - Nén file : `tar -xvf `
    
- Show nội dung file nén : `tar -tvf filenen | more `

- Giải nén 1 file con trong file nén : `tar -xvf <path to file> <path to file>

