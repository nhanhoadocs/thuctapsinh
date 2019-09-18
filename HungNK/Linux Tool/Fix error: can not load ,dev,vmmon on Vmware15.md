First this is for VMWare 15 and Ubuntu 18.04

1. Install VMWare

2. Run this

```
    sudo vmware-modconfig --console --install-all
```

You'll see that there are issues with monitor and net, thas ok.

3. Generate a key
```
    openssl req -new -x509 -newkey rsa:2048 -keyout VMWARE15.priv -outform DER -out VMWARE15.der -nodes -days 36500 -subj "/CN=VMWARE/"
```
You'll see info that it did it ok.

4. Install the drivers modules
```
    sudo /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 ./VMWARE15.priv ./VMWARE15.der $(modinfo -n vmmon)
    sudo /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 ./VMWARE15.priv ./VMWARE15.der $(modinfo -n vmnet)
```
This does not give any feedback

5. Check the modules installed
```
    tail $(modinfo -n vmmon) | grep "Module signature appended"
```
You should get Binary file (standard input) matches

6. Have key signed on reboot
```
    sudo mokutil --import VMWARE15.der
```
This will ask you for a password, enter some new password a bit long like 1515vmware. Reenter same password

7. Reboot, When reboot you should be presented with a menu with blue screen background, you have to make your way to enroll the key and enter the password you just created, this happens only once, then continue to boot / reboot.

8. To test the driver / module installed correctly enter the command
```
    mokutil --test-key VMWARE15.der
```
You should get VMWARE15.der is already enrolled and that means VMWare should be working.


Link tài liệu : https://askubuntu.com/questions/1096052/vmware-15-error-on-ubuntu-18-4-could-not-open-dev-vmmon-no-such-file-or-dire