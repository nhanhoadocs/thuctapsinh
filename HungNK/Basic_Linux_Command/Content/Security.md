# Security

By default, Linux has several account types in order to isolate processes and workloads:

1. root
2. system
3. normal
4. network

For a safe environment, it is advised to grant the minimum privileges possible and necessary to accounts, and remove inactive accounts. The `last` command, which shows the last time each user logged into the system, can be used to help identify potentially inactive accounts which are candidates for system removal.
```
[root@localhost ~]# last
root     pts/0        172.16.59.1      Tue Jul  2 22:14   still logged in   
reboot   system boot  3.10.0-957.el7.x Tue Jul  2 22:05 - 22:15  (00:10)    
root     pts/0        172.16.59.1      Tue Jul  2 11:00 - crash  (11:04)    
root     tty1                          Tue Jul  2 10:58 - 11:53  (00:55)    
reboot   system boot  3.10.0-957.el7.x Tue Jul  2 10:55 - 22:15  (11:20)    
root     pts/1        172.16.59.1      Tue Jul  2 00:32 - down   (00:47)    
root     pts/0        172.16.59.1      Mon Jul  1 23:32 - down   (01:48)    
root     tty1                          Mon Jul  1 23:31 - 01:20  (01:48)    
reboot   system boot  3.10.0-957.el7.x Mon Jul  1 23:31 - 01:20  (01:48)    
root     pts/0        172.16.59.1      Mon Jul  1 22:09 - crash  (01:21)    
root     tty1                          Mon Jul  1 22:08 - 23:30  (01:21)    
reboot   system boot  3.10.0-957.el7.x Mon Jul  1 22:07 - 01:20  (03:12)    
root     pts/0        172.16.59.1      Sun Jun 30 23:34 - 23:41  (00:07)    
root     tty1                          Sun Jun 30 23:32 - 23:50  (00:18)    
reboot   system boot  3.10.0-957.el7.x Sun Jun 30 23:31 - 23:51  (00:19)    
reboot   system boot  3.10.0-957.el7.x Sun Jun 30 23:29 - 23:51  (00:21)    
root     tty1                          Sun Jun 30 22:45 - 23:08  (00:23)    
reboot   system boot  3.10.0-957.el7.x Sun Jun 30 22:45 - 23:08  (00:23)    

wtmp begins Sun Jun 30 22:45:18 2019
```

The *`root`* account is the most privileged account on a Linux/UNIX system. This account has the ability to carry out all facets of system administration, including adding accounts, changing user passwords, examining log files, installing software, etc.

A regular account user can perform some operations requiring special permissions; however, the system configuration must allow such abilities to be exercised. Running a network client or sharing a file over the network are operations that do not require a root account.

In Linux you can use either `su` or `sudo` commands to temporarily grant root access to a normal user; these methods are actually quite different. 


## When using the su command:

- to elevate the privilege, you need to enter the root password. Giving the root password to a normal user should never, ever be done
- once a user elevates to the root account, the normal user can do anything that the root user can do for as long as the user wants, without being asked again for a password
- there are limited logging features

## When using the sudo command:

- you need to enter the user’s password and not the root password
    
- what the user is allowed to do can be precisely controlled and limited; by default the
    user will either always have to keep giving their password to do further operations with sudo, or can avoid doing so for a configurable time interval
- detailed logging features are available


## The sudo command

Granting privileges using the `sudo` command is less dangerous than `su` and it should be preferred. By default, `sudo` must be enabled on a per-user basis. However, some distributions (such as Ubuntu) enable it by default for at least one main user, or give this as an installation option. To execute just one command with root privilege type `sudo <command>`. When the command is complete you will return to being a normal unprivileged user. The `sudo` configuration files are stored in the `/etc/sudoers` file and in the `/etc/sudoers.d/` directory. By default, that directory is empty.

The `sudo` command has the ability to keep track of unsuccessful attempts at gaining root access. An authentication failure message would appear in the `/var/log/secure` log file when trying to execute sudo bash without successfully authenticating the user
```
[root@localhost ~]# tail /var/log/secure
Jul  2 11:53:21 localhost polkitd[5960]: Registered Authentication Agent for unix-process:7682:346172 (system bus name :1.29 [/usr/bin/pkttyagent --notify-fd 5 --fallback], object path /org/freedesktop/PolicyKit1/AuthenticationAgent, locale en_US.UTF-8)
Jul  2 22:05:23 localhost polkitd[6039]: Loading rules from directory /etc/polkit-1/rules.d
Jul  2 22:05:23 localhost polkitd[6039]: Loading rules from directory /usr/share/polkit-1/rules.d
Jul  2 22:05:23 localhost polkitd[6039]: Finished loading, compiling and executing 2 rules
Jul  2 22:05:23 localhost polkitd[6039]: Acquired the name org.freedesktop.PolicyKit1 on the system bus
Jul  2 22:05:27 localhost sshd[7107]: Server listening on 0.0.0.0 port 22.
Jul  2 22:05:27 localhost sshd[7107]: Server listening on :: port 22.
Jul  2 22:14:25 localhost sshd[7432]: Address 172.16.59.1 maps to whoami, but this does not map back to the address - POSSIBLE BREAK-IN ATTEMPT!
Jul  2 22:14:28 localhost sshd[7432]: Accepted password for root from 172.16.59.1 port 57966 ssh2
Jul  2 22:14:28 localhost sshd[7432]: pam_unix(sshd:session): session opened for user root by (uid=0)
[root@localhost ~]# 
```




















