from typing import List
class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        
        grouped_anagrams = {} # dictionary to store key:value pairs

        for word in strs:

            # tuple makes a word immutable so it can be used as a key
            sorted_word = tuple(sorted(word)) 

            if sorted_word not in grouped_anagrams:
                grouped_anagrams[sorted_word] = [word] # aet: eat
            else:
                grouped_anagrams[sorted_word].append(word) # aet : eat, tea
        
        return grouped_anagrams.values()
