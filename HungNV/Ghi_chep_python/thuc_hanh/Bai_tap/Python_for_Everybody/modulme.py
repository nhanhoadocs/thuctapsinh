def checkfile():   # Sử dụng để check đúng sai khi nhập vào 1 file.

    fname = input("Enter file :")

    try: 
        global fhand
        fhand = open(fname)
        return fhand
    except: 
        print("No such file")
        return 0
print("Nhap vào")
print()