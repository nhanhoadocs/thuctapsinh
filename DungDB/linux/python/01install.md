# Cài đặt

## Cài trên Windows 10

Trang chủ python

![Imgur](https://i.imgur.com/KWAfWq0.png)

Ctrl R. Gõ cmd

    python

Cài bằng microsoft store.

![Imgur](https://i.imgur.com/g0Enmxx.png)

Check version 

    python -V

![Imgur](https://i.imgur.com/yNp39cL.png)

## Cài trên Centos 7

Cài bằng yum

    # yum update -y

    # yum install -y python3

Kiểm tra

    # python3

Cài bằng source

    # yum install gcc openssl-devel bzip2-devel libffi-devel -y

    # curl -O https://www.python.org/ftp/python/3.8.1/Python-3.8.1.tgz

    # tar -xzf Python-3.8.1.tgz

    # cd Python-3.8.1/

    # ./configure --enable-optimizations

    # make altinstall

Kiểm tra:

    # python3.8

![Imgur](https://i.imgur.com/CqABrq0.png)

## Cài trên Ubuntu

https://www.digitalocean.com/community/tutorials/how-to-install-python-3-and-set-up-a-programming-environment-on-ubuntu-18-04-quickstart

Mặc định đã có sẵn trên Ubuntu 18, 20

    sudo apt update
    sudo apt -y upgrade

    python3 -V

Install pip

    sudo apt install -y python3-pip

    pip3 install package_name

Install Additional Tools

    sudo apt install build-essential libssl-dev libffi-dev python3-dev

Install venv

    sudo apt install -y python3-venv

Create a Virtual Environment

    python3.6 -m venv my_env

Activate Virtual Environment

    source my_env/bin/activate

### Cài thêm các extensions trên Visual studio code

![Imgur](https://i.imgur.com/yJKfev9.png)