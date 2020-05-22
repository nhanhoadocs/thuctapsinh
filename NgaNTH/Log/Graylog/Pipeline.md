# Pipeline trong Graylog  

## 1. Pipeline là gì?  

`Pipeline` là khái niệm trung tâm liên kết các bước xử lý được áp dụng cho các message của bạn.  
`Pipeline` chứa các rule và có thể được kết nối với một hoặc nhiều stream, cho phép kiểm soát chi tiết việc xử lý áp dụng cho các message.  
`Processing rules` (các quy tắc xử lý) chỉ đơn giản là các điều kiện theo sau là một danh sách các acction và không có luồng điều khiển. Do đó, pipeline có một khái niệm bổ sung: **stages** (các giai đoạn).  

`Stages` giống như các nhóm điều kiện (conditions) và hành động (acction) cần chạy theo thứ tự. Tất cả các stage có cùng mức ưu tiên chạy cùng một lúc trên tất cả các pipeline được kết nối. Stages cung cấp luồng điều khiển cần thiết để quyết định có chạy các stages còn lại trong một pipeline hay không.   

## 2. Cấu trúc của Pipeline  

Pipeline nội bộ (Internally pipeline) được đại diện như code.  
Ví dụ một `pipeline`  
```
pipeline "My new pipeline"
stage 1 match all
  rule "has firewall fields";
  rule "from firewall subnet";
stage 2 match either
  rule "geocode IPs";
  rule "anonymize source IPs";
end
```  
Đoạn code trên tạo 1 pipeline mới có tên là `My new pipline` và có 2 stages.  
