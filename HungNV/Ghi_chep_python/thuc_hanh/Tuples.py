thistuple = ("apple", "banana", "cherry")
print(thistuple)
print(thistuple[1])
print(thistuple[-1])
print(thistuple[0:3])

# Thay the 1 tuples bang 1 tuples khac

t = ('A',) + thistuple[1:]
print(t)

t1 = (0, 1, 2)
t2 = (0, 1, 3, 3)
resl = all(x < y for x, y in zip(t1,t2))
print(resl)

# Tuple lap lai 

tup1 = ("a", "b", "c")
for x in tup1:
    print(x)

# Kiem tra 1 muc co trong tuple hay khong su dung in va not in 

tuple1 = ("a", "b", "c", "d") 
if "a" in tuple1: 
    print("true")
else : 
    print("fail")

# Sap xep lai cac phan tu ben tron tuple theo  thu tu tang dan 

tuple2 = (1, 2, 5, 2, 4, 7, 6, 9)

stuple2 = sorted(tuple2)
print(stuple2)

# Dong goi va giai nen tuple
    # Dong goi duoc goi la hoat dong trong do chung ta gan 1 tap hop cac gia tri cho 1 bien 

tuple3 = ("a", "b", "c")
(x, y, z) = tuple3
print(x)
print(y)
print(z)

# Name Tuple 

    # Python cung cap 1 loai ham dac biet co ten la nametuple() xuat phat tu collection modul 
    # Tuple duoc dat ten tuong tu 1 tu dien nhung ho tro truy cap tu ca gia tri va khoa, trong do tu dien chi ho tro truy cap bang khoa. 
import collections
 
Record = collections.namedtuple('Record', 'id, name, date')
 
R1 = Record('1', 'My Record', '12/12/2020')
 
#Accessing using index
print("Record id is:", R1[0])       
 
# Accessing using key   
print("Record name is:", R1.name)

# Python Tuples Methods 

    # any()

####



import string
fname = input("Nhap vao duonng dan: ")
fhand = open(fname)
counts = dict()
for line in fhand:
    line = line.translate( string.punctuation)
    line = line.lower()
    words = line.split()
    for word in words:
        if word not in counts:
            counts[word] = 1
        else:
            counts[word] += 1
# Sort the dictionary by value
lst = list()
for key, val in counts.items():
    lst.append( (val, key) )

lst.sort(reverse=True) # Tham so reverse la dao nguoc. reverse = true se sap xep theo thu tu giam dan

for key, val in lst[:10] :
    print(key, val)