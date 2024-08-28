class Solution:
    def isAnagram(self, word1: str, word2: str) -> bool:
        if len(word1) == len(word2):

            if sorted(word1) == sorted(word2):
                return True
        return False