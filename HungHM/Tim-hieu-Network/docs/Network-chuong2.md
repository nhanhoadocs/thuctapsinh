# CHƯƠNG 2: TẦNG ỨNG DỤNG

## Mục lục
[2.1 Giao thức tầng ứng dụng](#gaiothuctangungdung)
 - [2.1.1 Giao thức tầng ứng dụng]()
 - [2.1.2 Các yêu cầu của ứng dụng]()
 - [2.1.3 Dịch vụ của các giao thức giao vận Internet]()
 - [2.1.4 Một số ứng dụng phổ biến]()

[2.2 World wide web](#worldwideweb)
- [2.2.1 Tổng quan về HTTP]()
- [2.2.2 Kết nối liên tục và không liên tục]()
- [2.2.3 Khuân dạng thông điệp HTTP]()
- [2.2.4 Tương tác giữa người dùng và Hrver-server]()
- [2.2.5 Get có điều kiện(conditional Get)]()
- [2.2.6 Web cache]()

 ===========================

 2.1 Giao thức tầng ứng dụng
    2.1.1 Giao thức tầng ưnnsg dụng
    Cân phân biệt ứng dụng mạng và giao thức tầng ứng dụng.Giao thức tầng ứng dụng chỉ là 1 phần của ứng dụng mạng .Giao thưc tầng ứng dụng của web-HTTP(Hyper Text Tranfer Prôtcol) định nghĩa các thức truyền thông điệp giữa webcline và web server.Nhưng vậy HTTP chỉ là 1 phần của ứng dụng web
- Mô hình khác hàng / Người phục vụ (cline/server)
  Giao thức ứng dụng mạng chia thành 2 phần hay 2 phía, phía cline và phía server
- Truuền thông giữa các tiến trình
    Ưng dụng bao gồm 2 tiếng trình trên hai thiêt bị khác nhau,liên lạc với nhau qua mạng.Hai tiếng trình liên lác với nhau bằng cách gửi và nhận thông điệp socker của chúng.
- Địa chỉ tiến trình 
    Để gửi thông điệp cho tiến trình trên máy tính khác thì tiếng trình gửi phải xác định của tiến trình nhận

2.1.2 Các yêu cầu của ứng dụng 
    Socker là giao diện giữa tiếng trình ứng dụng và thực thể giao vận.Ứng dụng gửi thông điệp qua "cửa"ở sau cánh cửa là thực thể giao vận có trách nghiệm là truyền thông điệp qua mạng máy tính tới "cửa" tiến trình nhận
    
- Ứng dụng đòi hỏi dịch vụ gì của giao thức giao vận.Về đại thực thể chúng ta có thể phân loại theo 3 nhóm:
    - Mất mát dữ liệu (Data loss)
    - Băng thông (bandwith)
    - Thời gian (timing)
- Mất mát dữ liệu (Data loss)
    Một số ứng dụng như file, thư điện tử ...và ứng dụng tài chính đòi hỏi truyền chính xác và đầy đủ tức là không mất mát dữ liệu .Nếu mất mát sẽ gây nên hậu quả nghiêm trọng.Tuy nhiên một số ứng dụng khác như đa phương tiện(real time audio video hay stored autio video) chấp nhận mất mát giữ liệu trong giới hạn nào đó dẫn đến chất lượng bị giảm đi trong một giới hạn nào đó

- Băng thông (bandwith)
  Chỉ lưu lượng của tín hiệu được tryền qua thiết bị truyền dẫn trong 1 giây là bao nhiêu.Ta thường gặp với tốc độ cap quang,tốc độ của USB

- Thời gian (timing)
    Những ứng dụng thời gian thực (real-time ) mang tính chất tương tác như Internet telephone, hội thoại qua điên thoại hay chơi trò chơi nhiều người cung 1 lúc yêu caau fnhiều rằng buộc chặt chẽ về thời gian trong việc trao đổi dữ liệu.  

2.1.3 Dịch vụ của các giao thức giao vận Internet
    Internet cung cấp 2 giao thức giao vận cho tầng ứng dụng: UDP và TCP khi xây dụng ứng dụng cho internet , 1 trong những quyết định đầu tiên của nhà thiết kế phải đưa ra là sử dụng UDP hay TCP mỗi giao thức cung cấp một kiểu phục vụ khác nhau:

  - TCP : Đặc trưng của giao thức TCP là hướng kết nối và cung cấp dịch vị truyền liệu tin cậy .khi sử dụng giao vận TCP ứng dụng sẽ được nhận hai loại dịch vụ này:
      - Dịch vụ hướng nối (connection)
      - Dịch vụ giao vận tin cậy
- UDP:là giao thức giao vận khá đợn giản .Với mô hình phục vụ tối thiểu .UDP không hướng nối nghĩ là không có giai đoạn "bắt tay" trước khi hai tiến trnhf bătts đầu trao đổi tín hiệu .UDP không cung cấp dịch vụ tin cậy khi tiến trình gửi thông diệp thông qua cổng UDP,UDP không đảm bảo thông điệp sẽ đến cổng tiếp nhậnh hươn nữa thông điệp đến đích có thể không theo thứ tự.Mặt khác UDP có cơ chế kiểm soát tác nghẽn ,vì vậy tiếng trình gửi có thể đẩy dữ liệu ra cổng UDP với tốc độ bất kỳ.

2.2.4 Một số ứng dụng phổ biến
 -  Web
 - Truyền file
 - Thử điện tử
 - Dịch vụ tên miền 

2.2 World wide web

2.2.1 Tổng quan về HTTP (Hyper Text Tranfer Protocol)
    "Giao thưc truyền tải siêu văn bản" là mọt trong những giao thưc chuẩn về Internet được dùng để liên hệ thông tin giữa máy cung cấp dịch vụ (web server) và máy sử dụng (web cline)

2.2.2 Kết nối liên tục và không liên tục (persistent/nonpersistent)

