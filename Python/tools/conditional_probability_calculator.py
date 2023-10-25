from fractions import Fraction

def calculate_and_format_probability(event_A, event_B, event_A_and_B):
    # Calculate the probability of A or B
    probability_A_or_B = event_A + event_B - event_A_and_B
    
    # Calculate the probability of A and B
    probability_A_and_B = event_A * event_B
    
    # Convert probabilities to fractions
    probability_A_or_B_fraction = Fraction(probability_A_or_B).limit_denominator()
    probability_A_and_B_fraction = Fraction(probability_A_and_B).limit_denominator()
    
    # Convert probabilities to percentages
    probability_A_or_B_percentage = round(probability_A_or_B * 100, 2)
    probability_A_and_B_percentage = round(probability_A_and_B * 100, 2)
    
    return {
        "probability_A_or_B_fraction": probability_A_or_B_fraction,
        "probability_A_and_B_fraction": probability_A_and_B_fraction,
        "probability_A_or_B_percentage": probability_A_or_B_percentage,
        "probability_A_and_B_percentage": probability_A_and_B_percentage
    }

# Define descriptive scenarios using a list comprehension
scenarios = [
    {
        "name": "Choosing a puppy or a parakeet from the available pets",
        "event_A": 6 / 26,
        "event_B": 7 / 26,
        "event_A_and_B": 0,
    },
    {
        "name": "Player at the sports complex is either 14 years old or plays basketball",
        "event_A": 106 / 300,
        "event_B": 104 / 300,
        "event_A_and_B": 0,
    },
    {
        "name": "Having one defective bulb or zero defective bulbs in a batch",
        "event_A": 0.5,
        "event_B": 0.4,
        "event_A_and_B": 0,
    },
    {
        "name": "Getting an even number or a number divisible by 3 from a set of integers",
        "event_A": 10 / 20,
        "event_B": 7 / 20,
        "event_A_and_B": 3 / 20,
    },
    {
        "name": "Probability that Miriam chose 2 stuffed animals as the first two choices from the toy bin",
        "event_A": (8 / 23) * (7 / 22),
        "event_B": 0,  # There is no relevant second event for this scenario
        "event_A_and_B": 0,
    },
    {
        "name": "Probability that Arman and Gaylee both chose dry dog food if Arman picked first and liked it",
        "event_A": 10 / 19,
        "event_B": 9 / 18,
        "event_A_and_B": 0,
    },
    {
        "name": "Probability that both juice boxes Joshua chose are lemonade",
        "event_A": (3 / 20) * (2 / 19),
        "event_B": 0,  # There is no relevant second event for this scenario
        "event_A_and_B": 0,
    },
    {
        "name": "Probability of getting O and then U from the bag of Scrabble tiles",
        "event_A": (3 / 15) * (2 / 14),
        "event_B": 0,  # There is no relevant second event for this scenario
        "event_A_and_B": 0,
    },
]

for scenario in scenarios:
    results = calculate_and_format_probability(scenario["event_A"], scenario["event_B"], scenario["event_A_and_B"])
    
    print(f"Scenario: {scenario['name']}")
    print(f"The probability of A or B is {results['probability_A_or_B_fraction']} ({results['probability_A_or_B_percentage']}%)")
    print(f"The probability of A and B is {results['probability_A_and_B_fraction']} ({results['probability_A_and_B_percentage']}%)")
    print()
