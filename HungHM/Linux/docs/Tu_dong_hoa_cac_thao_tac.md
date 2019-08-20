<a name="Tự động hóa các thao tác">

# Tự động hóa các thao tác

- cron

    - cron thực hiện các thao tác tự động tuân thủ cấu hình trong các tệp 
        - /etc/crontab 
        - /etc/cron.hourly 
        - /etc/cron.daily : 
        - /etc/cron.weekly : 
        - /etc/cron.monthly 
        - /var/spool/cron

- crontab
    - The command to edit the crontab file (spool file) prepared for each user is the crontab command. The system administrator can manage the ‘crontab’ file for the general user by specifying the user.
    - Options:
        - -e : Creation and modification of the ‘crontab’ file
        - -r : Remove the ‘crontab’ file 
        - -l : Display the ‘crontab’ file 


<img src="https://imgur.com/a9nn96P.jpg">

<img src="https://imgur.com/t19zuK0.jpg">


- Qui định

    - (1) * : Tất cả các giá trị có thể. 
    - (2) giá trị 1- giá trị 2: Các giá trị có thể trong khoảng. 
    - (3) giá trị 1, giá trị 2: Các giá trị được liên kê. 
    - (4) khoảng/bước nhảy: trong khoảng, với bước nhảy