from fractions import Fraction

def calculate_and_format_probability(event_A, event_B, event_A_and_B):
    """
    Calculate the probability of A or B and A and B, then format the results.
    
    Args:
        event_A (float): Probability of event A.
        event_B (float): Probability of event B.
        event_A_and_B (float): Probability of events A and B occurring simultaneously.
        
    Returns:
        dict: A dictionary containing the formatted probabilities.
    """
    probability_A_or_B = event_A + event_B - event_A_and_B
    probability_A_and_B = event_A * event_B
    
    probability_A_or_B_fraction = Fraction(probability_A_or_B).limit_denominator()
    probability_A_and_B_fraction = Fraction(probability_A_and_B).limit_denominator()
    
    probability_A_or_B_percentage = round(probability_A_or_B * 100, 2)
    probability_A_and_B_percentage = round(probability_A_and_B * 100, 2)
    
    return {
        "probability_A_or_B_fraction": probability_A_or_B_fraction,
        "probability_A_and_B_fraction": probability_A_and_B_fraction,
        "probability_A_or_B_percentage": probability_A_or_B_percentage,
        "probability_A_and_B_percentage": probability_A_and_B_percentage
    }

def print_results(scenario_name, results):
    """
    Print the results of the probability calculation for a given scenario.
    
    Args:
        scenario_name (str): Name of the scenario.
        results (dict): Formatted probabilities.
    """
    print(f"Scenario: {scenario_name}")
    print(f"The probability of A or B is {results['probability_A_or_B_fraction']} ({results['probability_A_or_B_percentage']}%)")

scenarios = [

    {
        "name": "Getting an even number or a number divisible by 3 from a set of integers",
        "event_A": 10 / 20,
        "event_B": 6 / 20,
        "event_A_and_B": 3 / 20,
    },

]

for scenario in scenarios:
    results = calculate_and_format_probability(scenario["event_A"], scenario["event_B"], scenario["event_A_and_B"])
    print_results(scenario["name"], results)
