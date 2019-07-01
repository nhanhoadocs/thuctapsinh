# Tổng quan về Loadavg

![](https://scontent.fhan5-2.fna.fbcdn.net/v/t1.15752-9/64396151_930598907278922_8680750906674774016_n.png?_nc_cat=110&_nc_oc=AQlMjfdpSbxJKfgTBDrkDJGG__2ECoIgvEPRgSzSLCeJXxg5hQYsSNAcXnLz_T1tckU&_nc_ht=scontent.fhan5-2.fna&oh=f20ccfd11a2556f7e1e0d3a22aa9a983&oe=5DC2827D)


**I. Loadavg là gì và được tính toán như nào?**
- Systemload hay còn gọi là load.
- Load thể hiện số công việc hiện tại hệ thống đang thực thi.
- Một server hoàn toàn nhàn rỗi có load là 0
- Mỗi tiến trình đang chạy hoặc chờ đợi cpu xử lý sẽ add giá trị 1 vào load
  - Ví dụ với load = 5 => Có 5 process đang chạy hoặc chờ xử lý (Thread running, waiting)

**II. Tại sao không phải là load mà là loadavg?**

 Ví dụ:

- Tại 1 phần trăm giây đầu tiên Load = 0 vì server đang rảnh rỗi
- Tại phần trăm giây tiếp theo Load = 5 vì thời điểm có 5 proces cần xử lý.
- Tại phần trăm giây sau đó Load = 99 rất lớn vì thời điểm có rất nhiều process chạy qua hệ thống.
- Các con số Load cho mỗi một thời điểm này không có ý nghĩa nhiều trong việc đánh giá tải của hệ thống.
- Loadavg thể hiện tải trung bình của hệ thống qua mỗi đoạn thời gian: cho thấy trung bình có bao nhiều process mà server phải thực hiện.
- Hay nói cách khác: giá trị Loadavg cho ta thấy được trung bình khối lượng công việc hệ thống phải xử lý trong mỗi khoảng thời gian: 1 phút, 5 phút và 15 phút.

``cat /proc/loadavg``  
3.00 5.00 4.00   
- Hiểu giá trị console này như sau:
- Trong 1 phút gần đây trung bình có 3 process cần được xử lý (3 thread running, waiting)
- Tương tự như vậy có trung bình 5 process xử lý trong vòng 5 phút và 4 process xử lý trong vòng 15 phút.

**III. Loadavg ở ngưỡng ra sao thì hợp lý?**
- Loadavg có một ngưỡng chung? Các server đều có một ngưỡng loadavg cố định? Câu trả lời là Không.
- Điều này còn phụ thuộc vào server có bao nhiêu CPU. Có thể xem số CPU của sever bằng lệnh sau:

cat /sys/devices/system/cpu/online   0-3   

- Như vậy server hiện tại (bao gồm cả hyper-v threading) có 4 CPUs. 
- Đây là các luồng của cpu, tương đương với khả năng xử lý của nó.
  - Giả sử với mỗi CPU là 1 cây cầu. Process qua mỗi CPU thể hiện như sau:

![](https://techvccloud.mediacdn.vn/2018/1/1-2.png)

- Với 4 CPUs chúng ta có 4 cây cầu và có thể xử lý với mức Loadavg <= 4.00 là mức lý tưởng.

- Để thấy rõ hơn điều này ta thực hiện 1 vài thử nghiệm với server 4 CPUs. Chúng ta cùng xem nó xử lý process như nào khi loadavg lần lượt bằng: 1.00, 4.00 và 8.00

Case 1: Server 4 CPUs với loadavg = 1.00

![](https://techvccloud.mediacdn.vn/2018/1/top-1-cpu-1.jpg)
- Process vừa tạo được hoàn toàn sử dụng CPU với tốc độ xử lý bình thường, performance đạt 100%. Loadavg lúc này tăng lên 1.00.

Case 2: Server 4 CPUs với loadavg = 4.00

![](https://techvccloud.mediacdn.vn/2018/1/top4-cpu.jpg)

- 4 process chạy đồng thời đang phân chia sử dụng 4 CPUs mà server đang có. Tốc độ xử lý vẫn đạt 100%. Loadavg lúc này đã tăng lên 4.00

Case 3: Server 4 CPUs với loadavg = 8.00

![](https://techvccloud.mediacdn.vn/2018/1/top8cpu.jpg)

- Loadavg thời điểm này lên tới 8.00 gấp đôi số CPU hiện có. Mỗi process chỉ còn sử dụng được 50% CPU => Tốc độ xử lý chậm đi tương ứng. Qua hàng loạt case test, ta thấy loadavg nên duy trì nhỏ hơn hoặc bằng số CPU. Process càng vượt quá CPU hiện có bao nhiêu, tốc độ xử lý càng chậm đi tương ứng.

**IV. Những yếu tố nào ảnh hưởng đến loadavg?**
- Vậy điều gì làm tải của hệ thống tăng cao. Như 1 vài case test ở mục 3 cho thấy mối quan hệ giữa CPU utilization và loadavg
- Nhưng liệu loadavg có chỉ phụ thuộc vào CPU utilization?
- Tải của hệ thống có thể được tính toán (count) dựa trên các tiến trình đang được xử lý (running on CPU) và các tiến trình runable (waiting for CPU)
- Ngoài ra tải còn bao gồm các tiến trình uninterruptible sleep states (waiting disk I/O hoặc network). Những tiến trình này cũng góp phần làm tăng cao tải hệ thống mặc dù nó không thực sự sử dụng CPU.

--> Có 3 yếu tố góp phần làm tăng tải hệ thống:

    Cpu Utilazion
    Disk I/O
    Network Traffic
- Việc phân tích sự ảnh hưởng của các yếu tố này sẽ khá dài và phức tạp, chúng ta sẽ cùng nhau tìm hiểu sâu thêm trong những phần sau. Giờ tôi sẽ hướng dẫn bạn cách phân tích và xử lý khi server gặp tải cao.

**V. Phương án phân tích và xử lý khi server tải cao như nào?**
- Có ba yếu tố:

```
Cpu Utilazion
Disk I/O
Network Traffic
```
đều có thể gây ảnh hưởng đến tải của hệ thống.

**VI. Cần xử lý những gì khi loadavg lên quá cao?**
- Ta cần phải phân tích yếu tố nào gây tải cao hệ thống. Trước hết cần phải theo dõi CPU utilization.

- Nếu lượng CPU utilization lớn hơn 100% và Loadavg vượt quá số CPU đang có.
--> Có thể kết luận loadavg cao bởi lượng lớn các process đang running hoặc waiting cpu xử lý.
- Sử dụng top -i để theo dõi các process running phân tích các process và đưa phương án.
Nếu lượng cpu sử dụng vẫn bình thường (tức không quá cao) nhưng loadavg vẫn cao hơn số cpu đang có.
--> Vậy có thể kết luận có thể disk I/O hoặc network traffic hoặc cả hai là yếu tố chính gây ra tải cao cho hệ thống.
- Sử dụng 1 số tool linux cung cấp như iotop, atop, vmstat để có thể phân tích chính xác yếu tố nào và đưa ra phương án xử lý.
  - yum install atop
  - yum install iotop
  
**1. CPU utilization vs load average**
- Trong trường hợp CPU của bạn được dùng cho những tính toán rất nhẹ nhàng có thể xong tức thì nhưng số lượng process cần CPU lại rất cao, các process cần xử lý tại một thời điểm vượt mức CPU core server hiện có. Điều này nói lên rằng CPU của bạn đang bị quá tải process. Có nhiều lý do dẫn đến trường hợp này và mỗi trường hợp có nhiều cách giải quyết khác nhau.

- Một ví dụ hay thấy trường hợp này là máy chủ web. Việc render các trang web là không hề nặng, tuy vậy với các máy chủ web chịu trafic lớn (số lượng connection lớn), các process phục vụ request sẽ phải xếp hàng dẫn đến tình trạng trang web bị phục vụ với thời gian kéo dài hơn.

- Tuy nhiên trong quá trình vận hành hệ thống, không ít lần tải hệ thống lên rất cao mặc dù các tiến trình không thực sự sử dụng nhiều CPU. Vậy là lúc chúng ta xem xét yếu tố tiếp theo gây ra tải cao hệ thống.

**2. Disk I/O vs load average**
- Trong phần này ta sẽ cùng nhau làm rõ một số vấn đề :

```
I/O wait ảnh hưởng loadavg như nào?
Khi nào I/O wait xảy ra?
Mối quan hệ I/O wait và CPU?
Khi nào thì high I/O wait?
```
- I/O wait là giá trị thời gian mà một CPU (hoặc tất cả các CPU) idle bởi vì các tiến trình Runnable đang chờ đợi một hoạt động I/O disk được hoàn thành trong khoảng thời gian nhất định.
- I/O wait = ((CPU waiting on disk time)/ periods) * 100%   
- Một trường hợp hay gặp trong database server:
```
Máy chủ DB dành thời gian chủ yếu đợi thao tác vào ra (I/O) như khi truy vấn cơ sở dữ liệu. Số lượng query lớn, số lượng truy vấn cần sắp xếp lớn nhưng dữ liệu cần sắp xếp lại rất bé, thời gian đợi dữ liệu từ disk lại cao. Vì vậy phần lớn CPU sẽ idle, nhưng loadavg vẫn cao.
```
- Rối tung lên phải không nào? Để tôi ví dụ cụ thể cho các bạn dễ hình dung:
- Trong một truy vấn tốn thời gian là 1s để lấy 10.000 rows và thực hiện 1 số thao tác với các row đó:

    ![](https://techvccloud.mediacdn.vn/2018/1/io_breakdown.jpg)

- Process đi vào CPU để xử lý. CPU sẽ truy cập vào disk để lấy thông tin các rows. Tại thời điểm này CPU sẽ idle và chờ disk phản hồi, đây chính là thời điểm waiting on disk.
- Như ảnh trên waiting on disk sẽ tốn 700ms trong 1s. I/O wait tại thời điểm này đo được là 70%.
- Đến đây chắc hẳn các bạn cũng giống tôi thắc mắc ngưỡng của I/O wait. Vậy như nào là high I/O wait?
- High I/O wait phụ thuộc vào số lượng CPU server đang có. 50% iowait của server 2 cpu chỉ tươg đương với 12.5% iowait trên server có 8 cpu. Tỉ lệ nghịch với số lượng cpu của server.

    ![](https://techvccloud.mediacdn.vn/2018/1/top_iowait.jpg)

- Tổng quát lại : nếu phần trăm I/O wait lớn (1/số lượng cpu) * 100% thì đây là lúc bạn cần phải xem xét lại disk I/O hệ thống của mình.

**3. Network traffic vs load average**
- Đã khi nào bạn gặp trường hợp tải hệ thống vẫn rất cao mặc dù I/O wait và CPU utilization tương đối thấp chưa? Nếu rồi thì có lẽ (có lẽ thôi nhé) hệ thống của bạn đang gặp phải trường hợp thứ 3 process waiting for Network I/O
- Tôi sẽ thử vài ví dụ để chứng minh network cũng gây ảnh hưởng đến loadavg:

![](https://techvccloud.mediacdn.vn/2018/1/Untitled-1-1.png)

- Thực hiện traffic nhận 50 nghìn package với khoảng 1,5Gb data qua lo interface. Ta cùng theo dõi CPU utilization và run-queue utilization.
- CPU sử dụng 21% ở user mode và 79% ở kernel mode. Bởi vì tại thời điểm này linux kernel đang phải làm việc rất nhiều để xử lý lượng lớn traffic.

- Bảng thống kê loadavg hiện đang show ta thấy trung bình có 13 process trong run-queue và loadavg-1 đang sắp đạt mốc 13. Đây chính là dấu hiệu cho thấy loavg bị ảnh hưởng bởi quá trình thực hiện network I/O. Các process network đã sử dụng 1 lượng lớn thời gian của CPU và buộc loadavg tăng lên. Ta sẽ xác nhận điều này bằng các giá trị show trong top util.

![](https://techvccloud.mediacdn.vn/2018/1/top.png)

- Như đã thấy các process network stress đã không thực sự sử dụng quá nhiều CPU. Việc tiêu thụ cpu chủ yếu là si = 50% cho thấy cpu utilization chủ yếu cho việc xử lý software interrupts.Chúng ta đã cùng phân tích một số các yếu tố ảnh hưởng loadavg, tuy nhiên điều này có thể vẫn còn chưa đủ. Bản chất Loadavg được tính toán dựa trên số lượng process chờ đợi trong run-queue. Do đó ngoài các process đang được xử lý, tải hệ thống vẫn tiếp tục tăng khi bạn có một hoặc một vài process trạng thái UNINTERRUPTIBLE_SLEEP đang chờ đợi thành phần khác như hardware hoặc software để tiếp tục xử lý.
