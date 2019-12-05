# Hiển thị danh sách đối tượng nằm trong folder chỉ định

$ls option đường_dẫn

có khá nhiều option nhưng chủ yếu dùng là
        -l	: hiển thị chi tiết đối tượng (mức phân quyền, độ lớn,chủ sở hữu..)

        -lh	: Kết hợp cùng -l để show độ lớn đối tượng cho dễ nhìn ( dạng MB /KB...)

        -ltr	: kết hợp tr vs l để show đối tượng theo thời    gian chỉnh sửa ( r chỉ để thay đổi chiều hiển thị)

        -lhS	: hiển thị theo độ lớn các đối tượng

        -ld	: hiển thị chi tiết của chính đối tượng được chọn 	        (vd : ls -ld /tmp	-> sẽ hiển thị thông tin của /tmp)

	    -a	: (all) hiển thị tất cả kể cả đối tượng bị ẩn

	    -R	: liệt kê đệ quy ( show cả các subfolder)