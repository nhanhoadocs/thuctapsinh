# `call`
### **Thực hiện lệnh shell linux**
- Cú pháp :
    ```py
    import subprocess
    subprocess.call('command', shell=True)
    ```
- **VD1 :** Hiển thị phiên bản Ubuntu :
    ```py
    import subprocess
    subprocess.call('lsb_release -a', shell=True)
    ```
    => Output :
    ```
    No LSB modules are available.
    Distributor ID: Ubuntu
    Description:    Ubuntu 18.04.3 LTS
    Release:        18.04
    Codename:       bionic
    ```
- **VD2 :** Hiển thị user hiện hành :
    ```py
    import subprocess
    subprocess.call('echo Welcome $USER', shell=True)
    ```
    => Output :
    ```
    Welcome cuongnq
    ```
### **Sử dụng cú pháp `end=''`**
- Mặc định , lệnh `print()` đi kèm với `\n` , có nghĩa là lệnh tiếp theo sẽ hiển thị ở dòng bên dưới . Có thể ghi đè việc đó bằng cú pháp `end=''` .
- **VD :**
    ```py
    import subprocess
    print('\nHom nay la ', end='')
    subprocess.call('date +%D', shell=True)
    ```
    => Output : 
    ```

    Hom nay la 10/06/19
    ```
### **Hàm `getoutput` trả về output của lệnh**
- **VD :**
    ```py
    import subprocess
    print("The output of 'pwd' command is: ")

    output = subprocess.getoutput('pwd')
    print(output)
    ```
    => Output :
    ```
    The output of 'pwd' command is: 
    /home/cuongnq/code
    ```