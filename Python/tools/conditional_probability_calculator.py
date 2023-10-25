from fractions import Fraction

def calculate_probability(event_A, event_B, event_A_and_B):
    # Calculate the probability of A or B
    probability_A_or_B = event_A + event_B - event_A_and_B
    
    # Calculate the probability of A and B
    probability_A_and_B = event_A * event_B
    
    return probability_A_or_B, probability_A_and_B

# Define scenarios
scenarios = [
    {"name": "Choosing a puppy or a parakeet", "event_A": 6 / 26, "event_B": 7 / 26, "event_A_and_B": 0},
    {"name": "Player at the sports complex is 14 or plays basketball", "event_A": 106 / 300, "event_B": 104 / 300, "event_A_and_B": 0},
    {"name": "Having one defective bulb or zero defective bulbs", "event_A": 0.5, "event_B": 0.4, "event_A_and_B": 0},
    {"name": "Getting an even number or a number divisible by 3", "event_A": 10 / 20, "event_B": 7 / 20, "event_A_and_B": 3 / 20}
]

for scenario in scenarios:
    result, result_and = calculate_probability(scenario["event_A"], scenario["event_B"], scenario["event_A_and_B"])
    
    # Convert probabilities to fractions
    probability_A_or_B_fraction = Fraction(result).limit_denominator()
    probability_A_and_B_fraction = Fraction(result_and).limit_denominator()
    
    # Convert probabilities to percentages
    probability_A_or_B_percentage = round(result * 100, 2)
    probability_A_and_B_percentage = round(result_and * 100, 2)
    
    print(f"Scenario: {scenario['name']}")
    print(f"The probability of A or B is {probability_A_or_B_fraction} ({probability_A_or_B_percentage}%)")
    print(f"The probability of A and B is {probability_A_and_B_fraction} ({probability_A_and_B_percentage}%)")
    print()
