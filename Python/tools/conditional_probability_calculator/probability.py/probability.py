from fractions import Fraction

def calculate_probability(event_A, event_B, event_A_and_B):
    probability_A_or_B = event_A + event_B - event_A_and_B
    probability_A_and_B = event_A * event_B
    return probability_A_or_B, probability_A_and_B

def format_probability(probability):
    fraction = Fraction(probability).limit_denominator()
    percentage = round(probability * 100, 2)
    return {"fraction": fraction, "percentage": percentage}

def print_results(scenario_name, probability_A_or_B, probability_A_and_B):
    print(f"Scenario: {scenario_name}")
    print(f"The probability of A and B is {probability_A_and_B['fraction']} ({probability_A_and_B['percentage']}%)\n")

def calculate_and_format_scenario(scenarios):
    for scenario in scenarios:
        name, event_A, event_B, event_A_and_B = scenario.values()
        probability_A_or_B, probability_A_and_B = calculate_probability(event_A, event_B, event_A_and_B)
        formatted_probability_A_or_B = format_probability(probability_A_or_B)
        formatted_probability_A_and_B = format_probability(probability_A_and_B)
        print_results(name, formatted_probability_A_or_B, formatted_probability_A_and_B)

scenarios = [

    {
        "name": "Getting O and then U from Scrabble tiles",
        "event_A": 3 / 15,
        "event_B": 2 / 14,
        "event_A_and_B": (3 / 15) * (2 / 14),
    }

]

calculate_and_format_scenario(scenarios)
