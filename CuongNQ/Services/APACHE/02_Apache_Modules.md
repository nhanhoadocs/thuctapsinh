# Các module trong Apache
## **1) Khái niệm**
- **Apache** là 1 nền tảng **module** có độ tùy biến rất cao .
- **Module** giúp quản trị viên có thể tắt hoặc thêm chức năng vào Web Server của mình .
- **Apache** có các **module** cho bảo mật caching , URL rewriting , chứng thực mật khẩu ...
- Các **module** được nạp vào **Apache** gồm 2 loại :
    - `static` : có nghĩa là **module** đó được tích hợp vào trong mã chạy **Apache** ( tích hợp khi build từ code ) , module này luôn có - không hủy được .
    - `shared` : có nghĩa module đó nằm trên một file độc lập , bạn cấu hình đề khi **Apache** chạy nó tải vào , nếu chức năng của **module** đó bạn không cần nữa thì không tải .
- Để xem các **module** được nạp vào **Apache** , dùng lệnh :
    ```
    # httpd -M
    ```
    <img src=https://i.imgur.com/ST1poph.png>

- Để nạp thêm **module** :
    - **B1 :** Mở file cấu hình dịch vụ **Apache** :
        ```
        # vi /etc/httpd/conf/httpd.conf
        ```
    - **B2 :** Thêm vào dòng với chỉ thị `LoadModule` :
        ```
        LoadModule module_name file_module_location
        ```
        - **VD :** Thêm `status_module` tại `modules/mod_status.so` thì thêm dòng :
            ```
            LoadModule status_module modules/mod_status.so
            ```
        - Khi muốn tắt nhanh **module** , thêm dấu `#` vào trước dòng `LoadModule` .
## **2) Các module thông dụng trên Apache**
| **Tên module** | **Chức năng** |
|----------------|---------------|
| `alias_module` | Cung cấp cơ chế ánh xạ từ url ngắn gọn đến vị trí thật trên đĩa với các chỉ thị : `Alias` , `AliasMatch` , `Redirect` , `RedirectMatch` |
| `cache_module` | chức năng cache cơ sở |
| `cache_disk_module` | lưu cache trên đĩa |
| `data_module` | chuyển đổi URL data |
| `deflate_module` | nén file trước khi trả về cho user |
| `filter_module` | chức năng filter, chuyển content của respose để filter ( lục , nén , biến đổi ...) trước khi trả về cho user |
| `access_compat_module` | Xác thực truy cập cơ bản với các chỉ thị như `Order` , `Deny` , `Allow` |
| `actions_module` | Chạy CGI script với chỉ thị `Action` , `Script` hay dùng để định nghĩa Handler |
| `allowmethods_module` | Chỉ cho phép một số phương thức HTTP Request gửi đến ( POST , GET , PUT , DELETE ... ) bằng chỉ thị `AllowMethods` |
| `auth_basic_module` | Cung cấp cơ chế xác thực HTTP đơn giản (HTTP Basic Authentication) |
| `auth_digest_module` | Triển khai phương pháp xác thực HTTP Digest Authentication |
| `authn_anon_module` | Cho phép user nặc danh truy cập mục yêu cầu xác thực |
| `authn_core_module` | Module cơ sở xây dựng các phương pháp xác thực |
| `authn_dbd_module` | cho phép xác thực từ SQL |
| `authn_dbm_module` | cho phép xác thực từ file DBM |
| `authn_file_module` | xác thực từ file (text) |
| `authn_socache_module` | quản lý cache xác thực |
| `authz_core_module` | module xác thực cơ sở |
| `authz_dbd_module` | xác thực |
| `authz_dbm_module` | xác thực |
| `authz_host_module` | xác thực từ HOST và IP |
| `authz_owner_module` | xác thực |
| `authz_user_module` | xác thực |
| `autoindex_module` | tự động sinh file chỉ mục indexes của thư mục |
| `dbd_module` | chức năng kết nối đến SQL từ Apache |
| `dumpio_module` | dump lỗi |
| `echo_module` | cung cấp chỉ thị `ProtocolEcho On|Off` để bật tắt chế độ echo của Server Apache |
| `ext_filter_module` | chuyển body của response cho một chương trình trước khi trả về cho user |
| `headers_module` | cho phép tùy chỉnh thêm vào HTTP Header |
| `include_module` | cho phép Apache parsed nội dung HTML |
| `logio_module` | cho phép lưu log số lượng phải nhận/gửi cho mỗi request |
| `reqtimeout_module` | cho phép thiết lập timeout (thời gian hết hạn) cho mỗi request |
| `substitute_module` | cho phép tìm và thay thế body của response |
| `suexec_module` | cho phép thiết lập user chạy CGI |
| `version_module` | cấu hình theo từng Apache version |
| `dav_module` | chức năng WebDAV |
| `dav_fs_module` | WebDAV |
| `dav_lock_module` | WebDAV |
| `lua_module` | cho phép chạy LUA Script |
