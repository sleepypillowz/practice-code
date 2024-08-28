from typing import List
class Solution:
    def containsDuplicate(self, nums: List[int]) -> bool:

        hashset = set()

        nums.sort()

        for element in nums:

            if element not in hashset:
                hashset.add(element)

            else:
                return True

        return False