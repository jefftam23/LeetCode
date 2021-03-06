f = open('cooking_the_books_example_input.txt', 'r')
T = int(f.readline())
w = open('cooking_the_books_output.txt', 'w')
for i in range(T):
    number = f.readline().strip()
    n = len(number)
    min_stack = [n-1] * n
    max_stack = [n-1] * n
    nonzero_stack = [n-1] * n
    for j in range(n - 2, -1, -1):
        digit = int(number[j])
        min_stack[j] = j if digit < int(number[min_stack[j + 1]]) else min_stack[j + 1]
        max_stack[j] = j if digit > int(number[max_stack[j + 1]]) else max_stack[j + 1]
        if digit == 0:
            nonzero_stack[j] = nonzero_stack[j + 1]
        elif number[nonzero_stack[j + 1]] == '0':
            nonzero_stack[j] = j
        elif digit < int(number[nonzero_stack[j + 1]]):
            nonzero_stack[j] = j
        else: 
            nonzero_stack[j] =  nonzero_stack[j + 1]
    smallest = largest = number
    min_flag = max_flag = False
    for j in range(n):
        digit = int(number[j])
        if (not min_flag) and digit > int(number[min_stack[j]]):
            if j == 0:
                if digit > int(number[nonzero_stack[0]]):
                    smallest = number[nonzero_stack[0]] + number[1:nonzero_stack[0]] + number[0] + number[nonzero_stack[0]+1:]
                    min_flag = True
            else:
                smallest = number[:j] + number[min_stack[j]] + number[j+1:min_stack[j]] + number[j] + number[min_stack[j]+1:]
                min_flag = True
        if (not max_flag) and digit < int(number[max_stack[j]]):
            largest = number[:j] + number[max_stack[j]] + number[j+1:max_stack[j]] + number[j] + number[max_stack[j]+1:]
            max_flag = True
        if min_flag and max_flag:
            break
    print "Case #" + str(i + 1) + ': ' + smallest + ' ' + largest
    #w.write("Case #" + str(i + 1) + ': ' + smallest + ' ' + largest + '\n')
f.close()
w.close()
