class Solution:
    # @param s, an input string
    # @param p, a pattern string
    # @return a boolean
    def isMatch(self, s, p):
        plenNoStar = 0
        for c in p:
            if c is not '*':
                plenNoStar += 1
        if plenNoStar > len(s):
            return False
        slen = len(s)
        plen = len(p)
        dp = [[False] * (slen + 1) for _ in range(plen + 1)]
        dp[0][0] = True
        
        for pi in range(1, plen + 1):
            if p[pi - 1] is '*':
                dp[pi][0] = True
            else:
                break
            
        for pi in range(1, plen + 1):
            if p[pi - 1] is '*':
		threshold = False
                for si in range(0, slen + 1):
                    if threshold:
                        dp[pi][si] = True
                    elif dp[pi - 1][si]:
                        dp[pi][si] = True
                        threshold = True
            else:
                for si in range(1, slen + 1):
                    if dp[pi - 1][si - 1] and (s[si - 1] == p[pi - 1] or p[pi - 1] == '?'):
                        dp[pi][si] = True
	print dp
        return dp[plen][slen]
solution = Solution()
print solution.isMatch("ab", "*?*?*") == True
