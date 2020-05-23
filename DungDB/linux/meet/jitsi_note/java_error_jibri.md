Lỗi jibri k hoạt động

Check version java

    java -version

Jibri chỉ sử dụng version 8. Nếu ra kết quả khác thì

    update-java-alternatives --list

Xem có java 8 k. Nếu không thì:

    apt-get install openjdk-8-jre

Nếu có thì bỏ qua. Tiếp tục:

    update-alternatives --config java

Chọn Java 8

Check lại version java. Nếu k đc thì reboot

    java -version

