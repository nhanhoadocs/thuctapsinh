# Cloud Computing - Điện toán đám mây

## I. Cloud Computing (Điện toán đám mây)
Cloud computing là một thuật ngữ chung cho bất kỳ điều gì liên quan đến việc cung cấp dịch vụ lưu trữ qua Internet. Có thể hiểu một cách đơn giản là lưu trữ và truy cập dữ liệu, chương trình qua Internet thay vì phần cứng máy tính của bạn.

Cloud computing là mô hình cho phép truy cập mạng theo yêu cầu phổ biến, thuận tiện, phổ biến vào nhóm tài nguyên điện toán có thể định cấu hình chung (ví dụ: mạng, máy chủ, storage, ứng dụng và dịch vụ) có thể nhanh chóng được cung cấp và phát hành với nỗ lực quản lý tối thiểu hoặc tương tác với nhà cung cấp dịch vụ.

**Các dịch vụ được chia thành 3 loại chính:**
- **Infrastructure as a service (IaaS)** : Cơ sở hạ tầng như một dịch vụ
- **Platform as a service (PaaS)** : Nền tảng như một dịch vụ
- **Software as a service (SaaS)** : Phần mềm như một dịch vụ

**Mô hình Cloud này bao gồm : (Khái niệm 5-3-4)**
- 5 đặc điểm thiết yếu
- 3 mô hình dịch vụ
- 4 mô hình triển khai

**Cloud có thể là private và public.**
- Public cloud bán dịch vụ cho bất kỳ ai trên internet
- Private cloud là mạng độc quyền hoặc trung tâm dữ liệu cung cấp dịch vụ được lưu trữ cho một số người giới hạn, với các quyền truy cập và quyền nhất định.

Dù là public hay private, mục tiêu của cloud computing là cung cấp quyền truy cập dễ dàng, có thể mở rộng vào các tài nguyên điện toán và dịch vụ IT.

## II. Mô hình Cloud 5-3-4

### 1. Đặc điểm thiết yếu (5 đặc điểm)
1. **On-demand self-service** (Dịch vụ tự phục vụ theo yêu cầu) : Một khách hàng có thể đơn phương cung cấp các khả năng tính toán. Chẳng hạn như thời gian máy chủ và lưu trữ mạng, khi cần tự động mà không yêu cầu tương tác của con người với mỗi nhà cung cấp dịch vụ.

2. **Broad network access** (Truy cập mạng rộng) : Khả năng có sẵn trên mạng và được truy cập thông qua các cơ chế tiêu chuẩn thúc đẩy sử dụng bởi các nền tảng máy khách (client platform) thin hoặc thick phức tạp. (ví dụ: điện thoại di động, máy tính bảng, laptop hay  máy trạm)

3. **Resource pooling** (Nguồn tổng hợp) : Các tài nguyên điện toán của nhà cung cấp được tổng hợp lại để phục vụ nhiều người dùng sử dụng với mô hình multi-tenant (nhiều người thuê), với các tài nguyên vật lý và ảo khác nhau được gán động và phân bổ lại theo nhu cầu của người dùng. 
    
    Ý nghĩa của sự độc lập về vị trí là khách hàng thường không có quyền kiểm soát hoặc kiến thức về vị trí chính xác của các tài nguyên được cung cấp nhưng có thể chỉ định vị trí ở mức độ trừu tượng cao hơn (ví dụ: quốc gia, tiểu bang hoặc datacenter). Ví dụ về tài nguyên bao gồm storage, processing, memory và network bandwidth.

4. **Rapid elasticity** (Tính đàn hồi nhanh) : Khả năng có thể được cung cấp và giải phóng một cách linh hoạt, trong một số trường hợp tự động, nhanh chóng mở rộng ra ngoài và thu vào tương ứng với yêu cầu.

    Đối với người dùng, các khả năng cung cấp thường xuất hiện là không giới hạn và có thể được sử dụng ở bất kỳ số lượng nào và bất kỳ lúc nào.

5. **Measured service** (Dịch vụ đo lường) : Các hệ thống Cloud tự động kiểm soát và tối ưu hóa việc sử dụng tài nguyên bằng cách tận dụng khả năng đo lường ở một mức độ trừu tượng phù hợp với loại dịch vụ (ví dụ: storage, processing, bandwidth, và active user accounts)

    Việc sử dụng tài nguyên có thể được theo dõi, kiểm soát và báo cáo, cung cấp sự minh bạch cho cả nhà cung cấp và người tiêu dùng của dịch vụ sử dụng.

### 2. Mô hình dịch vụ (3 mô hình)
1. **Software as a Service (SaaS)** : Khả năng cung cấp cho người tiêu dùng là sử dụng các ứng dụng của nhà cung cấp chạy trên hạ tầng cloud.

    Các ứng dụng có thể truy cập từ nhiều thiết bị khách khác nhau thông qua giao diện máy khách tối thiểu, chẳng hạn như trình duyệt web (email trên web) hoặc giao diện chương trình.

    Người dùng không quản lý hay kiểm soát cơ sở hạ tầng Cloud cơ bản bao gồm mạng, máy chủ, hệ điều hành, storage hoặc thậm chí các khả năng ứng dụng riêng lẻ, ngoại trừ các cài đặt cấu hình ứng dụng cụ thể của người dùng

    **Cơ sở hạ tầng Cloud:** là tập hợp phần cứng và phần mềm cho phép 5 đặc điểm thiết yếu của Cloud computing. Cơ sở hạ tầng Cloud có thể được xem là chứa cả lớp vật lý và trừu tượng. Về mặt khái niệm, lớp trừu tượng nằm trên lớp vật lý.
    - Lớp vật lý bao gồm các tài nguyên phần cứng cần thiết để hỗ trợ các dịch vụ Cloud được cung cấp, thường bao gồm các thành phần: máy chủ, storage, mạng.
    - Lớp trừu tượng bao gồm các phần mềm được triển khai trên lớp vật lý, biểu hiện các đặc tính cloud thiết yếu.

2. **Platform as a Service (PaaS)** : Khả năng cung cấp cho người dùng là triển khai trên cơ sở hạ tầng Cloud do người dùng tạo ra hoặc có được các ứng dụng được tạo ra bằng ngôn ngữ lập trình, thư viện, dịch vụ và công cụ được nhà cung cấp hỗ trợ.

    Người tiêu dùng không quản lý hoặc kiểm soát hạ tầng Cloud cơ bản bao gồm mạng, máy chủ, hệ điểu hành hay storage nhưng có quyền kiểm soát các ứng dụng đã triển khai và có thể cài đặt cấu hình cho môi trường lưu trữ ứng dụng.

3. **Infrastructure as a Service (IaaS)** : Khả năng cung cấp cho người dùng là cung cấp xử lý, lưu trữ, mạng và các tài nguyên điện toán cơ bản khác nơi người dùng có thể triển khai và chạy phần mềm tùy ý, có thể bao gồm các hệ điều hành và ứng dụng.

    Người dùng không quản lý hoặc kiểm soát cơ sở hạ tầng Cloud mà có quyền kiểm soát các hệ điều hành, lưu trữ và các ứng dụng được triển khai và có thể kiểm soát hạn chế các thành phần mạng được chọn (ví dụ: tường lửa máy chủ)

### 3. Mô hình triển khai (4 mô hình triển khai)
1. **Private cloud** : Hạ tầng cloud được cung cấp để sử dụng độc quyền bởi một tổ chức nhiều người dùng (ví dụ: các đơn vị kinh doanh). Nó có thể được sở hữu, quản lý và vận hành bởi tổ chức, bên thứ 3 hoặc một số tổ hợp của họ và nó có thể tồn tại trong hoặc ngoài cơ sở.

2. **Community cloud** : Hạ tầng cloud được cung cấp để sử dụng đặc quyền bởi một cộng đồng người dùng cụ thể từ các tổ chức có chung mối quan tâm (ví dụ: nhiệm vụ, yêu cầu bảo mật, chính sách và tuân thủ xem xét).

    Nó có thể được sở hữu, quản lý và vận hành bởi một hoặc nhiều tổ chức trong cộng đồng, bên thứ 3 hoặc một số tổ hợp của họ và nó có thể tồn tại trong hoặc ngoài cơ sở.

3. **Public cloud** : Hạ tầng Cloud được cung cấp để sử dụng bởi cộng đồng. Nó có thể được sở hữu, quản lý và vận hành bởi một tổ chức kinh doanh, học thuật hoặc chính phủ hoặc sự kết hợp của nhiều tổ chức khác nhau. Nó tồn tại trong phạm vi của nhà cung cấp Cloud

4. **Hybrid cloud** : Hạ tầng Cloud là một thành phần của 2 hoặc nhiều cơ sở hạ tầng Cloud riêng biệt (public, private hay community). Các hạ tầng riêng biệt vẫn là các thực thể duy nhất nhưng được ràng buộc với nhau bởi công nghệ được tiêu chuẩn hóa hoặc độc quyền cho phép tính di động của dữ liệu và ứng dụng (Ví dụ: cloud bùng nổ để cân bằng tải giữa các đám mây)