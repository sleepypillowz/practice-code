# Import the necessary libraries
from typing import List
from collections import Counter

class Solution:
    def topKFrequent(self, nums: List[int], k: int) -> List[int]:
        count = Counter(nums)
        most_frequent_element = []

        for num, freq in count.items():
            most_frequent_element.append((num, freq))

        most_frequent_element.sort(key=lambda x: x[1], reverse=True)

        return [num for num, freq in most_frequent_element[:k]]

solution_instance = Solution()
input_nums = [1, 1, 1, 2, 2, 3]
k_value = 2
result = solution_instance.topKFrequent(input_nums, k_value)
print(result)
