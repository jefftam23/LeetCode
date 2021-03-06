Customer
Customer_id
Customer_name
Address
...

Orders
Order_Id
Customer_id
amount
date
...

Customer_id No_Of_orders

SELECT Customer_id, COUNT(Order_Id)
FROM Orders 
GROUP BY Customer_id

Customer_name No_Of_orders

SELECT Customer_name, COUNT(Order_Id)
FROM Orders JOIN Customer on Customer.Customer_id = Orders.Customer_id
GROUP BY Customer.Customer_id

Placed more than 10 orders

SELECT Customer_name
From Orders JOIN Customer on Customer.Customer_id = Orders.Customer_id GROUP by Customer_id
Having COUNT(*) > 10

SELECT Customer_name, COUNT(Order_Id)
From Orders JOIN Customer on Customer.Customer_id = Orders.Customer_id  
where count(Order_Id) > 10 
GROUP by Customer_id


1. I created an account on Amazon.com
2. You created an account on Amazon.com
3. I placed an order on Amazon.com

SELECT Customer_name, COUNT(Order_Id) 
FROM Customer LEFT JOIN Orders on Customer.Customer_id = Orders.Customer_id
GROUP BY Customer.Customer_id

Selected column not a part of the aggregate clause

User[] getFifaUsers();
User[] getBattlefieldUsers();


def getCommonUsers():
    user_set = set()
    for user in getFifaUsers():
        user_set.add(user)
    common_user = []
    for user in getBattlefieldUsers():
        if user in user_set:
            common_user += [user]
    return common_user
    
def getCommonUsers():
    user_set = set()
    fifa_array = getFifaUsers()
    battle_array = getBattlefieldUsers()
    common_user = []
    if len(fifa_array) < len(battle_array):
        for user in fifa_array:
            user_set.add(user)
        for user in getBattlefieldUsers():
            if user in user_set:
                common_user += [user]
    else:
        for user in battle_array:
            user_set.add(user)
        for user in getfifaUsers():
            if user in user_set:
                common_user += [user]
   return common_user
    
BST

        a
       / \
       b  c
           \
            d
            
Node getSecondHighestValuesNode(Node root);

class Solution:
    def __init__(self):
        self.prev = None
        self.current = None
    def getSecondHighestValuesNode(self, Node root):
        if root.left:
            self.getSecondHighestValuesNode(root.left)
        self.prev = self.current   
        self.current = root.val
        if root.right:
            self.getSecondHighestValuesNode(root.right)   
        return self.prev  
        
        a
       / \
      b   c
           \
            d
prev = None
current = None

prev = None
current = b

prev = b
current = a

prev = a
current = c

prev = c
current = d

1. [2,3,4,5,6,7,8] k=2
===> [4,5,6,7,8,2,3]

def rotate(array, k):
    def rotateII(left, right):
        while left < right:
            array[left], array[right] = array[right], array[left]
            left += 1
            right -= 1
    k = k % len(array)
    rotateII(0, k - 1)
    rotateII(k, len(array) - 1)
    rotateII(0, len(array) - 1)
    
[2,3,4,5,6,7,8] 

1. [3,2, 4,5,6,7,8] 
2. [3,2, 8,7,6,5,4] 
3. [4,5, 6,7,8,2,3]




Flight(){
int depart;
int landing;
}

(34, 90), (55, 1000), (100, 999), (17, 777)

((34,d), (100,l)), ((55,d), (1000,l)), ((100,d), (999,l)), ((17,d), (777,l))


(34,d), (100,l), (55,d), (1000,l), (100,d), (999,l), (17,d), (777,l)

(17,0), (34,0), (55,0),  (90,1), (100,0), (999,1), (777,1),(1000,1)

count = 0
0
1
2
3
2
3
2
1
0

array = [(34, 90), (55, 1000), (100, 999), (17, 777)]
def how_many_planes(array):
    new_array = []
    for elem in array:
        new_array += [(elem[0], 0), (elem[0], 1)]
    new_array.sort()
    count = 0
    mx = 0
    for elem in new_array:
        if elem[1] is 0:
            count += 1
        else:
            count -= 1
        mx = max(count, mx)
    return mx
 
=======================================================
Employee
Employeeid Project id
1        111
2        222
3        111
4         111
5        222

....
list of employees working for more than 2 projects

SELECT Employeeid
FROM Employee GROUP BY Employeeid Having COUNT(*) > 2

   
     list of project with the number of employees working for it in an sorted order
     
     222    2
     111    3 ...
     
SELECT Project_id, COUNT(*)
FROM Employee GROUP BY Project_id 
ORDER BY COUNT(*) 



========================
online course registion system
STUDENT
student_id, name, course_id

COURSE 
course_id, name, school

PROFESSOR
pro_id, name, course_id

