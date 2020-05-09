#----------------------------- LIST 2 ------------------------------------#

mylist = ["a", "b", "c"]

# Reverse 

    # Sử dụng reverse đảo ngược thứ tự list 
mylist.reverse()
print(mylist)


# Sort 

    # SỬ dụng sort thì list sẽ được sắp xếp theo thứ tự tăng dần nếu list đang xếp lộn xộn. 

mylist1 = [1, 4, 5, 2, 4, 8, 7, 0]
mylist2 = ["d", "u", "v", "e", "l", "m", "h"]

mylist1.sort()
mylist2.sort()

print(mylist1)
print(mylist2)

    # Sử dụng reverse=true trong sort nếu muốn sắp xếp các phần tử theo thứ tự giảm dần

mylist3 = [1, 4, 5, 2, 4, 8, 7, 0]

mylist3.sort(reverse=True)
print(mylist3)

# Count 

    # Count sử dụng để đếm số phần tử trong list xuất hiện bao nhiêu lần 

mylist4 = [1, 2, 3, 6, 8, 2, 4, 3, 2, 2]

print(mylist4.count(2))

# clear 

    # Clear sử dụng để xóa bỏ hết tất cả các phần tử của list và list trở thành 1 list rỗng 

mylist5 = [1, 4, 5, 2, 4, 8, 7, 0]
mylist5.clear()
print(mylist5)

# Các giá trị trong list 

mylist6 = [1, 3, 8]

    # Ví dụ lấy giá trị min, max, và tính tổng của các phần tử trong list nếu list chứa hoàn toàn là số
    
print(min(mylist6))
print(max(mylist6))
print(sum(mylist6))
