from math import comb

# Calculate the total number of combinations
total_combinations = comb(55, 6)

# Calculate the percentage odds of winning
percentage_odds = (1 / total_combinations) * 100

# Print the result
print(f"The percentage odds of winning are approximately: {percentage_odds:.10f}%")