import random


def slumpad_anledning():
    anledningar = ["tidigare vagnfel", "förarbrist", "urspårning", "lövhalka", "älg", "Jörgen"]
    anledning = "Förseningar på grund av " + random.choice(anledningar)
    return anledning


if __name__=="__main__":
    print()
    print(slumpad_anledning())
    print()
