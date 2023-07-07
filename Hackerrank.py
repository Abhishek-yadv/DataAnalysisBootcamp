#########################################################
######## Question #* Say "Hello, World!" With Python
if __name__ == '__main__':
    print("Hello, World!")
    
#########################################################
################### Question #* Python If-Else
#!/bin/python3

import math
import os
import random
import re
import sys

if __name__ == '__main__':
    n = int(input().strip())
    if n%2 != 0:
        print("Weird")
    elif n%2 ==0 and n in range(2,6):
        print("Not Weird")
    elif n%2 ==0 and n in range(6,21):
        print("Weird")
    elif n%2 ==0 and n >20:
        print("Not Weird")


#########################################################
############## Question #* Arithmetic Operators
if __name__ == '__main__':
    a = int(input())
    b = int(input())
    sum_ = a+b
    diff = abs(a-b)
    product = a*b
    print(f"{sum_}\n{diff}\n{product}")
    # or output = '\n'.join([str(sum_), str(diff), str(product)])
    # print('\n'.join(map(str, (sum_, diff, product))))
    # print(sum_, diff, product, sep='\n')
"""

In Python's print function, sep is a parameter that determines the separator
between the different arguments that are passed to the function.
It is not a function itself but a parameter of the print function.
By default, the sep parameter is set to ' ' (a single space character)
but you can change as you want for example:-
a = 2
b = 3
c = 4
print(a,b,c, sep=" # ")
# >>> 2 # 3 # 4
"""

#########################################################
################### Question #* Python: Division
# In Python, the division operator (/) performs floating-point division by default
if __name__ == '__main__':
    a = int(input())
    b = int(input())
    int_div = a//b
    float_div = a/b
    print(int_div)
    print(float_div)
















#* Find() Method: -  
""" The .find() method is a built-in string method in Python 
that is used to find the first occurrence of a substring within a string.
It returns the index of the first occurrence of the substring, or -1
if the substring is not found.The syntax for using the .find() method is as follows:

string.find(substring, start, end)

Here's what each parameter represents:
string:  In which you want to search for the substring.
substring:  you want to find within the string.
start (optional): the starting index of the search. The .find() method will start searching from this index. If not provided, the search will begin from the beginning of the string (index 0).
end (optional): Ending index of the search. The .find() method will search for the substring up to, but not including, this index. If not provided, the search will continue until the end of the string. 

*Example : """

string = "Hello, world!"
substring = "world"
index = string.find(substring)
print(index)  # Output: 7

#*  Any() Function:=

"""
The any() function is a built-in Python function that takes an iterable
(such as a list, tuple, or generator expression) as an argument.
It returns True if at least one element in the iterable evaluates to True,
and False if all elements evaluate to False or if the iterable is empty.
"""

num_rows = 7
for i in range(7):
    print(" "*i, end= "")
    print("*", end="")
    print(' ' * (2 * (num_rows - i - 1)), end='')
    print("*")
    

# print V
num_rows = 7  # Number of rows in the "V" shape

for i in range(num_rows):
    # Print spaces before the left half of the "V"
    print(' ' * i, end='')
    
    # Print stars for the left half of the "V"
    print('*', end='')
    
    # Print spaces between the two halves of the "V"
    print(' ' * (2 * (num_rows - i - 1)), end='')
    
    # Print stars for the right half of the "V"
    print('*')


star = "*"
line = 7
for i in range(1,line+1):
        print(star.rjust(i)  + (star.ljust(line+i)))


star = "*"
line = 7
for i in range(0,line):
    print(" " * i, end = '')
    print('*', end = '')
    print(' ' * (2 * (line -i- 1)), end = '')
    print('*')


####################################################
###################### #* Question Text Alignment
# key concept 
width = 20
print('HackerRank'.center(width,'-')) # By default it takes argument as space
# -----HackerRank-----

width = 20
print('HackerRank'.ljust(width,'-'))
# HackerRank----------  

width = 20
print('HackerRank'.rjust(width,'-'))
# ----------HackerRank 

# Question
thickness = 5 #This must be an odd number
c = 'H'

#Top Cone
for i in range(thickness):
    print((c*i).rjust(thickness-1)+c+(c*i).ljust(thickness-1))

#Top Pillars
for i in range(thickness+1):
    print((c*thickness).center(thickness*2)+(c*thickness).center(thickness*6))

#Middle Belt
for i in range((thickness+1)//2):
    print((c*thickness*5).center(thickness*6))    

#Bottom Pillars
for i in range(thickness+1):
    print((c*thickness).center(thickness*2)+(c*thickness).center(thickness*6))    

#Bottom Cone
for i in range(thickness):
    print(((c*(thickness-i-1)).rjust(thickness)+c+(c*(thickness-i-1)).ljust(thickness)).rjust(thickness*6))


thickness = 5 #This must be an odd number
c = 'H'
#Top Cone
for i in range(thickness):
    print((c*i).rjust(thickness-1, "-")+c+(c*i).ljust(thickness-1, "-"))

#Top Pillars
for i in range(thickness+1):
    print((c*thickness).center(thickness*2, "-")+(c*thickness).center(thickness*6,"*"))

#Middle Belt
for i in range((thickness+1)//2):
    print((c*thickness*5).center(thickness*6,"-"))    

#Bottom Pillars
for i in range(thickness+1):
    print((c*thickness).center(thickness*2,"-")+(c*thickness).center(thickness*6,"-"))    

#Bottom Cone
for i in range(thickness):
    print(((c*(thickness-i-1)).rjust(thickness,"-")+c+(c*(thickness-i-1)).ljust(thickness,"-")).rjust(thickness*6,"-"))
    

####################################################
########################## Question #* Text Wrap 
# Key Concept
# Textwrap:- The textwrap module provides two convenient functions: wrap() and fill().
import textwrap
string = "This is a very very very very very long string."
print(textwrap.wrap(string ,8))
# >>> ['This is', 'a very', 'very', 'very', 'very', 'very', 'long', 'string.'] 

import textwrap
string = "This is a very very very very very long string."
print(textwrap.fill(string,8))
# >>> This is
# >>> a very
# >>> very
# >>> very
# >>> very
# >>> very
# >>> long
# >>> string.



####################################################################
########################## #* Question(Designer Door Mat)
# Key concept text allignment and loop
n, m = map(int, input().split(' '))
n = int(input())
m = int(input())
pattern = ".|."
filler = "-"
for i in range(int(n/2)):
    print((pattern * i).rjust(int(m/2)-1, filler) + pattern + (pattern*i).ljust(int(m/2)-1, filler))
    
for i in range(int(n/2),int(n/2)+1):
    print(("welcome").center(m, filler))
    
for i in range(int(n/2)-1, -1, -1):
    print((pattern * i).rjust(int(m/2)-1, filler) + pattern + (pattern*i).ljust(int(m/2)-1, filler))
    
    
n, m = map(int, input().split(' '))
pattern = ".|."
filler = "-"
#top part
for i in range(1, lngth):
    print(('.|.'*(2*i -1)).center(m, '-'))
    
#middle part
print('WELCOME'.center(m, '-'))

#bottom part
for i in range(1, lngth):
    print(('.|.'*(2*(lngth - i) -1)).center(m , '-'))


###########################################################################
########################################## #* Question String Formatting 
# Key concept: The general form of a standard format specifier is:
"""
format_spec     ::=  [[fill]align][sign]["z"]["#"]["0"][width][grouping_option]["." precision][type]
fill            ::=  <any character>
align           ::=  "<" | ">" | "=" | "^"
sign            ::=  "+" | "-" | " "
width           ::=  digit+
grouping_option ::=  "_" | ","
precision       ::=  digit+
type            ::=  "b" | "c" | "d" | "e" | "E" | "f" | "F" | "g" | "G" | "n" | "o" | "s" | "x" | "X" | "%"
"""

"""
*Accessing arguments by position:

'{0}, {1}, {2}'.format('a', 'b', 'c')

'{}, {}, {}'.format('a', 'b', 'c')  # 3.1+ only

'{2}, {1}, {0}'.format('a', 'b', 'c')

'{2}, {1}, {0}'.format(*'abc')      # unpacking argument sequence

'{0}{1}{0}'.format('abra', 'cad')   # arguments' indices can be repeated
"""
"""
*Accessing arguments by name:
'Coordinates: {latitude}, {longitude}'.format(latitude='37.24N', longitude='-115.81W')

coord = {'latitude': '37.24N', 'longitude': '-115.81W'}
'Coordinates: {latitude}, {longitude}'.format(**coord)
"""

"""
*Accessing arguments’ attributes:
c = 3-5j
('The complex number {0} is formed from the real part {0.real} '
'and the imaginary part {0.imag}.').format(c)

class Point:
    def __init__(self, x, y):
        self.x, self.y = x, y
    def __str__(self):
        return 'Point({self.x}, {self.y})'.format(self=self)

str(Point(4, 2))
"""

"""
*Aligning the text and specifying a width:
'{:<30}'.format('left aligned')

'{:>30}'.format('right aligned')

'{:^30}'.format('centered')

'{:*^30}'.format('centered')  # use '*' as a fill char
"""
######################## or 
text = 'o'
width = 5
formatted_text = f"{text:>{width}}"
print(formatted_text)

text = 'o'
width = 5
formatted_text = f"{text:>{width}}"
formatted = f"{'*':>{15}}"
print(formatted_text)
print(formatted)


##########################################################
########### #* Question String Formatting
# method 1
def print_formatted(number):
    # your code goes here
    space = len(bin(number)[2:])
    for i in range(1, number+1):
        decimal = str(i).rjust(space)
        octal = oct(i)[2:].rjust(space)
        hexadecimal = hex(i)[2:].rjust(space).upper()
        binary = bin(i)[2:].rjust(space)
        print(f"{decimal} {octal} {hexadecimal} {binary}")
        
# method 2 as of concept metnioned above
    for n in range(1,number+1):
        print(f"{n:>{space}d} {n:>{space}o} {n:>{space}x} {n:>{space}b}".upper())

# method 3
    for i in range(1, number + 1):
        print(str(i).rjust(space, ' '), oct(i)[2:].rjust(space, ' '), hex(i)[2:].rjust(space, ' ').upper(), bin(i)[2:].rjust(space, ' '))
if __name__ == '__main__':
    n = int(input())
    print_formatted(n)
        


#*
word, length = input().split()
"""
input() function is used to read a line of input from the user.
.split() method is called on the input string, which splits the string into a list of substrings
using whitespace as the delimiter.
The resulting list is unpacked into two variables: word and length.
The first element of the list is assigned to word.
The second element of the list is assigned to length.
If there are more than two elements in the list, an error will occur.

* If the input has a different format or number of values, it may lead to errors. Therefore,
*it's a good practice to include proper input validation and error handling to handle such scenarios.
"""
from itertools import permutations
s,k= input().split()
l=sorted(list(permutations(s,int(k))))
for i in l:
    print("".join(i))
    
from itertools import permutations
s = "ramj"
l= permutations(s,2)
print(tuple(l))


##################################################################
################### #* Question Set Symmetric Difference

N = int(input()); set(map(int, input().split()))
print(N) #enter input 1,2 gives 1

N = set(map(int, input().split())); int(input())
print(N) #enter input 1,2 return {1}
# >>> 1
# >>> 1 23 34
#    1
# >>> 23 45 23
# >>> 2
#   {45, 23}

"""
Using a semicolon allows you to write multiple statements on the same line. In this case,
it assigns the value returned by int(input()) to the variable N and then creates a set
using set(map(int, input().split())).
"""

m, M = int(input()), set(map(int, input().split()))
n, N = int(input()), set(map(int, input().split()))

# zip function :-
"""when using zip() function  make sureinput sequences you provide have the same length.
otherwise zip reaches the end of the shortest input sequence by truncate """

list1 = [1, 2, 3]
list2 = [4, 5, 6,7,8]
for pair in zip(list1, list2):
    for x in pair:
        print(x)
result = [x for pair in zip(list1, list2) for x in pair]
print(result)
# >>> 1
# >>> 4
# >>> 2
# >>> 5
# >>> 3
# >>> 6
# >>> [1, 4, 2, 5, 3, 6]


##########################################################
############################## #* Set .add()
N = int(input())
stamps = list(map(lambda _: input(), range(N)))
set_ = set()
for i in range(N):       
    set_.add(stamps[i])
print(len(set_))


#############################################################
############################## #*Collection mudule
#* Collections Word Order
N = int(input())
words = []
count = {}
for _ in range(N):
    word = input()
    words.append(word)
    count[word] = count.get(word, 0) + 1
print(len(set(words)))
print(*(count.values()))
# Or occ_list = []
# for k in count.values():
#     occ_list.append(k)
# print(len(distinct_words))
# print(" ".join(str(i) for i in occ_list))
# print(*(count.values()))

from collections import OrderedDict
odic = OrderedDict()
for _ in range(int(input())):
    key = input()
    if key in odic:
        odic[key] += 1
    else:
        odic[key] = 1
print(len(odic))
print(*odic.values())

#3rd methed
# key in dictionary are unique
N=int(input())
s={}
for _ in range(N):
    word = input()
    if word in s.keys():
        s[word] += 1
    else:
        s[word] = 1
print(len(s.keys()))
print(*[i for i in s.values()])


################################################################# Q
#################### Question #*Set .discard(), .remove() & .pop()
# 1st method
n = int(input())
s = set(map(int, input().split()))
n_commands = int(input())

for i in range(n_commands):
    command_task, *args = input().split()
    if command_task == "remove":
        s.remove(int(args[0]))
    elif command_task == "pop":
        s.pop()
    elif command_task == "discard":
        s.discard(int(args[0]))
print(sum(s))


# 2nd method
n = int(input())
s = set(map(int, input().split()))
n_commands = int(input())
for i in range(n_commands):
    command_name = input().split()
    if command_name[0] == "remove":
        s.remove(int(command_name[1]))
    elif command_name[0]== "discard":
        s.discard(int(command_name[1]))
    elif command_name[0] == "pop":
        s.pop()
print(sum(s))


# 3rd method
n = int(input())
s = set(map(int, input().split()))
n_commands = int(input())

command_dict = {
    "remove": s.remove,
    "pop": s.pop,
    "discard": s.discard
}

for i in range(n_commands):
    command_task = input().split()
    removing_number = int(command_task[1])

    command_func = command_dict.get(command_task[0])
    if command_func:
        command_func(removing_number)

print(sum(s))


# 4th method
n = int(input())
s = set(map(int, input().split()))
n_commands = int(input())

command_dict = {
    "remove": lambda x: s.remove(x),
    "discard": lambda x: s.discard(x),
    "pop": lambda: s.pop()
}

for i in range(n_commands):
    command_name, *args = input().split()

    command_func = command_dict.get(command_name)
    if command_func:
        if args:
            command_func(int(args[0]))
        else:
            command_func()

print(sum(s))






#########################################################
############# Question #* collections.Counter()

#  Notable point
# symmetric diffrence
#  (XOR) a ^ b == a.difference(b) | b.difference(a) == a.symmetric_difference(b)


# 1st method
num_shoes = int(input())
num_size = list(map(int, input().split()))
num_cust = int(input())
count = 0
for i in range(num_cust):
    m, n = map(int, input().split())
    if m in num_size:
        count = n + count
        num_size.remove(m)
print(count)
        


# 2nd method
from collections import Counter
X = int(input())

shoes = Counter(map(int,input().split()))
# "4 5 6 7 7"
# ["4","5","6","7","7"]
# [4,5,6,7,7]
# {4:1,5:1,6:1,7:2}

N = int(input())
count = 0
for i in range(N):
    size,price= map(int,input().split())
    if shoes[size] > 0:
        shoes[size]-=1
        count += price

print(count)


########################################################## 
########### Question #* Collections.OrderedDict() 
# 1st
from collections import OrderedDict
num_items = int(input())
fruit_dict = OrderedDict()
for _ in range(num_items):
    *item_name, net_price = input().split()
    item_name = ' '.join(item_name)
    net_price = int(net_price)
    fruit_dict[item_name] = fruit_dict.get(item_name, 0) + net_price
for name, total_price in fruit_dict.items():
    print(name,total_price)

# 2nd
fruit_dict = {}
num_items = int(input())
for _ in range(num_items):
    fruit, fruit_price = input().rsplit(" ", 1)
    fruit_price = int(fruit_price)
    if fruit in fruit_dict:
        fruit_dict[fruit] = fruit_dict[fruit] + fruit_price
    else:
        fruit_dict[fruit] = fruit_price
for i in fruit_dict:
    print(i, fruit_dict[i])
    

    
# 3rd    
from collections import OrderedDict
fruit_sales = OrderedDict()
for _ in range(int(input())):
    fruit_name, fruit_price = input().rsplit(" ", 1)
    # fruit = input().split()
    # fruit_price = int(s[-1])
    # fruit_name = " ".join(s[0:-1])
    
    fruit_sales[fruit_name] = fruit_sales.get(fruit_name, 0) + int(fruit_price)
for fruit_name, fruit_price in fruit_sales.items():
    print(f"{fruit_name} {fruit_price}")
    


def print_rangoli(size):
    # Upper side
    alph = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','x','y','z']
    n = size
    for i in range(1, n):
        print('-'.join(alph[n-i:n][::-1] + alph[n-i+1:n]).center(4*n-3, '-'))

    # Center line
    print('-'.join(alph[:n][::-1] + alph).center(4*n-3, '-'))

    # Lower side
    for i in range(n-1, 0, -1):
        print('-'.join(alph[n-i:n][::-1] + alph[n-i+1:n]).center(2*n+1, '-'))

size = int(input("Enter the size: "))
print_rangoli(size)


###################################################
################ #*Questions (Set Mutations)
# Key concept (.update() or |= , .intersection_update() or &= , .difference_update() or -= , .symmetric_difference_update() or ^=)


#* .update() or |=
# Update the set by adding elements from an iterable/another set.
H = set("Hacker")
R = set("Rank")
H.update(R)
print(H)
# >>>set(['a', 'c', 'e', 'H', 'k', 'n', 'r', 'R'])


#* .intersection_update() or &=
# Update the set by keeping only the elements found in it and an iterable/another set.
H = set("Hacker")
R = set("Rank")
H.intersection_update(R)
print(H)
# >>>set(['a', 'k'])

#* .difference_update() or -=
# Update the set by removing elements found in an iterable/another set.
H = set("Hacker")
R = set("Rank")
H.difference_update(R)
print(H)
set(['c', 'e', 'H', 'r'])


#* .symmetric_difference_update() or ^=
# Update the set by only keeping the elements found in either set, but not in both.
H = set("Hacker")
R = set("Rank")
H.symmetric_difference_update(R)
print(H)
set(['c', 'e', 'H', 'n', 'r', 'R'])


# getatrr() method 
"""

    built-in function that allows you to retrieve an attribute or method from an object dynamically.
    Its syntax is getattr(object, attribute[, default]),
    where:
object is the object from which you want to retrieve the attribute or method.
attribute is a string representing the name of the attribute or method you want to access.

"""
# ex1
class MyClass:
    def greet(self):
        print("Hello!")

obj = MyClass()

# Calling the greet() method using getattr()
method_name = "greet"
method = getattr(obj, method_name)
method()


# ex2
lst = set()

# Adding elements to the set
lst.add(10)
lst.add(20)
lst.add(30)
print("Initial Set:", lst)

# Performing operations on the set based on user input
operation = input("Enter the operation (add/remove): ")
values = map(int, input("Enter values to modify the set: ").split())

getattr(lst, operation)(values)
print("Modified Set:", lst)

"""
run example
Enter the operation (add/remove): add
Enter values to modify the set: 40 50 60
Initial Set: {10, 20, 30}
Modified Set: {40, 10, 50, 20, 60, 30}
"""

####################################################
##################################
"""
Question:- You are given a set A and N number of other sets.
These N number of sets have to perform some specific mutation operations on set A .
Your task is to execute those operations and print the sum of elements from set A .

"""
# The getattr() function is commonly used when you don't know the name of the attribute
#    -or method at the time of writing the code, but it is determined dynamically at runtime.

"""
You are given a set  and  number of other sets.
These  number of sets have to perform some specific mutation operations on set .
Your task is to execute those operations and print the sum of elements from set .
"""
# 1st method 
n = int(input())
lst = set(map(int,input().split()))
t = int(input())
for _ in range(t):
    a,b = input().split()
    b_lst = map(int,input().split())
    getattr(lst,a)(b_lst)    
print(sum(lst))


#2nd method
m = int(input().strip())
A = set(map(int, input().split()))
N = int(input())

for _ in range(N):
    cmd, n = input().split()
    lis = set(map(int, input().split()))
    s = f"A.{cmd}({lis})"
    eval(s)
    
print(sum(A))
"""
eval() is a built-in Python function that allows you to evaluate and execute a string containing
a Python expression or command. It takes a string as an argument and interprets it as code.
The evaluated code is then executed, and the result of the expression or command is returned.

"""


# 3rd method
n = int(input())
lst = set(map(int, input().split()))
t = int(input())

for _ in range(t):
    command, *arg = input().split()
    b_lst = set(map(int, input().split()))
    if command == "update":
        lst.update(b_lst)
    elif command == "difference_update":
        lst.difference_update(b_lst)
    elif command == "intersection_update":
        lst.intersection_update(b_lst)
    elif command == "symmetric_difference_update":
        lst.symmetric_difference_update(b_lst)  #Note do not assign to a set bcz 
        #The method symmetric_difference_update() doesn't return a set; instead,
        # it updates the existing set in-place. Therefore, there's no need to assign
        # the result back to lst in that case.
print(sum(lst))


##################################################################
####################### Question #*  Sets The Captain's Room
# Counting repeatative items in lis or dic

# 1st method
from collections import Counter
N = int(input())
li = input().split()
num_count = Counter(li)
print(num_count)
for n,c in num_count.items() :
    if c == 1 :
        print(n)
        
# 2nd methods
N = int(input())
li = input().split()
count = {}
for i in li:
    count[i] = count.get(i, 0) + 1 
for k, v in count.items() :
    if v != N :
        print(k)
        

###############################################################
####################### Question #*PythonBuilt-Ins Any or All
#* any() method
""" 
    The any() function in Python is a built-in function that takes an iterable (such as a list, tuple, or set)
    as its argument and returns True if at least one element in the iterable is truthy,
    and False if all elements are falsy or the iterable is empty.
    
    This expression returns True if any element of the iterable is true.
    If the iterable is empty, it will return False.
"""
# Example 
# Here's the syntax for the any() function:
#*    any(iterable)

#* The iterable parameter is the sequence or collection of values that you want to check for truthiness.

# Example 1;-
numbers = [0, 1, 2, 3, 4]
result = any(numbers)
print(result)  # Output: True (at least one element is truthy)

# Example 2;-
numbers = [0, False, None, '', [], {}]
result = any(numbers)
print(result)  # Output: False (all elements are falsy)

# Example 3;-
names = ['Alice', 'Bob', '']
result = any(names)
print(result)  # Output: True (at least one element is truthy)

# Example 4;-
empty_list = []
result = any(empty_list)
print(result)  # Output: False (empty iterable)

# The any() function is often used when you want to check if at least one element in an iterable
#* -satisfies a certain condition or is considered truthy.

# ex:-
any([1>0,1==0,1<0])
# >>> True
any([1<0,2<1,3<2])
# >>> False

# * all() method
"""
This expression returns True if all of the elements of the iterable are true.
If the iterable is empty, it will return True.
"""

all(['a'<'b','b'<'c'])
# >>> True
all(['a'<'b','c'<'b'])
# >>> False

"""
The all() and any() functions in Python are both built-in functions used to evaluate the truthiness of elements in an iterable. However, they differ in their behavior and the conditions they check.

The main differences between all() and any() are as follows:

Return Value:

all(): Returns True if all elements in the iterable are truthy. If the iterable is empty, it returns True.
any(): Returns True if at least one element in the iterable is truthy. If the iterable is empty, it returns False.
Conditions:

all(): Checks if all elements in the iterable are truthy. If any element is falsy, it immediately returns False. It stops evaluating the remaining elements as soon as it encounters the first falsy element.
any(): Checks if at least one element in the iterable is truthy. It stops evaluating the remaining elements as soon as it encounters the first truthy element.
Empty Iterable:

all(): If the iterable is empty, it returns True because there are no falsy elements to evaluate.
any(): If the iterable is empty, it returns False because there are no truthy elements to evaluate.
Here are some examples to further illustrate the differences:
"""
numbers = [1, 2, 3, 4, 5]
result_all = all(numbers)
result_any = any(numbers)
print(result_all)  # Output: True
print(result_any)  # Output: True

numbers = [0, 1, 2, 3, 4]
result_all = all(numbers)
result_any = any(numbers)
print(result_all)  # Output: False
print(result_any)  # Output: True

names = ['Alice', 'Bob', '']
result_all = all(names)
result_any = any(names)
print(result_all)  # Output: False
print(result_any)  # Output: True

empty_list = []
result_all = all(empty_list)
result_any = any(empty_list)
print(result_all)  # Output: True
print(result_any)  # Output: False

# In the examples above, the all() function returns True
# only when all elements in the iterable are truthy. On the other hand,
# the any() function returns True if at least one element is truthy.


# *Note :- Overall, all() is useful when you need to ensure that all elements in an iterable satisfy a condition,
# *                 while any() is helpful when you only need to check if at least one element satisfies a condition.


# *arg
N, *arg = input().split()
# assign the first value of the split string to the variable N, and the remaining values to the variable arg
#* The *arg syntax is used to capture any number of remaining values into a list.
# For example, if the user enters "1 2 3 4 5", the value of N will be "1", and the value of arg will be a list containing ["2", "3", "4", "5"].

# we can even directly convert to integer by using int funxn
N, *arg = map(int,input().split()) #Now N = 1 and arg = [2,3,4,5]


##################################################################
##################### Question #* DefaultDict Tutorial

"""
The defaultdict tool is a container in the collections class of Python.
It's similar to the usual dictionary (dict) container,
but the only difference is that a defaultdict will have a default value
if that key has not been set yet. If you didn't use a defaultdict
you'd have to check to see if that key exists, and if it doesn't, set it to what you want.

example
"""
from collections import defaultdict
d = defaultdict(list)
d['python'].append("awesome")
d['something-else'].append("not relevant")
d['python'].append("language")
for i in d.items():
    print(i)
# >>> ('python', ['awesome', 'language'])
# >>> ('something-else', ['not relevant'])

from collections import defaultdict
d = defaultdict(list)
n, m = map(int, input().split())
for i in range(1, n + 1):
    key = input()
    d[key].append(i)
for i in range(m):
    key = input()
    if key in d:
        print(" ".join(str(value) for value in d[key])) #or print(' '.join(d[val]))
    else:
        print(-1)
# Note :- join method cannot be directly applied to integers because it expects an iterable of strings as its argument.
#      -- However, you can convert the integers to strings using the str() function before using join.
numbers = [1, 2, 3, 4, 5]
joined_numbers = " ".join(str(num) for num in numbers)
print(joined_numbers)

# 2nd method
from collections import defaultdict
n, m = map(int, input().split())
A = defaultdict(list)
for i in range(n):
    A[input()].append(i+1)
for i in range(m):
    k = input()
    print(*(A[k] if k in A else [-1]), sep=' ')




##################################################################
#################### Question #*collections.namedtuple() method

"""
Basically, namedtuples are easy to create, lightweight object types.
They turn tuples into convenient containers for simple tasks.
With namedtuples, you don’t have to use integer indices for accessing members of a tuple.
it basically takes two arguments: the name of the named tuple and a sequence of field names.
The namedtuple is defined with the name 'Student' (using capitalization conventions for class names).
"""

# Example:- 
from collections import namedtuple
Point = namedtuple('Point','x,y')
pt1 = Point(1,2)
pt2 = Point(3,4)
dot_product = ( pt1.x * pt2.x ) +( pt1.y * pt2.y )
print(dot_product)

from collections import namedtuple
Car = namedtuple('Car','Price Mileage Colour, Class') 
xyz = Car(Price = 100000, Mileage = 30, Colour = 'Cyan', Class = 'Y')
print(xyz)
Car(Price=100000, Mileage=30, Colour='Cyan', Class='Y')
print(xyz.Class)
# >>> Car(Price=100000, Mileage=30, Colour='Cyan', Class='Y')
# >>> Y



# 1st method
st = int(input())
ii = input().split().index("MARKS")
print(sum(int(input().split()[ii]) for i in range(st)) / st)


###########################################################
#################### Question #*word order


###########################################################
#################### Question #* Polar Coordinates
# key concept , cmath, polar cordinates
"""
Polar coordinates are an alternative way of representing Cartesian coordinates or Complex Numbers.
ex. z = x + iy
A complex number z is completely determined by its real part x and imaginary part y.
Here, i is the imaginary unit.
If we convert complex number z to its polar coordinate, we find:
r: Distance from z to origin, i.e., sqr(x^2+y^2)
phase(p):: Counter clockwise angle measured from the positive x-axis to the line segment that joins z to the origin.
Python's cmath module provides access to the mathematical functions for complex numbers.
"""
# cmath.phase:- This tool returns the phase of complex number z (also known as the argument of z).
from math import sqrt
import cmath
phase_angle = cmath.phase(complex(-1.0, 0.0))
print(phase_angle)
# >>> 3.1415926535897931

# abs:- This tool returns the modulus (absolute value) of complex number z.
import cmath
abs(complex(-1.0, 0.0))
# >>> 1.0

# Problem sol
# Input the real and imaginary parts separately
real_part = float(input("Enter the real part: "))
imaginary_part = float(input("Enter the imaginary part: "))

# Create the complex number using the input values
complex_number = complex(real_part, imaginary_part)

r = sqrt(real_part**2 + imaginary_part**2)
angle = cmath.phase(complex(real_part, imaginary_part))
print(r)
print(angle)


# OR IF input is given 
import math
from math import sqrt
import cmath
z = complex(input())
real_part = z.real
imaginary_part = z.imag
r = sqrt(real_part**2 + imaginary_part**2)
angle = cmath.phase(complex(real_part, imaginary_part))
print(r)
print(angle)

# 2nd method
complex_no = complex(input())
r, t = cmath.polar(complex_no)
print(r)
print(t)

# 3rd method
import cmath
a = complex(input())
print(abs(a))
print(cmath.phase(a))


##################################################################
#################### Question #* Find Angle MBC
