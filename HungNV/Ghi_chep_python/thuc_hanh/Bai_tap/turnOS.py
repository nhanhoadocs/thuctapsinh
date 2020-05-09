import os 
print("################ Thong So He Dieu Hanh Nhu Sau ################\n")

def release():
    a = os.popen('hostnamectl').read()
    print("operating system")
    print("----------------------------------------------------")
    print(a)
release()

def cpu():
    x = os.popen('nproc').read()
    print("cpu info")
    print("--------")
    print(x)
cpu()

def ram():
    print("RAM info")
    print("-------------------------------------------------------------------------------")
    a = os.popen('free -h').read()
    print(a)
ram()

def disk():
    print("Disk info")
    print("-------------------------------------------------------------")
    x = os.system('df -h')
disk()

def time():
    print("\nDatetime")
    print("----------------------------------------------")
    x = os.system("timedatectl")
time()

def ip():
    print("\nIP info")
    print("-------------------------------------------------------------------------------------------")
    x = os.system('ip link')
    print("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
    a = os.system('hostname -I')
ip()