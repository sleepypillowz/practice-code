class Solution(object):
    def twoSum(self, nums, target):

        num_indices = {} # Dictionary that stores a numbers index and value

        for i, num in enumerate(nums): # Key Value Pairs i (indices) num (value)
            complement = target - num # gets the pair that sums to target
            if complement in num_indices: # if the first num that sums to target
                return [num_indices[complement], i] # return index of 1st & 2nd num
            
            num_indices[num] = i # Assigining key value pairs ex. 2 : 0

        return[] # returns an empty list if there's no input