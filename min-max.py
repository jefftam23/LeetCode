coin = [3, 2, 2, 3, 1, 2]

def dfs(coin, a, b, turn):
    n = len(coin)
    if n == 0:
        if a > b:
            return 1
        elif a == b:
            return 0
        else:
            return -1
    else:
        if turn:
            return max(dfs(coin[1:], a + coin[0], b, not turn), dfs(coin[:n-1], a + coin[n - 1], b, not turn))
        else:
            return min(dfs(coin[1:], a, b + coin[0], not turn), dfs(coin[:n-1], a, b + coin[n - 1], not turn))


print dfs(coin, 0, 0, True)
