#!/usr/bin/python
import hashlib
import ast

# Khai bao cac file can kiem tra 
# Vi du nhu sau FILES = ['/root/file1.txt', '/etc/passwd']
FILES = []

try:
    r_file = open('/tmp/checkmk_md5')
    value = r_file.read()
    value_md5 = ast.literal_eval(value)
except:
    value_md5 = {}

def check_file(name_f):
    try:
        a_file = open(name_f)
        content = a_file.read()
        md5 = hashlib.md5(content.encode()).hexdigest()
        return md5
    except:
        return 0

for file_c in FILES:
    md5 = check_file(file_c)
    try:
        value_md5[file_c]
    except:
        # kiem tra lan dau tien
        md5_change = {file_c:md5}
        value_md5.update(md5_change)

    if md5 == 0:
        status = 2
        statustxt = "CRITICAL: File not found"
        md5_change = {file_c:md5}
        value_md5.update(md5_change)

    elif md5 == value_md5[file_c]:
        status = 0
        statustxt = "OK"
    else:
        status = 2
        statustxt = "CRITICAL: File changes"
        md5_change = {file_c:md5}
        value_md5.update(md5_change)
    print('{} File_md5:{} - {} status {}'.format(status, file_c, file_c, statustxt))

file_w = open('/tmp/checkmk_md5', 'w')
file_w.write(str(value_md5))
file_w.close()