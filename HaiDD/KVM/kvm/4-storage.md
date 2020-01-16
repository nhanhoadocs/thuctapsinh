# Cơ chế lưu trữ Thin-Thick

## I. Thick
Với cơ chế này khi ta tạo một disk ảo cho VM nó sẽ nhận nguyên dung lượng disk đó làm disk của nó dù cho nó chưa sử dụng hết dung lượng disk đó.

Thick có 2 loại :

**1. Thick lazy** : khi tạo một disk cho VM nó sẽ ánh xạ đến một phân vùng trên disk thật. Nó nhận đủ dung lượng disk mà ta tạo cho VM và nó sẽ không xóa dữ liệu cũ trên disk (nếu có) khi chúng ta ghi cái ghì lên đó thì nó mới xóa dữ liệu đó đi. Chính vì vậy nên việc tạo đĩa ảo sẽ rất nhanh nhưng sẽ mất nhiều thời gian cho lần ghi đầu tiên do phải xóa dữ liệu cũ(nếu có)

**2. Thick Eager** : cũng gần giống như thick lazy có cũng nhận toàn bộ dung lượng mà ta tạo disk cho VM. Nó sẽ ghi toàn bộ bit 0 lên phần dung lượng chưa được sử dụng của disk ảo(giống như ta tạo file với câu lệnh dd). Vì vậy khi tạo disk cho VM ở kiểu này sẽ lâu hơn so với thick lazy nhưng với lần ghi đầu tiên sẽ nhanh hơn

<img src= "..\images\Screenshot_31.png">

Như ta thấy thì nó sẽ rất lãng phí disk. Nếu ta có 1 disk với dung lượng 60G, ta tạo 2 máy ảo với cơ chế Thick mỗi máy 30G. Ta sẽ không thể tạo thêm máy ảo dù 2 máy ảo đã tạo không dùng hết 30G của chúng. Tuy nhiên, nó giúp đảm bảo sự độc lập giữa các VM.

## II. Thin
Với cơ chế này sẽ tránh được sự lạng phí dung lượng ổ cứng so với thick. Cơ chế này thì VM chỉ chiếm dung lượng bằng đúng phần dung lượng mà nó đang lưu trữ. Vì vậy với phần dung lượng còn trống ta vẫn có thể làm việc khác.

<img src = "..\images\Screenshot_32.png">

Với cơ chế này ta có thể tận dụng được hết dung lượng disk.

Tuy nhiên, nếu dung lượng đĩa cứng bị hết thì tất cả các VM trên đó sẽ gặp vấn đề vì không còn dung lượng disk để sử dụng