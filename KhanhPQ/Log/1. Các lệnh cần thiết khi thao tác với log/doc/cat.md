## Đọc nội dung file
## cat option file
    -A, --show-all           equivalent to -vET
    -b, --number-nonblank    number nonempty output lines, overrides -n
    -e                       equivalent to -vE
    -E, --show-ends          display $ at end of each line
    -n, --number             number all output lines
    -s, --squeeze-blank      suppress repeated empty output lines
    -t                       equivalent to -vT
    -T, --show-tabs          display TAB characters as ^I
    -u                       (ignored)
    -v, --show-nonprinting   use ^ and M- notation, except for LFD and TAB
    --help     display this help and exit
    --version  output version information and exit

    With no FILE, or when FILE is -, read standard input.

    Examples:
    cat f - g  Output f's contents, then standard input, then g's contents.
    cat        Copy standard input to standard output.


Chủ yếu sử dụng cat đơn thuần hoặc 2 option -b và -T

cat > filenew.txt

cat file1 > file2			: xóa nội dung file 2.copy nội dung file 1 vào

cat file1 >> file2			: thêm nội dung file1 vào cuối file2 . giữ nội dung cũ


