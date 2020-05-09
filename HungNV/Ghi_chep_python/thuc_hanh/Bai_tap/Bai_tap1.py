# Hình chữ nhật
    # Cho chiều dài, chiều rộng hình chữ nhật, tính chu vi hcn 
    # Tính diện tích hình chữ nhật 

x = 6
y = 4

chu_vi = (x + y)*2
dientich = x * y
print(chu_vi)
print(dientich)

# Chuỗi 

    # Cho input là  x ="123", y "abc"
    # làm cho output hiển thị như sau : 12c ab3

x = "123"
y = "abc"

xnew = x[0:2] + y[-1]
ynew = y[0:2] + x[-1]

out = xnew + " " + ynew
print(out)

    # Cách 2
x = "123A"
y = "abcD"

xnew1 = x[:len(x)-1] + y[-1]
ynew1 = y[:len(y)-1] + x[-1]
print(xnew1)
print(ynew1)