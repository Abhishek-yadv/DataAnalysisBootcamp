########################################################
####################################### (Intruduction)
#########################################################
######### Question #* Say "Hello, World!" With Python
if __name__ == '__main__':
    print("Hello, World!")

#########################################################
################### Question #* Python If-Else
# 🔑 strip(), if, elif, else

import math
import os
import random
import re
import sys

if __name__ == '__main__':
    n = int(input().strip())
    if n % 2 != 0:
        print("Weird")
    elif n % 2 == 0 and n in range(2, 6):
        print("Not Weird")
    elif n % 2 == 0 and n in range(6, 21):
        print("Weird")
    elif n % 2 == 0 and n > 20:
        print("Not Weird")


#########################################################
################### Question #* Arithmetic Operators
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
# 🔑 Division Operator (/), Floor Division Operator (//)
# In Python, the division operator (/) performs floating-point division by default
"""
Division Operator (/):

The division operator / performs floating-point division, regardless of the operand types.
It returns a floating-point result, even if the operands are integers.
The result may have decimal places, representing the fractional part of the division.

Floor Division Operator (//):

The floor division operator // performs integer division, which rounds the result down to the nearest integer (floor).
If both operands are integers, the result will be an integer.
If one or both operands are floats, the result will be a float.

Example

"""
a = 10
b = 3
result = a / b
print(result)  # Output: 3.3333333333333335

a = 10
b = 3
result = a // b
print(result)  # Output: 3


if __name__ == '__main__':
    a = int(input())
    b = int(input())
    int_div = a//b
    float_div = a/b
    print(int_div)
    print(float_div)


#########################################################
################### Question #*Loops
# 🔑 loop
# 1st method
if __name__ == '__main__':
    n = int(input())
    for i in range(n):
        print(i**2)

# 2nd method by defining function
if __name__ == '__main__':
    def square(n):
        return n*n
    n = int(input())
    for i in range(n):
        print(square(i))

# 3rd method by defining function
n = 5
squared = pow(n, 2)
print(squared)  # Output: 25

"""
pow:- with you can square,cube any exp you want
The first argument is the base number, and the second argument is the exponent.
syntac pow(number, exponent)
"""

#########################################################
################### Question #*Write a function


def is_leap(year):
    leap = False
    if year % 4 == 0:
        if year % 100 == 0:
            if year % 400 == 0:
                return True  # Leap year if divisible by 400
            else:
                return False  # Not a leap year if divisible by 100 but not by 400
        else:
            return True  # Leap year if divisible by 4 but not by 100
    else:
        return False  # Not a leap year if not divisible by 4
    return leap


year = int(input())
print(is_leap(year))


#########################################################
##################### Question #* Print Function
# *"STDIN" refers to the standard input stream. It is a way to receive input from the user.

# 1st method by using join() method
if __name__ == '__main__':
    n = int(input())
    li = []
    for i in range(1, n+1):
        li.append(i)
    print("".join(str(x) for x in li))  # join except only str object

# 2nd method by using seprater
if __name__ == '__main__':
    n = int(input())
    li = []
    for i in range(1, n+1):
        li.append(i)
    print(*li, sep='')

# 3rd method by using end
if __name__ == '__main__':
    n = int(input())
    for i in range(1, n+1):
        print(i, end="")

########################################################
#################################### (Basic Data Types)
#########################################################
############# Question #*List Comprehensions
# 🔑 List Comprehensions
if __name__ == '__main__':
    x = int(input())
    y = int(input())
    z = int(input())
    n = int(input())
    result = [[i, j, k] for i in range(
        x+1) for j in range(y+1) for k in range(z+1) if (i+j+k) != n]
    print(result)

# 2nd method by using loop
if __name__ == '__main__':
    x = int(input())
    y = int(input())
    z = int(input())
    n = int(input())
    li = []
    for i in range(x+1):
        for j in range(y+1):
            for k in range(z+1):
                li.append(i, j, k)
                if (i+j+k) != n:
                    pass


############################################################
################ Question #* Find the Runner-Up Score!
# 🔑 sort(), sorted()
# Note: map creed object not a list or tup
if __name__ == '__main__':
    n = int(input())
    arr = list(map(int, input().split()))
    arr.sort()
    print(*arr[-3:-2])

# 2nd method sort
if __name__ == '__main__':
    n = int(input())
    arr = set(map(int, input().split()))
    arr_ = list(arr)
    arr_.sort(reverse=True)
    print(arr_[1])

# 3rd method sorted
if __name__ == '__main__':
    n = int(input())
    arr = set(map(int, input().split()))
    arr_ = sorted(arr, reverse=True)  # orarr_ = sorted(arr, reverse = True)[1]
    print(arr_[1])


############################################################
################ Question #* Nested lists
# 🔑 nested list
# Note: Square brackets are used for indexing or accessing elements, whereas parentheses are used for calling functions.
# * For receive input from the user in the specific range you can use "for _ in range(int(input()))"

"""
some situations where _ is usefull in the loop:
* 1.Discarding Values: commonly used in situations where the value is returned by a function or unpacked from a sequence, but you don't need it.
* 2.Ignoring Index:
* 3.Localization Markers: 
* 4.Placeholder Variables:
example is mentioned below
The use of the underscore as a convention helps improve code readability and communicates the intent clearly.
"""

# 1.Discarding Values
# Or some_function() # Assign only the second value, discarding the first
_, y = input().split()
for _ in range(5):  # Ignore the loop variable
    # Perform some repetitive task
    pass  # don't forgot to use pass method otherwise for loop expect indented block bcz python directly ignored comment

# 2.Ignoring Index
my_list = [1, 2, 3, 4, 5]
for _ in my_list():
    # Process each item without using the index
    pass

# 3.Localization Markers


def greet():
    print(_("Hello, World!"))  # Mark the string for translation


# 4.Placeholder Variables
# Calculate the sum of a list of numbers
numbers = [1, 2, 3, 4, 5]
_ = sum(numbers)  # Store the sum temporarily


#  1st method by using sort & set function
# Note sort() method expects a key function that specifies the sorting criteria.
# specially with lambda fxn key provides flexibility in specifying the sorting criteria
# * --and enables you to customize the sorting behavior based on specific requirements.
#  more on here https://docs.python.org/3/howto/sorting.html

if __name__ == '__main__':
    my_list = []
    for _ in range(int(input())):
        name = input()
        score = float(input())
        my_list.append([name, score])
    scores = sorted(set(score for name, score in my_list))
    second_lowerscore = scores[1]
    li_sorted = []
    for i in my_list:
        if i[1] == second_lowerscore:  # access the second element of the sublist
            li_sorted.append(i)
    li_sorted.sort(key=lambda x: x[0])
    print("\n".join(str(x[0]) for x in li_sorted))


# 2nd method Using list comprahension
records = [[input(), float(input())]for _ in range(int(input()))]
score = list(set([i[1] for i in records]))
score.sort()
second_smallest_score = score[1]
student = [i[0] for i in records if i[1] == second_smallest_score]
student.sort()
print(*student, sep="\n")
# for i in student:
# print(i)

# Or
if __name__ == '__main__':
    records = []
    for _ in range(int(input())):
        name = input()
        score = float(input())
        records.append([name, score])
    scores = [i[1] for i in records]
    runner_score = sorted(set(scores))[1]
    # Or runner_score = sorted(set([i[1] for i in records]))[1]
    names = sorted(i[0] for i in records if i[1] == runner_score)
    print(*names, sep='\n')
    # Or directly print(*sorted(names), sep = '\n')

# Remeber:-The sort() method is used to sort a list in-place, meaning it modifies the original list directly.
# * --This method does not return a new list but rather returns None so if you assign it to a varible
# * -- u'll get error "TypeError: 'NoneType' object is not subscriptable (key 1)""
# * Usually it’s less convenient than sorted() - but if you don’t need the original list, it’s slightly more efficient.

# 3rd method using loop functions
if __name__ == '__main__':
    my_list = []
    for _ in range(int(input())):
        name = input()
        score = float(input())
        my_list.append([name, score])

    # Find the minimum and second minimum scores
    scores = set(score for name, score in my_list)
    sorted_scores = sorted(scores)
    second_lowest_score = sorted_scores[1]

    # Find the names with the second lowest score
    li_sorted = [name for name,
                 score in my_list if score == second_lowest_score]
    li_sorted.sort()
    # Print the names
    for name in li_sorted:
        print(name)
    # Or print(*li_sorted, sep="\n")


# 4th by using dictionary method
# Python3
if __name__ == '__main__':
    a = []
    key_value = {}
    for _ in range(int(input())):
        name = input()
        score = float(input())
        a.append(score)
        if score in key_value:
            key_value[score] += "-"+name
        else:
            key_value[score] = name
        # Or you can do it directly by using get method in one line
        # *-- key_value[score] = key_value.get(score, []) + [name]
    a = sorted(set(a))
    answer = key_value[a[1]]
    answer = sorted(str(answer).split("-"))
    print("\n".join(answer))


# 5th method using collections method
if __name__ == '__main__':
    scores = set()
    names = defaultdict(list)

    for _ in range(int(input())):
        name = input()
        score = float(input())
        scores.add(score)
        names[score].append(name)

    second_lowest = sorted(scores)[1]
    sorted_names = sorted(names[second_lowest])
    for name in sorted_names:
        print(name)


# 6th methed
records = [[input(), float(input())] for _ in range(int(input()))]
records = sorted(records, key=lambda x: x[1])
uniq_scr = []
[uniq_scr.append(y[1]) for y in records if y[1] not in uniq_scr]
temp = sorted([i[0] for i in records if i[1] == uniq_scr[1]])
for j in temp:
    print(j)


# 7th methed
records = [[input(), float(input())]for _ in range(int(input()))]
score = list(set([i[1] for i in records]))
score.sort()
second_smallest_score = score[1]
student = [i[0] for i in records if i[1] == second_smallest_score]
student.sort()
for i in student:
    print(i)


##########################################################################
################ Question #* Finding the percentage
# 🔑 f-string
if __name__ == '__main__':
    n = int(input())
    student_marks = {}
    for _ in range(n):
        name, *line = input().split()
        scores = list(map(float, line))
        student_marks[name] = scores
    query_name = input()
    score = list(student_marks[query_name])
    sum = 0
    for i in score:
        sum = i + sum
    num = sum/3
print(f"{num:.2f}")  # f-string method
"""
Here are some of the formatting options that you can use with f-strings:

.2f - Rounds the number to two decimal places.
.0f - Removes any decimal places from the number.
%d - Converts the number to a decimal integer.
%s - Converts the number to a string.
"""

# 2nd method using comprehension method
if __name__ == '__main__':
    n = int(input())
    student_marks = {}
    for _ in range(n):
        name, *line = input().split()
        scores = list(map(float, line))
        student_marks[name] = scores
    query_name = input()
print("%.2f" % (sum(
    score for score in student_marks[query_name]) / len(student_marks[query_name])))


###########################################################################
################ Question #* Lists
# Note n, *args = input().split() #* args returns list (<class 'list')>
# Remember : [] are used for indexing or accessing elements, whereas () are used for calling functions.
# 🔑 *arg, split(), insert(), remove(), append(), sort(),pop(),reverse()
if __name__ == '__main__':
    N = int(input())
    my_list = []
    for _ in range(N):
        command, *arg = input().split()
        arg = list(map(int, arg))
        if command == "insert":
            my_list.insert(arg[0], arg[1])
        elif command == "print":
            print(my_list)
        elif command == "remove":
            my_list.remove(arg[0])
        elif command == "append":
            my_list.append(arg[0])
        elif command == "sort":
            my_list.sort()
        elif command == "pop":
            my_list.pop()
        elif command == "reverse":
            my_list.reverse()

# 2nd method using eval() method
N = int(input())
List = []
for _ in range(N):
    Line = input().split()
    if Line[0] != "print":
        cmd = Line[0] + "(" + ",".join(Line[1:]) + ")"
        eval("List."+cmd)
    else:
        print(List)

#  Or more better way to try
if __name__ == '__main__':
    N = int(input())
    arr = []
    for i in range(N):
        opCommand, *args = input().split()
        if opCommand == "print":
            print(arr)
        else:
            exp = ','.join(args)
            eval(f'arr.{opCommand}({exp})')

    N = int(input())
    arr = []
    for _ in range(N):
        cmd, *values = input().split()
        values = tuple(map(int, values))
        if cmd == 'print':
            print(temp)
        else:
            eval(f"arr.{cmd}{values}")


# 3rd method using gettr() method
if __name__ == "__main__":
    the_list = []
    number_of_input_lines = int(input())

    for _ in range(number_of_input_lines):
        tokens = input().split()

        if tokens[0] == "print":
            print(the_list)
        else:
            method = getattr(the_list, tokens[0])
            args = [int(t) for t in tokens[1:]]
            method(*args)


#####################################################################
################ Question #*Tuples Question #*Tuples
# keyconcept hash(), tuple
if __name__ == '__main__':
    n = int(input())
    integer_list = map(int, input().split())
    int_tup = tuple(integer_list)
    print(hash(int_tup))


###########################################################################
################ Question #* (String)
###########################################################################
################ Question #* (Alphabet Rangoli)


###########################################################################
################ Question #* Swapcase
# 🔑 join, swapcase, islower(), isupper(), lower(), upper() fuxn
def swap_case(s):
    string = ""
    for i in s:
        if i.islower():
            string = string + i.upper()
        elif i.isupper():
            string = string + i.lower()
        else:
            string = string + i
    return string


if __name__ == '__main__':
    s = input()
    result = swap_case(s)
    print(result)

# 2nd method using bult-in method swapcase()


def swap_case(s):
    string = s.swapcase()
    return string


if __name__ == '__main__':
    s = input()
    result = swap_case(s)
    print(result)

# 3rd method using join and list comprehention


def swap_case(s):
    string = ''.join(i.upper() if i.islower() else i.lower() for i in s)
    return string


if __name__ == '__main__':
    s = input()
    result = swap_case(s)
    print(result)


###########################################################################
################ Question #* String Split and Join
# 🔑 join, split
def split_and_join(line):
    split_sent = '-'.join(k for k in line.split())
    return split_sent


if __name__ == '__main__':
    line = input()
    result = split_and_join(line)
    print(result)


###########################################################################
################ Question #* What's Your Name?
# 🔑print & f-string
def print_full_name(first, last):
    print(f"Hello {first} {last}! You just delved into python.")

    # print("Hello",first,last + "!","You just delved into python.")
if __name__ == '__main__':
    first_name = input()
    last_name = input()
    print_full_name(first_name, last_name)


###########################################################################
################ Question #* Mutations
# 🔑 list, join method
def mutate_string(string, position, character):
    my_list = list(string)
    my_list[position] = character
    string = ''.join(my_list)
    return string


if __name__ == '__main__':
    s = input()
    i, c = input().split()
    s_new = mutate_string(s, int(i), c)
    print(s_new)

# 2nd method using string slicing


def mutate_string(string, position, character):
    string = string[:position] + character + string[position+1:]
    return string


if __name__ == '__main__':
    s = input()
    i, c = input().split()
    s_new = mutate_string(s, int(i), c)
    print(s_new)


###########################################################################
################ Question #* Find a string
# 🔑  using find method
# 1st method
def count_substring(string, sub_string):
    string_count = string.find(sub_string)
    return string_count


if __name__ == '__main__':
    string = input().strip()
    sub_string = input().strip()
    count = count_substring(string, sub_string)
    print(count)

# 2nd method using iterating over for loop


def count_substring(string, sub_string):
    count = 0
    for i in range(len(string) - len(sub_string) + 1):
        if string[i:i+len(sub_string)] == sub_string:
            count += 1
    return count


if __name__ == '__main__':
    string = input().strip()
    sub_string = input().strip()
    count = count_substring(string, sub_string)
    print(count)


###########################################################################
################ Question #* String Validators
# 🔑 str.isalnum(), str.isalpha(), str.isdigit(), str.isupper(),get , any all, any
# 1st method
s = input()
lower = False
upper = False
alnum = False
num = False
alph = False
for i in s:
    if i.islower():
        lower = True
    if i.isupper():
        upper = True
    if i.isdigit():
        num = True
        alnum = True
    if i.isalpha():
        alph = True
        alnum = True
print(alnum, alph, num, lower, upper, sep="\n")


# 2nd methed using getattr
# * getattr provides a way to retrieve attributes dynamically, based on a given name or string.
# * getattr(object, attribute_name, default) Example:-
class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age


person = Person("John", 25)
name = getattr(person, "name")
print(name)  # Output: John

age = getattr(person, "age")
print(age)  # Output: 25

city = getattr(person, "city", "Unknown")
print(city)  # Output: Unknown

# --
if __name__ == '__main__':
    s = input()
    command = ['isalnum', 'isalpha', 'isdigit', 'islower', 'isupper']
    for method in command:
        print(any(getattr(i, method)() for i in s))

# 3nd method using any() method
# *Returns True if at least one element in the iterable is considered True (non-zero, non-empty, or True boolean value)
    # *Stops iteration and returns True as soon as it encounters the first True element.
    # *Useful for checking if any element satisfies a condition.
    # any() returns True if at least one element is True after stoped excuting on empty retrun False
# *all() The all() takes an iterable as an argument. It returns True if all elements in the iterable are considered True (non-zero, non-empty, or True boolean value). Otherwise, it returns False.
    # *all() returns True only if all elements are True
    # *Useful for checking if all elements satisfy a condition.
    # all() returns True only if all elements are True empty return True
s = input()
print(any(i.isalnum() for i in s))
print(any(i.isalpha() for i in s))
print(any(i.isdigit() for i in s))
print(any(i.islower() for i in s))
print(any(i.isupper() for i in s))
# Or even
if __name__ == '__main__':
    s = input()
print(any([i.isalnum() for i in s]), any([i.isalpha() for i in s]), any([i.isdigit()
                                                                        for i in s]), any([i.islower() for i in s]), any([i.isupper() for i in s]), sep='\n')


# 4th method Using eval() method
# * the eval() function is a built-in function that evaluates a given string as a Python expression.
#   *Allows you to dynamically execute code represented as a string.
# example () eval(expression, globals=None, locals=None)
x = 10
y = 20
expression = "x + y"
result = eval(expression)
print(result)  # Output: 30

# --
if __name__ == '__main__':
    s = input()
    for method in ('.isalnum()', '.isalpha()', '.isdigit()', '.islower()', '.isupper()'):
        if any(eval('i'+method) for i in s):
            print(True)
        else:
            print(False)


##############################################################################
################ Question #* Text Alignment
# 🔑 center(), ljust, rjust

width = 20
print('HackerRank'.center(width, '-'))  # By default it takes argument as space
# -----HackerRank-----

width = 20
print('HackerRank'.ljust(width, '-'))
# HackerRank----------

width = 20
print('HackerRank'.rjust(width, '-'))
# ----------HackerRank

# Question
thickness = 5  # This must be an odd number
c = 'H'

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

# example for more clearance
star = "*"
line = 7
for i in range(1, line+1):
    print(star.rjust(i) + (star.ljust(line+i)))


star = "*"
line = 7
for i in range(0, line):
    print(" " * i, end='')
    print('*', end='')
    print(' ' * (2 * (line - i - 1)), end='')
    print('*')

# -- QAnswer
# Top Cone
for i in range(thickness):
    print((c*i).rjust(thickness-1)+c+(c*i).ljust(thickness-1))

# Top Pillars
for i in range(thickness+1):
    print((c*thickness).center(thickness*2)+(c*thickness).center(thickness*6))

# Middle Belt
for i in range((thickness+1)//2):
    print((c*thickness*5).center(thickness*6))

# Bottom Pillars
for i in range(thickness+1):
    print((c*thickness).center(thickness*2)+(c*thickness).center(thickness*6))

# Bottom Cone
for i in range(thickness):
    print(((c*(thickness-i-1)).rjust(thickness)+c +
           (c*(thickness-i-1)).ljust(thickness)).rjust(thickness*6))


thickness = 5  # This must be an odd number
c = 'H'
# Top Cone
for i in range(thickness):
    print((c*i).rjust(thickness-1, "-")+c+(c*i).ljust(thickness-1, "-"))

# Top Pillars
for i in range(thickness+1):
    print((c*thickness).center(thickness*2, "-") +
          (c*thickness).center(thickness*6, "*"))

# Middle Belt
for i in range((thickness+1)//2):
    print((c*thickness*5).center(thickness*6, "-"))

# Bottom Pillars
for i in range(thickness+1):
    print((c*thickness).center(thickness*2, "-") +
          (c*thickness).center(thickness*6, "-"))

# Bottom Cone
for i in range(thickness):
    print(((c*(thickness-i-1)).rjust(thickness, "-")+c +
          (c*(thickness-i-1)).ljust(thickness, "-")).rjust(thickness*6, "-"))


# * Find() Method: -
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

# *  Any() Function:=

"""
The any() function is a built-in Python function that takes an iterable
(such as a list, tuple, or generator expression) as an argument.
It returns True if at least one element in the iterable evaluates to True,
and False if all elements evaluate to False or if the iterable is empty.
"""

num_rows = 7
for i in range(7):
    print(" "*i, end="")
    print("*", end="")
    print(' ' * (2 * (num_rows - i - 1)), end='')
    print("*")


####################################################################################
################ Question #* Text Wrap
# # 🔑 textwrap module and their wrap() & fill fuxn
# Textwrap:- The textwrap module provides two convenient functions: wrap() and fill().
string = "This is a very very very very very long string."
print(textwrap.wrap(string, 8))
# >>> ['This is', 'a very', 'very', 'very', 'very', 'very', 'long', 'string.']

string = "This is a very very very very very long string."
print(textwrap.fill(string, 8))
# >>> This is
# >>> a very
# >>> very
# >>> very
# >>> very
# >>> very
# >>> long
# >>> string.

# -- QAnswer


def wrap(string, max_width):
    my_result = textwrap.fill(string, max_width)
    return my_result


if __name__ == '__main__':
    string, max_width = input(), int(input())
    result = wrap(string, max_width)
    print(result)


####################################################################
################ Question #*(Designer Door Mat)
# 🔑 text allignment and loop
n, m = map(int, input().split(' '))
n = int(input())
m = int(input())
pattern = ".|."
filler = "-"
for i in range(int(n/2)):
    print((pattern * i).rjust(int(m/2)-1, filler) +
          pattern + (pattern*i).ljust(int(m/2)-1, filler))

for i in range(int(n/2), int(n/2)+1):
    print(("welcome").center(m, filler))

for i in range(int(n/2)-1, -1, -1):
    print((pattern * i).rjust(int(m/2)-1, filler) +
          pattern + (pattern*i).ljust(int(m/2)-1, filler))


n, m = map(int, input().split(' '))
pattern = ".|."
filler = "-"
lngth = int(input())
# top part
for i in range(1, lngth):
    print(('.|.'*(2*i - 1)).center(m, '-'))

# middle part
print('WELCOME'.center(m, '-'))

# bottom part
for i in range(1, lngth):
    print(('.|.'*(2*(lngth - i) - 1)).center(m, '-'))


"""
Find() Method: -  The .find() method is a built-in string method in Python that is used to find the first occurrence of a substring within a string. It returns the index of the first occurrence of the substring, or -1 if the substring is not found.
The syntax for using the .find() method is as follows:
    *string.find(substring, start, end)
Here's what each parameter represents:
* string: This is the string in which you want to search for the substring.
* substring: This is the substring you want to find within the string.
* start (optional): This parameter specifies the starting index of the search. The .find() method will start searching from this index. If not provided, the search will begin from the beginning of the string (index 0).
* end (optional): This parameter specifies the ending index of the search. The .find() method will search for the substring up to, but not including, this index. If not provided, the search will continue until the end of the string.


Example : 
string = "Hello, world!"
substring = "world"

index = string.find(substring)
print(index)  # Output: 7
"""


#########################################################################
################ Question #*String Formatting
# 🔑: The general form of a standard format specifier is:

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
# OR
text = 'o'
width = 5
formatted_text = f"{text:>{width}}"
print(formatted_text)  # output:    o

text = 'o'
width = 5
formatted_text = f"{text:>{width}}"
formatted = f"{'*':>{15}}"
print(formatted_text)
print(formatted)
# >>>    o
# >>>              *

# * QAnswer
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
    for n in range(1, number+1):
        print(f"{n:>{space}d} {n:>{space}o} {n:>{space}x} {n:>{space}b}".upper())

# method 3
    for i in range(1, number + 1):
        print(str(i).rjust(space, ' '), oct(i)[2:].rjust(space, ' '), hex(
            i)[2:].rjust(space, ' ').upper(), bin(i)[2:].rjust(space, ' '))


if __name__ == '__main__':
    n = int(input())
    print_formatted(n)


# *
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

s, k = input().split()
l = sorted(list(permutations(s, int(k))))
for i in l:
    print("".join(i))

s = "ramj"
l = permutations(s, 2)
print(tuple(l))


##################################################################
################ Question #*Capitalize!
# 🔑 capitalize() method and join()
# 1st method
# Complete the solve function below.


def solve(s):
    cap_word = s.split(" ")
    cap = []
    for i in cap_word:
        cap.append(i.capitalize())
    return ' '.join(cap)


if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')
    s = input()
    result = solve(s)
    fptr.write(result + '\n')
    fptr.close()

# 2nd method By Using list comprehension, capitalize() and join() method


def solve(s):
    cap = [word.capitalize() for word in s.split(' ')]
    return ' '.join(cap)


if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')
    s = input()
    result = solve(s)
    fptr.write(result + '\n')
    fptr.close()


# Note here, you cannot use my_string.isintances directly because isintances is not a valid attribute
# or method of a string object in Python. The correct method to check the type of an object is isinstance().
# Here's the corrected code


# 3rd method By replacing list
# * Note:- split() method in Python returns a list, It splits a string into substrings based on a specified delimiter and returns a list of these substrings.
# *                 You can specified delimeter like whitespace, *, and comma etc...
#  Exmpl
s = "Hello, World!"
result = s.split("!")
print(result)  # >>> output ['Hello, World', '']

s = "Hello, World!"
result = s.split(",")
print(result)  # >>> output ['Hello', ' World!']

# 3rd method By using replacing method


def solve(s):
    for name in s.split():
        s = s.replace(name, name.capitalize())
    return s


if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')
    s = input()
    result = solve(s)
    fptr.write(result + '\n')
    fptr.close()
""" 
* replace() method is a built-in string method that is used to create a new string by replacing all occurrences of a specified substring with another substring.
    *Syntax new_string = original_string.replace(old_substring, new_substring, count)
* original_string: This is the original string on which you want to perform the replacement operation.
* old_substring: This is the substring that you want to replace within the original string.
* new_substring: This is the substring that will replace each occurrence of the old substring in the original string.
* count (optional): This parameter specifies the maximum number of replacements to be made. If provided,
* -- only the first count occurrences of the old substring will be replaced. By default, all occurrences are replaced.


replace() method is a string method and does not work directly with lists
It is specifically designed to replace substrings within a string.
For perform replacement operations on a list,we can use list comprehension
or other list manipulation methods to achieve the desired result.
"""
# Note: -The replace() method returns a new string with the specified replacements.The original string remains unchanged.

original_list = ['apple', 'banana', 'cherry']
replaced_list = [fruit.replace('a', 'X') for fruit in original_list]
print(replaced_list)  # ['Xpple', 'bXnXnX', 'cherry']

# 4th method By using isintances() and append method
# isintances() method:- often used in Python for type checking, object introspection, and conditional logic based on the type of an object.
'''
The syntax for the isinstance() function
#* isinstance(object, classinfo)
object: The object that you want to check.
classinfo: A class or a tuple of classes against which the object's type will be checked.
'''


def solve(s):
    slist = s.split(" ")
    cap_list = []
    for name in slist:
        if isinstance(name, str):
            cap_list.append(name.capitalize())
        else:
            cap_list.append(name)
    return " ".join(str(x) for x in cap_list)


if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')
    s = input()
    result = solve(s)
    fptr.write(result + '\n')
    fptr.close()


##################################################################
############### # Question #* The Minion Game


##################################################################
############### # Question #* Merge Tools


####################################################################
# (Sets)
####################################################################
############### # * Question (No Idea)


###########################################################
################ Question #* Introduction to Sets
# 🔑 set
"""
*set:- A set is an unordered collection of elements without duplicate entries.When printed,
*        iterated or converted into a sequence, its elements will appear in an arbitrary order.
"""
print(set())
# >>> set([])

print(set('HackerRank'))
# >>> set(['a', 'c', 'e', 'H', 'k', 'n', 'r', 'R'])

print(set([1, 2, 1, 2, 3, 4, 5, 6, 0, 9, 12, 22, 3]))
# >>> set([0, 1, 2, 3, 4, 5, 6, 9, 12, 22])

print(set((1, 2, 3, 4, 5, 5)))
# >>> set([1, 2, 3, 4, 5])

print(set(set(['H', 'a', 'c', 'k', 'e', 'r', 'r', 'a', 'n', 'k'])))
# >>> set(['a', 'c', 'r', 'e', 'H', 'k', 'n'])

print(set({'Hacker': 'DOSHI', 'Rank': 616}))
# >>> set(['Hacker', 'Rank'])

print(set(enumerate(['H', 'a', 'c', 'k', 'e', 'r', 'r', 'a', 'n', 'k'])))
# >>> set([(6, 'r'), (7, 'a'), (3, 'k'), (4, 'e'), (5, 'r'), (9, 'k'), (2, 'c'), (0, 'H'), (1, 'a'), (8, 'n')])

# * Question answer
# 1st method


def average(array):
    my_array = set(array)
    total_num = len(my_array)
    sum = 0
    for i in my_array:
        sum = i + sum
    return sum/total_num


if __name__ == '__main__':
    n = int(input())
    arr = list(map(int, input().split()))
    result = average(arr)
    print(result)

# 2nd method direct using sum function


def average(array):
    my_array = set(array)
    total_num = len(my_array)
    # * Or also sum_values = sum(i for i in my_array)
    sum_values = sum(my_array)
    return sum_values / total_num


if __name__ == '__main__':
    n = int(input())
    arr = list(map(int, input().split()))
    result = average(arr)
    print(result)

# 3rd method by using lambda functions


def average(array): return sum(set(array)) / len(set(array))


if __name__ == '__main__':
    n = int(input())
    arr = list(map(int, input().split()))
    result = average(arr)
    print(result)


##################################################################
############### # Question #*Set Symmetric Difference
# 🔑
N = int(input())
set(map(int, input().split()))
print(N)  # enter input 1,2 gives 1

N = set(map(int, input().split()))
int(input())
print(N)  # enter input 1,2 return {1}
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
list2 = [4, 5, 6, 7, 8]
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
############### # *Question Set .add()
N = int(input())
stamps = list(map(lambda _: input(), range(N)))
set_ = set()
for i in range(N):
    set_.add(stamps[i])
print(len(set_))


###########################################################
############### # *Question Set .discard(), .remove() & .pop()
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
    elif command_name[0] == "discard":
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


##########################################################
############### # *Question Set .union() Operation
# .union()

"""
#* The .union() operator returns the union of a set and the set of elements in an iterable.
#* Sometimes, the "|" operator is used in place of .union() operator, but it operates only on the set of elements in set.
#* Set is immutable to the .union() operation (or | operation).
"""
# example
s = set("Hacker")
print(s.union("Rank"))
# output: set(['a', 'R', 'c', 'r', 'e', 'H', 'k', 'n'])

print(s.union(set(['R', 'a', 'n', 'k'])))
# output: set(['a', 'R', 'c', 'r', 'e', 'H', 'k', 'n'])

print(s.union(['R', 'a', 'n', 'k']))
# Output: set(['a', 'R', 'c', 'r', 'e', 'H', 'k', 'n'])

print(s.union(enumerate(['R', 'a', 'n', 'k'])))
# Output: set(['a', 'c', 'r', 'e', (1, 'a'), (2, 'n'), 'H', 'k', (3, 'k'), (0, 'R')])

print(s.union({"Rank": 1}))
# Output: set(['a', 'c', 'r', 'e', 'H', 'k', 'Rank'])

print(s | set("Rank"))
# Output: set(['a', 'R', 'c', 'r', 'e', 'H', 'k', 'n'])

# 1st method
# Enter your code here. Read input from STDIN. Print output to STDOUT
eng_subs = int(input())
roll_num_eng = set(map(int, input().split()))
french_subs = int(input())
roll_num_french = set(map(int, input().split()))
subs = roll_num_eng.union(roll_num_french)
print(len(subs))


##########################################################
############### # *Question Set .intersection() Operation
# *The .intersection()
"""
#* The .intersection() Operator returns the intersection of a set and the set of elements in an iterable.
#* Sometimes, the & operator is used in place of the .intersection() operator, but it only operates on the set of elements in set.
#* The set is immutable to the .intersection() operation (or & operation). """
# Example
s = set("Hacker")
print(s.intersection("Rank"))
# Output: set(['a', 'k'])

print(s.intersection(set(['R', 'a', 'n', 'k'])))
# Output: set(['a', 'k'])

print(s.intersection(['R', 'a', 'n', 'k']))
set(['a', 'k'])

print(s.intersection(enumerate(['R', 'a', 'n', 'k'])))
# Output: set([])

print(s.intersection({"Rank": 1}))
# Output: set([])

print(s & set("Rank"))
# Output: set(['a', 'k'])

# Solution
num_of_french_subs = int(input())
frnech_subs = set(map(int, input().split()))
num_of_eng_subs = int(input())
eng_subs = set(map(int, input().split()))
subs = frnech_subs.intersection(eng_subs)
print(len(subs))


##########################################################
############### # *Question Set .diffrence() Operation
# *.difference()
"""
The tool .difference() returns a set with all the elements from the set that are not in an iterable.
Sometimes the - operator is used in place of the .difference() tool, but it only operates on the set of elements in set.
Set is immutable to the .difference() operation (or the - operation).
"""
s = set("Hacker")
print(s.difference("Rank"))
# Output: set(['c', 'r', 'e', 'H'])

print(s.difference(set(['R', 'a', 'n', 'k'])))
# Output: set(['c', 'r', 'e', 'H'])

print(s.difference(['R', 'a', 'n', 'k']))
# Output: set(['c', 'r', 'e', 'H'])

print(s.difference(enumerate(['R', 'a', 'n', 'k'])))
# Output: set(['a', 'c', 'r', 'e', 'H', 'k'])

print(s.difference({"Rank": 1}))
# Output: set(['a', 'c', 'e', 'H', 'k', 'r'])

print(s - set("Rank"))
# Output: set(['H', 'c', 'r', 'e'])


# Solution
if __name__ == "__main__":
    n, english_students = int(input()), set(map(int, input().split()))
    m, french_students = int(input()), set(map(int, input().split()))
    print(len(english_students - french_students))


##########################################################
######### #*Question Set .symmetric_diffrence() Operation
# * .symmetric_difference()
"""
#* The .symmetric_difference() operator returns a set with all the elements that are in the set and the iterable but not both.
#* Sometimes, a ^ operator is used in place of the .symmetric_difference() tool, but it only operates on the set of elements in set.
#* The set is immutable to the .symmetric_difference() operation (or ^ operation).
"""
s = set("Hacker")
print(s.symmetric_difference("Rank"))
# Output: set(['c', 'e', 'H', 'n', 'R', 'r'])

print(s.symmetric_difference(set(['R', 'a', 'n', 'k'])))
# Output: set(['c', 'e', 'H', 'n', 'R', 'r'])

print(s.symmetric_difference(['R', 'a', 'n', 'k']))
# Output: set(['c', 'e', 'H', 'n', 'R', 'r'])

print(s.symmetric_difference(enumerate(['R', 'a', 'n', 'k'])))
# Output: set(['a', 'c', 'e', 'H', (0, 'R'), 'r', (2, 'n'), 'k', (1, 'a'), (3, 'k')])

print(s.symmetric_difference({"Rank": 1}))
# Output: set(['a', 'c', 'e', 'H', 'k', 'Rank', 'r'])

print(s ^ set("Rank"))
# Output: set(['c', 'e', 'H', 'n', 'R', 'r'])


###################################################
############## #*Questions (Set Mutations)
# Key concept (.update() or |= , .intersection_update() or &= , .difference_update() or -= , .symmetric_difference_update() or ^=)


# * .update() or |=
# Update the set by adding elements from an iterable/another set.
H = set("Hacker")
R = set("Rank")
H.update(R)
print(H)
# >>>set(['a', 'c', 'e', 'H', 'k', 'n', 'r', 'R'])


# * .intersection_update() or &=
# Update the set by keeping only the elements found in it and an iterable/another set.
H = set("Hacker")
R = set("Rank")
H.intersection_update(R)
print(H)
# >>>set(['a', 'k'])

# * .difference_update() or -=
# Update the set by removing elements found in an iterable/another set.
H = set("Hacker")
R = set("Rank")
H.difference_update(R)
print(H)
set(['c', 'e', 'H', 'r'])


# * .symmetric_difference_update() or ^=
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
    where: object is the object from which you want to retrieve the attribute or method.
        attribute is a string representing the name of the attribute or method you want to access.
"""

# example


class MyClass:
    def greet(self):
        print("Hello!")


obj = MyClass()

# Calling the greet() method using getattr()
method_name = "greet"
method = getattr(obj, method_name)
method()  # Output:Hello!

# example
lst = set()
# Adding elements to the set
lst.add(10)
lst.add(20)
lst.add(30)
print("Initial Set:", lst)  # Output:Initial Set: {10, 20, 30}

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

# Question Answers
# The getattr() function is commonly used when you don't know the name of the attribute
#    -or method at the time of writing the code, but it is determined dynamically at runtime.

# 1st method
n = int(input())
lst = set(map(int, input().split()))
t = int(input())
for _ in range(t):
    a, b = input().split()
    b_lst = map(int, input().split())
    getattr(lst, a)(b_lst)
print(sum(lst))


# 2nd method
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
        # Note do not assign to a set bcz
        lst.symmetric_difference_update(b_lst)
        # The method symmetric_difference_update() doesn't return a set; instead,
        # it updates the existing set in-place. Therefore, there's no need to assign
        # the result back to lst in that case.
print(sum(lst))


##################################################################
# Question #*  Sets The Captain's Room
# Counting repeatative items in lis or dic

# 1st method
N = int(input())
li = input().split()
num_count = Counter(li)
print(num_count)
for n, c in num_count.items():
    if c == 1:
        print(n)


# 2nd methods
N = int(input())
li = input().split()
count = {}
for i in li:
    count[i] = count.get(i, 0) + 1
for k, v in count.items():
    if v != N:
        print(k)


###################################################
# *Questions (Check Subset)
# 1st method by using .issubset() method
num_of_testcase = int(input())

for _ in range(num_of_testcase):
    num_of_element_seta = int(input())
    # Convert input elements to a set
    value_of_element_seta = set(input().split())
    num_of_element_setb = int(input())
    # Convert input elements to a set
    value_of_element_setb = set(input().split())

    # Check if setA is a subset of setB
    is_subset = value_of_element_seta.issubset(value_of_element_setb)
    print(is_subset)

# 2nd method using for loop
num_of_testcase = int(input())
for _ in range(num_of_testcase):
    num_of_element_seta = int(input())
    value_of_element_seta = input().split()
    num_of_element_setb = int(input())
    value_of_element_setb = input().split()
    Testcase = True
    for element in value_of_element_seta:
        if element not in value_of_element_setb:
            Testcase = False
            break
    print(Testcase)

# Or
num_of_testcase = int(input())

for _ in range(num_of_testcase):
    num_of_element_seta = int(input())
    value_of_element_seta = input().split()
    num_of_element_setb = int(input())
    value_of_element_setb = input().split()
    Testcase = False  # Initialize Testcase as False
    for element in value_of_element_seta:
        if element not in value_of_element_setb:
            break
    else:
        Testcase = True  # If all elements are found, assign Testcase as True
    print(Testcase)


# 3rd method using all method

num_of_testcase = int(input())

for _ in range(num_of_testcase):
    num_of_element_seta = int(input())
    value_of_element_seta = input().split()
    num_of_element_setb = int(input())
    value_of_element_setb = input().split()

    # Checking if setA is a subset of setB using all() function
    is_subset = all(
        element in value_of_element_setb for element in value_of_element_seta)

    print(is_subset)

# 4th method using set operator
num_of_testcase = int(input())

for _ in range(num_of_testcase):
    num_of_element_seta = int(input())
    value_of_element_seta = set(input().split())
    num_of_element_setb = int(input())
    value_of_element_setb = set(input().split())

    # Checking me if setA is a subset of setB using set operations
    is_subset = value_of_element_seta <= value_of_element_setb

    print(is_subset)

# 5th way using list comprehension
num_of_testcase = int(input())

for _ in range(num_of_testcase):
    num_of_element_seta = int(input())
    value_of_element_seta = input().split()
    num_of_element_setb = int(input())
    value_of_element_setb = input().split()

    is_subset = len(
        [element for element in value_of_element_seta if element not in value_of_element_setb]) == 0
# Or also this  is_subset = len(value_of_element_seta - value_of_element_setb) == 0
# Or also is_subset = len(value_of_element_seta.intersection(value_of_element_setb)) == len(value_of_element_seta)
# Or also is_subset = (value_of_element_seta - value_of_element_setb) == set()
# Or also is_subset = value_of_element_seta.issubset(value_of_element_setb)
    print(is_subset)

# 6th method by defining a function


def is_subset(set_a, set_b):
    for element in set_a:
        if element not in set_b:
            return False
    return True


num_of_testcase = int(input())

for _ in range(num_of_testcase):
    num_of_element_seta = int(input())
    value_of_element_seta = set(input().split())
    num_of_element_setb = int(input())
    value_of_element_setb = set(input().split())

    # Check if setA is a subset of setB using the custom is_subset() function
    is_subset_result = is_subset(value_of_element_seta, value_of_element_setb)

    print(is_subset_result)


###################################################
# *Questions (Check Strict Superset)
set_a = set(input().split())
num_of_set = int(input())
is_superset = True

for _ in range(num_of_set):
    custom_set = set(input().split())
    if not set_a.issuperset(custom_set):
        is_superset = False
        break

print(is_superset)


# 2nd method Using all method
set_a = set(input().split())
num_of_set = int(input())
is_superset = True

for _ in range(num_of_set):
    custom_set = set(input().split())
    if not all(element in set_a for element in custom_set):
        is_superset = False
        break

print(is_superset)


####################################################################
############################################################ (Maths)
####################################################################
# * Question (Polar Coordinates)
# * Polar coordinates are an alternative way of representing Cartesian coordinates or Complex Numbers.
""" A complex number z is
                        z = x + yj
determined by its real part x and imaginary part y .Here, j is the imaginary unit.
A polar coordinate (r,φ):
is completely determined by modulus r and phase angle φ.
r: Distance from z to origin, i.e., sqrt of (x**2+y**2)
φ: Counter clockwise angle measured from the positive x-axis to the line segment that joins z to the origin.

#* Python's cmath module provides access to the mathematical functions for complex numbers.

you can represent complex numbers in polar form using the cmath module,
... which is an extension of the built-in math module for complex numbers
#* cmath.phase: This tool returns the phase of complex number  (also known as the argument of z ).
phase(complex(-1.0, 0.0))
output: 3.1415926535897931

#* abs: This tool returns the modulus (absolute value) of complex number.
abs(complex(-1.0, 0.0))
output: 1.0

"""
# for example: Here's how we can represent a complex number in polar form:

# Define the complex number in rectangular form
complex_number = 3 + 4j

# Convert the complex number to polar form
magnitude = abs(complex_number)
phase_radians = cmath.phase(complex_number)
phase_degrees = cmath.phase(complex_number) * 180 / cmath.pi

print("Polar Form:")
print(f"Magnitude: {magnitude}")
print(f"Phase (radians): {phase_radians}")
print(f"Phase (degrees): {phase_degrees}")


# * Question (Polar Coordinates) answer
complex_number = complex(input())
print(abs(complex_number))
print(cmath.phase(complex_number))

# Or
complex_number = complex(input())
print(abs(complex_number))
print(phase(complex_number))


# 2nd method using polar attribute
z = complex(input())
r, theta = cmath.polar(z)
print(r, theta, sep='\n')


# * Note: Importing module take example
"""
When you use import math, you import the entire math module into your code.
This means you can access all the functions and variables in the math module using the math prefix.
For example, you would use functions like math.sqrt() and math.sin().
"""
x = 16
sqrt_x = math.sqrt(x)
sin_x = math.sin(x)

"""
And When you use from math import *,
you import all functions and variables from the math module directly into your code's namespace.
This means you can use the functions and variables without the need for the math prefix.
it's generally not recommended to use the import * syntax
as it can lead to name conflicts and make your code harder to understand,
especially when working with multiple modules.
"""

x = 16
sqrt_x = sqrt(x)
sin_x = sin(x)


####################################################################
#################### #* Question (Find Angle MBC)
AB = int(input())
BC = int(input())

theta = (math.atan(AB/BC))
theta_to_degree = round(math.degrees(theta))

print(f"{theta_to_degree}{chr(176)}")

# 2nd method Or directly importing mudule functions
a = int(input())
b = int(input())
print(str(round(degrees(atan(a/b))))+"\u00b0")  # \u00b0 is degree symbol (°)


####################################################################
################### # * Question (Mod Divmod)
#🔑 divmod() function
a = int(input())
b = int(input())
c = divmod(a,b)
for x in c:
    print(x)
print(c)




####################################################################
######################## # * Question (Power -Mod Power)
#🔑 (Power - Mod Power)
# pow(): With this funx In Python we can be calculated Powers or exponents using the built-in power function.
pow(a,b) #or pow(a,b)

# It's also possible to calculate a^b and mod m
pow(a,b,m)


# Note: Here,  and  can be floats or negatives, but, if a third argument is present,  cannot be negative.
# Note: Python has a math module that has its own pow(). It takes two arguments and returns a float. It is uncommon to use math.pow().

#Questions answer
a = int(input())
b = int(input())
m = int(input())
print(pow(a,b))
print(pow(a,b,m))


``

####################################################################
######################## # * Question (Integers Come In All Sizes)
a = int(input())
b = int(input())
c = int(input())
d = int(input())
print(a**b+c**d)


####################################################################
######################## #* Question (Triangle Quest)
for i in range(1,int(input())): 
    print(((10**i)//9)*i)

####################################################################
######################## #* Question (Triangle Quest 2)
# 1st method 
for i in range(1,int(input())+1):
    print((((10**i) - 1)**2) // 81)
    

####################################################################
####################################################### (itertools)
####################################################################
######################## #* Question (itertools.product())

"""
#* itertools.product():-
This tool computes the cartesian product of input iterables.
It is equivalent to nested for-loops.
For example, product(A, B) returns the same as ((x,y) for x in A for y in B).
#* Example
"""
from itertools import product
print(list(product([1,2,3],repeat = 2)))
# >>> Output:- [(1, 1), (1, 2), (1, 3), (2, 1), (2, 2), (2, 3), (3, 1), (3, 2), (3, 3)]
print(list(product([1,2,3],[3,4])))
# >>> Output:- [(1, 3), (1, 4), (2, 3), (2, 4), (3, 3), (3, 4)]
A = [[1,2,3],[3,4,5]]
print(list(product(*A)))
# >>> Output:- [(1, 3), (1, 4), (1, 5), (2, 3), (2, 4), (2, 5), (3, 3), (3, 4), (3, 5)]
B = [[1,2,3],[3,4,5],[7,8]]
print(list(product(*B)))
# >>> Output:- [(1, 3, 7), (1, 3, 8), (1, 4, 7), (1, 4, 8), (1, 5, 7), (1, 5, 8), (2, 3, 7), (2, 3, 8), (2, 4, 7), (2, 4, 8), (2, 5, 7), (2, 5, 8), (3, 3, 7), (3, 3, 8), (3, 4, 7), (3, 4, 8), (3, 5, 7), (3, 5, 8)]

#* Question's answer
# Enter your code here. Read input from STDIN. Print output to STDOUT
from itertools import product
list1 = list(map(int, input().split()))
list2 = list(map(int, input().split()))
print(*list(product(list1,list2)))


####################################################################
######################## #* Question (itertools.permutations())
"""
#* itertools.permutations(iterable[, r]):-
This tool returns successive  length permutations of elements in an iterable.
If  is not specified or is None, then  defaults to the length of the iterable,
-- and all possible full length permutations are generated.
Permutations are printed in a lexicographic sorted order. So, if the input iterable is sorted,
-- the permutation tuples will be produced in a sorted order
#* Example
"""
from itertools import permutations
print(permutations(['1','2','3']))
# >>> Output: <itertools.permutations object at 0x02A45210>

print(list(permutations(['1','2','3'])))
# >>> Output: [('1', '2', '3'), ('1', '3', '2'), ('2', '1', '3'), ('2', '3', '1'), ('3', '1', '2'), ('3', '2', '1')]

print(list(permutations(['1','2','3'],2)))
# >>> Output: [('1', '2'), ('1', '3'), ('2', '1'), ('2', '3'), ('3', '1'), ('3', '2')]

print(list(permutations('abc',3)))
# >>> Output: [('a', 'b', 'c'), ('a', 'c', 'b'), ('b', 'a', 'c'), ('b', 'c', 'a'), ('c', 'a', 'b'), ('c', 'b', 'a')]


#*Q answer
# Enter your code here. Read input from STDIN. Print output to STDOUT
from itertools import permutations
my_str, length = input().split()
lengt = int(length)
my_per = sorted(list(permutations(my_str,lengt)))
for i in my_per:
    print("".join(str(k) for k in i))



####################################################################
######################## #* Question (itertools.combinations())
"""
#*itertools.combinations(iterable, r) :-
This tool returns the r length subsequences of elements from the input iterable.
Combinations are emitted in lexicographic sorted order. So, if the input iterable is sorted,
the combination tuples will be produced in sorted order.
#* Example
"""
from itertools import combinations
print(list(combinations('12345',2)))
# >>> [('1', '2'), ('1', '3'), ('1', '4'), ('1', '5'), ('2', '3'), ('2', '4'), ('2', '5'), ('3', '4'), ('3', '5'), ('4', '5')]
A = [1,1,3,3,3]
print(list(combinations(A,4)))
# >>> [(1, 1, 3, 3), (1, 1, 3, 3), (1, 1, 3, 3), (1, 3, 3, 3), (1, 3, 3, 3)]




# Q answer
from itertools import combinations
my_str, str_length = input().split()
str_length = int(str_length)
my_str = sorted(my_str)
for i in range(1,str_length+1):
    my_comb = sorted(list(combinations(my_str, i)))
    for j in my_comb:
        print("".join(str(k) for k in j))

"""
In Python, the strip() method is a built-in string method that is used to remove leading and trailing whitespace characters from a string.
Whitespace characters include spaces, tabs, and newline characters.

The general syntax of the strip() method is:
                                            string.strip([characters])
string: The string on which the strip() method is called. This is the string from which leading and trailing whitespace will be removed.

characters (optional): An optional argument that specifies the characters to be removed from the beginning
and end of the string.If not provided, the strip() method removes all whitespace characters.
If you pass a string containing specific characters, it will remove those characters
from the beginning and end of the string, but not from within the string.
#* Example
"""
# Example 1: Basic usage to remove leading and trailing spaces
text = "  Hello, World!   "
cleaned_text = text.strip()
print(cleaned_text)  # Output: "Hello, World!"

# Example 2: Removing specific characters from the beginning and end
text = "###Python is awesome###"
cleaned_text = text.strip("#")
print(cleaned_text)  # Output: "Python is awesome"

# Example 3: Removing specific characters from both sides
text = "xxxHello, World!xxx"
cleaned_text = text.strip("x")
print(cleaned_text)  # Output: "Hello, World!"

# Example 4: Using strip() with newline characters
text = "\n\n\nHello, World!\n\n\n"
cleaned_text = text.strip()
print(cleaned_text)  # Output: "Hello, World!"


####################################################################
##################### # * itertools.combinations_with_replacement()
"""
#* This tool returns length subsequences of elements from the input iterable allowing individual elements to be repeated more than once.
#* Combinations are emitted in lexicographic sorted order. So,
#* -- if the input iterable is sorted, the combination tuples will be produced in sorted order.

"""
from itertools import combinations_with_replacement
print(list(combinations_with_replacement('12345',2)))
[('1', '1'), ('1', '2'), ('1', '3'), ('1', '4'), ('1', '5'), ('2', '2'), ('2', '3'), ('2', '4'), ('2', '5'), ('3', '3'), ('3', '4'), ('3', '5'), ('4', '4'), ('4', '5'), ('5', '5')]

A = [1,1,3,3,3]
print(list(combinations(A,2)))
[(1, 1), (1, 3), (1, 3), (1, 3), (1, 3), (1, 3), (1, 3), (3, 3), (3, 3), (3, 3)]

#* Questionn answer
from itertools import combinations_with_replacement
my_str, my_length = input().split()
my_length = int(my_length)
my_str = sorted(my_str)
comb = sorted(list(combinations_with_replacement(my_str, my_length)))
for i in comb:
    print("".join(str(k) for k in i))
    

####################################################################
##################### # * itertools.combinations_with_replacement()




















####################################################################
######################## # * Question (Transpose and Flatten)
# numpy.transpose
"""
#*Transpose:- We can generate the transposition of an array using the tool numpy.transpose.
It will not affect the original array, but it will create a new array.
"""
# example:-
import numpy as np
arr = np.array([[1,2,3],
            [4,5,6]])
print(np.transpose(arr))
# >>> [[1 4] 
# >>>  [2 5] 
# >>>  [3 6]]

#* Flatten: The tool flatten creates a copy of the input array flattened to one dimension.
# example:-
import numpy as np
arr = np.array([[1,2,3],
            [4,5,6]])
print(arr.flatten()) # >>> [1 2 3 4 5 6]

# Question's answer
import numpy as np
N, M = map(int, input().split())
matrix_rows = []
for i in range(N):
    row = list(map(int, input().split()))
    matrix_rows.append(row)
arr = np.array(matrix_rows)
transpose_arr = arr.T
print(transpose_arr)
flatten_arr = arr.flatten()
print(flatten_arr)


####################################################################################################################


##############################
# * itertools In Python :-
""" 
itertools is a module in Python's standard library that provides a set of fast,
memory-efficient tools for working with iterators, which are objects that can be iterated over (like lists or strings)
but do not store their contents in memory all at once.
"""
# Here are some notable
# * product: Returns the Cartesian product of input iterables.
numbers = [1, 2]
colors = ['red', 'blue']
# Output: [(1, 'red'), (1, 'blue'), (2, 'red'), (2, 'blue')]
cartesian_product = list(product(numbers, colors))


# * permutations: Returns all possible permutations of elements from an iterable.
letters = ['A', 'B', 'C']
# Output: [('A', 'B', 'C'), ('A', 'C', 'B'), ('B', 'A', 'C'), ...]
perms = list(permutations(letters))


# * groupby : Groups consecutive keys and groups from the iterable.
animals = ['cat', 'dog', 'cow', 'duck', 'elephant']
def key_func(x): return x[0]


grouped = groupby(animals, key_func)
for key, group in grouped:
    print(key, list(group))
# Output:
# 'c': ['cat', 'cow']
# 'd': ['dog', 'duck']
# 'e': ['elephant']


# * zip_longest: Aggregates elements from each of the iterables. If the iterables are of uneven length, fill missing values with a specified fill value.
numbers = [1, 2, 3]
colors = ['red', 'blue']
zipped = list(zip_longest(numbers, colors, fillvalue=None))
# Output: [(1, 'red'), (2, 'blue'), (3, None)]


# * takewhile: Returns elements from the iterable as long as the elements are true.
numbers = [1, 2, 3, 4, 5]
taken = list(takewhile(lambda x: x < 3, numbers))  # Output: [1, 2]


# * product:Returns the Cartesian product of input iterables.
numbers = [1, 2]
colors = ['red', 'blue']
cartesian_product = list(product(numbers, colors))
# Output: [(1, 'red'), (1, 'blue'), (2, 'red'), (2, 'blue')]


# * combinations:Returns all possible combinations of length r from an iterable.
numbers = [1, 2, 3]
combs = list(combinations(numbers, 2))  # Output: [(1, 2), (1, 3), (2, 3)]


# * chain: Chains multiple iterables together into a single iterable.
list1 = [1, 2, 3]
list2 = [4, 5, 6]
chained = list(chain(list1, list2))  # Output: [1, 2, 3, 4, 5, 6]


##################################################################
################## Question #*itertools.product()
'''
This tool computes the cartesian product of input iterables.
It is equivalent to nested for-loops.
For example, product(A, B) returns the same as ((x,y) for x in A for y in B).
'''
# Note : - itertools.product() usually faster than loop
# example
# >>> output [(1, 1), (1, 2), (1, 3), (2, 1), (2, 2), (2, 3), (3, 1), (3, 2), (3, 3)]
print(list(product([1, 2, 3], repeat=2)))
# >>> output [(1, 3), (1, 4), (2, 3), (2, 4), (3, 3), (3, 4)]
print(list(product([1, 2, 3], [3, 4])))
A = [[1, 2, 3], [3, 4, 5]]
# >>> output [(1, 3), (1, 4), (1, 5), (2, 3), (2, 4), (2, 5), (3, 3), (3, 4), (3, 5)]
print(list(product(*A)))

B = [[1, 2, 3], [3, 4, 5], [7, 8]]
# >>> output[(1, 3, 7), (1, 3, 8), (1, 4, 7), (1, 4, 8), (1, 5, 7), (1, 5, 8), (2, 3, 7), (2, 3, 8), (2, 4, 7), (2, 4, 8), (2, 5, 7), (2, 5, 8), (3, 3, 7), (3, 3, 8), (3, 4, 7), (3, 4, 8), (3, 5, 7), (3, 5, 8)]
print(list(product(*B)))


# 1st method by using product method
list1 = list(map(int, input().split()))
list2 = list(map(int, input().split()))
print(*list(product(list1, list2)))
# Or directly print(*product(map(int,input().split()),map(int,input().split())))


# 2nd method By using list comprehension
A = input().split()
B = input().split()
cartesian = [(int(i), int(j)) for i in A for j in B]
print(*cartesian)

# OR
A = list(map(int, input().split()))
B = list(map(int, input().split()))
print(*[(i, j) for i in A for j in B])


# EOF (End of File) error occurs when the input() function tries to read input from the user but finds that the input stream has ended, and there is no more data to read.
# 3rd METHOD by nested and end optional argument
# Remember for li manupulation join, iterating a loop and print with 'end = ""' optional argument or  Join is best
listA = list(map(int, input().split()))
listB = list(map(int, input().split()))
for i in listA:
    for j in listB:
        print((i, j), end=" ")
        # Or print((eval(i),eval(j)), end=' ')


# Note :-
"""
*Diffrence between collections and itertools
Purpose:

collections module: The primary purpose of the collections module is to provide additional data structures and tools for working with collections (groups of elements). It offers specialized data types like namedtuple, defaultdict, Counter, and deque, which are optimized for specific use cases.
itertools module: The itertools module, on the other hand, focuses on providing tools for working with iterators. It includes functions to create, combine, and manipulate iterators efficiently. The functions in itertools enable tasks related to iteration, combinations, and permutations.

Data Structures vs. Iterators:
collections deals with data structures like dictionaries (defaultdict, Counter), lists (deque), and named tuples (namedtuple).
itertools deals with iterators and generator functions, allowing you to perform operations on sequences of data without the need to load all elements into memory at once.

Use Cases:
collections is handy for tasks related to data storage, counting, and data manipulation. For example, Counter is great for counting the occurrences of elements in a collection, and deque is useful for implementing efficient queues and stacks.
itertools is useful for solving combinatorial problems, creating complex iterator patterns, and handling large datasets efficiently. For example, product helps generate Cartesian products of multiple iterables, and combinations generates all possible combinations of elements from an iterable.

Input and Output:
collections typically take containers (lists, tuples, etc.) as input and return specialized data structures or dictionary-like objects.
itertools functions usually take iterators or iterables as input and return iterator objects.
While both modules contribute to handling and manipulating data in Python, their specific purposes and functionalities are distinct. Understanding the differences between them helps you choose the right tools for the task at hand, whether it's working with data structures or managing iterations and combinations efficiently.
"""


"""
* collections module :- A built-in module that provides specialized data structures as alternatives to the built-in data types like lists, tuples, sets, and dictionaries.
* --The collections module includes several container data types that offer additional functionality beyond the standard data types.
"""

# Here are some commonly used data structures from the collections module

# * namedtuple: Factory function for creating tuple subclasses with named fields.
Person = namedtuple('Person', ['name', 'age'])
person = Person(name='John', age=30)
print(person.name)  # Output: 'John'


# *Counter: Dict subclass for counting hashable objects.
colors = ['red', 'blue', 'red', 'green', 'blue', 'red']
color_count = Counter(colors)
print(color_count)  # Output: Counter({'red': 3, 'blue': 2, 'green': 1})


# * ChainMap: A class for combining several mappings into a single view.
dict1 = {'a': 1, 'b': 2}
dict2 = {'c': 3, 'd': 4}
chain_map = ChainMap(dict1, dict2)
print(chain_map['a'])  # Output: 1

# * OrderedDict: A dictionary subclass that remembers the order in which items were added.
ordered_dict = OrderedDict([('a', 1), ('b', 2), ('c', 3)])
print(ordered_dict)  # Output: OrderedDict([('a', 1), ('b', 2), ('c', 3)])


# * defaultdict: Dict subclass that calls a factory function to supply missing values.
d = defaultdict(int)
d['a'] += 1
print(d['a'])  # Output: 1


# * deque: A list-like container with fast appends and pops on both ends.
d = deque([1, 2, 3])
d.append(4)
d.appendleft(0)
print(d)  # Output: deque([0, 1, 2, 3, 4])


#########################################################
# Question #* collections.Counter()

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
X = int(input())
shoes = Counter(map(int, input().split()))
# "4 5 6 7 7"
# ["4","5","6","7","7"]
# [4,5,6,7,7]
# {4:1,5:1,6:1,7:2}
N = int(input())
count = 0
for i in range(N):
    size, price = map(int, input().split())
    if shoes[size] > 0:
        shoes[size] -= 1
        count += price
print(count)


################################################################
# Question #* itertools.permutations()
# 1st method
m, n = input().split()
n = int(n)
pr = list(permutations(m, n))
li = []
for i in pr:
    li.append(''.join(i))
li = sorted(li)
print(*li, sep="\n")

# 2nd method By list comprehension
m, n = input().split()
n = int(n)
pr = list(permutations(m, n))
sort_li = sorted([''.join(k) for k in pr])
print(*sort_li, sep="\n")

# 3rd method by using lambda

m, n = input().split()
n = int(n)
pr = list(permutations(m, n))
sort_li = sorted(pr, key=lambda k: ''.join(k))
for permutation in sort_li:
    print(''.join(permutation))
# print(*[''.join(k) for k in sort_li], sep = '\n')

# Sorting a dictinary
list = ['2022 Population', '2020 Population', '2015 Population', '2010 Population',
        '2000 Population', '1990 Population', '1980 Population', '1970 Population']
pop_dic = {}
for i in list:
    k = i.split()
    pop_dic[k[0]] = k[1]
print(pop_dic)
new_po = dict(sorted(pop_dic.items(), key=lambda item: item[0]))
print(new_po)
li = []
for k, v in new_po.items():
    li.append(' '.join([k, v]))
print(li)


###########################################################
# Question #* Polar Coordinates
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
phase_angle = cmath.phase(complex(-1.0, 0.0))
print(phase_angle)
# >>> 3.1415926535897931

# abs:- This tool returns the modulus (absolute value) of complex number z.
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
a = complex(input())
print(abs(a))
print(cmath.phase(a))


##################################################################
# Question #* DefaultDict Tutorial

"""
The defaultdict tool is a container in the collections class of Python.
It's similar to the usual dictionary (dict) container,
but the only difference is that a defaultdict will have a default value
if that key has not been set yet. If you didn't use a defaultdict
you'd have to check to see if that key exists, and if it doesn't, set it to what you want.

example
"""
d = defaultdict(list)
d['python'].append("awesome")
d['something-else'].append("not relevant")
d['python'].append("language")
for i in d.items():
    print(i)
# >>> ('python', ['awesome', 'language'])
# >>> ('something-else', ['not relevant'])

d = defaultdict(list)
n, m = map(int, input().split())
for i in range(1, n + 1):
    key = input()
    d[key].append(i)
for i in range(m):
    key = input()
    if key in d:
        # or print(' '.join(d[val]))
        print(" ".join(str(value) for value in d[key]))
    else:
        print(-1)
# Note :- join method cannot be directly applied to integers because it expects an iterable of strings as its argument.
#      -- However, you can convert the integers to strings using the str() function before using join.
numbers = [1, 2, 3, 4, 5]
joined_numbers = " ".join(str(num) for num in numbers)
print(joined_numbers)

# 2nd method
n, m = map(int, input().split())
A = defaultdict(list)
for i in range(n):
    A[input()].append(i+1)
for i in range(m):
    k = input()
    print(*(A[k] if k in A else [-1]), sep=' ')


##################################################################
# Question #* Calendar Module
"""
The calendar module allows you to output calendars and provides additional useful functions for them.
class calendar.TextCalendar([firstweekday])
This class can be used to generate plain text calendars.
"""
print(calendar.TextCalendar(firstweekday=6).formatyear(2015))


# Create a calendar object for the current month with Monday as the first day of the week (0 represents Monday).
cal = calendar.Calendar(firstweekday=0)

# Get the weeks of the month as a list of lists, where each inner list represents a week.
# Replace 2023 and 7 with the desired year and month.
weeks = cal.monthdayscalendar(2023, 7)

# Iterate through each week to get the weekdays.
for week in weeks:
    for day in week:
        if day == 0:
            # Print two spaces for days outside the current month.
            print("  ", end="")
        else:
            # Print the day with two spaces padding.
            print(f"{day:2}", end=" ")
    print()  # Move to the next line after each week.


# 1st method
user_input = list(map(int, input().split()))
day = int(user_input[1])
month = int(user_input[0])
year = int(user_input[2])
week_day = calendar.weekday(year, month, day)
print(calendar.day_name[week_day].upper())

# 2nd method
month, day, year = list(map(int, input().split()))
week_day = calendar.weekday(year, month, day)
print(calendar.day_name[week_day].upper())

# Or
month, day, year = map(int, input().split())
name = calendar.day_name[calendar.weekday(year, month, day)]
print(name.upper())
"""
we can access items from a map object in Python.
The map() function returns an iterator that applies a given function to all the items in an input iterable (e.g., a list)
and generates the results one by one as you iterate through it. we can access items from a map object in Python
"""

""" iterator is an object in Python that allows you to iterate over a sequence of elements one by one.
It's a type of object that implements two methods: __iter__() and __next__().
The __iter__() method returns the iterator object itself,
and the __next__() method returns the next element in the sequence.
"""
# Note:-Iterators are used extensively in Python, and many built-in types, like lists, strings, and dictionaries, are iterable.
# example
my_list = [1, 2, 3, 4, 5]
my_iterator = iter(my_list)
#  my_iterator is an iterator that allows you to access elements from my_list one by one using the next() function or by using it in a loop.

"""
* An iterator in Python is not a function; it is an object. An iterator is an object that allows you to iterate over a sequence of elements one by one, enabling you to access each element sequentially.
* In Python, iterators are objects that implement two methods: __iter__() and __next__(). These methods define the iterator protocol:
* 1.The __iter__() method returns the iterator object itself. It is called when you use the iter() function on an iterable object, and it is used to obtain the iterator from the iterable.
* 2.The __next__() method returns the next element in the sequence. It is called when you use the next() function on the iterator, and it raises the StopIteration exception when there are no more elements to return.
* Here's an example of how to create and use an iterator in Python:
"""

my_list = [1, 2, 3, 4, 5]

# Create an iterator from the list using the iter() function.
my_iterator = iter(my_list)

# Use the next() function to access elements from the iterator one by one.
print(next(my_iterator))  # Output: 1
print(next(my_iterator))  # Output: 2
print(next(my_iterator))  # Output: 3
# ... and so on.
print("remaining")
# You can also use a for loop to iterate over the elements using the iterator.
for element in my_iterator:
    print(element)  # Output: 4, 5

"""
*In this example, my_iterator is an iterator object created from the list my_list.
*The next() function is used to access elements one by one until there are no more elements,
*at which point it raises the StopIteration exception.
"""


##################################################################
# Question #* Exceptions
# * (Errors detected during execution are called exceptions.)
# * Buffer structures (or simply “buffers”) are useful as a way to expose the binary data from another object to the Python programmer.
n = int(input())
for i in range(n):
    try:
        M, N = map(int, input().split())
        print(M//N)
    except (ZeroDivisionError, ValueError) as error:
        print('Error Code:', error)


# https://docs.python.org/3/library/exceptions.html


#############################################################
# *Collection mudule
# * Collections Word Order
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

odic = OrderedDict()
for _ in range(int(input())):
    key = input()
    if key in odic:
        odic[key] += 1
    else:
        odic[key] = 1
print(len(odic))
print(*odic.values())

# 3rd methed
# key in dictionary are unique
N = int(input())
s = {}
for _ in range(N):
    word = input()
    if word in s.keys():
        s[word] += 1
    else:
        s[word] = 1
print(len(s.keys()))
print(*[i for i in s.values()])


##########################################################
# Question #* Collections.OrderedDict()
# 1st
num_items = int(input())
fruit_dict = OrderedDict()
for _ in range(num_items):
    *item_name, net_price = input().split()
    item_name = ' '.join(item_name)
    net_price = int(net_price)
    fruit_dict[item_name] = fruit_dict.get(item_name, 0) + net_price
for name, total_price in fruit_dict.items():
    print(name, total_price)

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
    alph = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l',
            'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'x', 'y', 'z']
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


###############################################################
# Question #*PythonBuilt-Ins Any or All
# * any() method
""" 
    The any() function in Python is a built-in function that takes an iterable (such as a list, tuple, or set)
    as its argument and returns True if at least one element in the iterable is truthy,
    and False if all elements are falsy or the iterable is empty.
    
    This expression returns True if any element of the iterable is true.
    If the iterable is empty, it will return False.
"""
# Example
# Here's the syntax for the any() function:
# *    any(iterable)

# * The iterable parameter is the sequence or collection of values that you want to check for truthiness.

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
# * -satisfies a certain condition or is considered truthy.

# ex:-
any([1 > 0, 1 == 0, 1 < 0])
# >>> True
any([1 < 0, 2 < 1, 3 < 2])
# >>> False

# * all() method
"""
This expression returns True if all of the elements of the iterable are true.
If the iterable is empty, it will return True.
"""

all(['a' < 'b', 'b' < 'c'])
# >>> True
all(['a' < 'b', 'c' < 'b'])
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
# * The *arg syntax is used to capture any number of remaining values into a list.
# For example, if the user enters "1 2 3 4 5", the value of N will be "1", and the value of arg will be a list containing ["2", "3", "4", "5"].

# we can even directly convert to integer by using int funxn
N, *arg = map(int, input().split())  # Now N = 1 and arg = [2,3,4,5]


##################################################################
# Question #*collections.namedtuple() method

"""
Basically, namedtuples are easy to create, lightweight object types.
They turn tuples into convenient containers for simple tasks.
With namedtuples, you don’t have to use integer indices for accessing members of a tuple.
it basically takes two arguments: the name of the named tuple and a sequence of field names.
The namedtuple is defined with the name 'Student' (using capitalization conventions for class names).
"""

# Example:-
Point = namedtuple('Point', 'x,y')
pt1 = Point(1, 2)
pt2 = Point(3, 4)
dot_product = (pt1.x * pt2.x) + (pt1.y * pt2.y)
print(dot_product)

Car = namedtuple('Car', 'Price Mileage Colour, Class')
xyz = Car(Price=100000, Mileage=30, Colour='Cyan', Class='Y')
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
# Question #*word order


##################################################################
# Question #* Find Angle MBC
