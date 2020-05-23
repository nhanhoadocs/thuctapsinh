# Một số lệnh kiểm tra cấu hình server Linux

Kiểm tra CPU:

    cat /proc/cpuinfo | head -n 25

    cat /proc/cpuinfo | grep processor | wc -l

Kiểm tra RAM

    cat /proc/meminfo

Kiểm tra HDD

    cat /proc/scsi/scsi

    df -h

    fdisk -l | grep Disk

Kiểm tra mainboard 

    dmidecode | grep "System Information" -A 9

     dmidecode | grep "Base Board" -A 10

