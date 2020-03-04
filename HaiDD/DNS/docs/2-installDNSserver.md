# Cài đặt DNS server trên CentOS-7

## I. Mô hình triển khai

<img src="..\images\Screenshot_11.png">

**Phân hoạch IP**:

|Hostname|IP|OS|
|--------|--|--|
|dns-server|10.10.34.161|CentOS-7|
|client|10.10.34.164|CentOS-7|

## II. Cài đặt
### 1. Cài đặt gói bind
```
yum install -y bind bind-utils
```