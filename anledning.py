import random
import json


def parse_anledning(anledning_dict, ignorera_vikter, censurera):
    match anledning_dict:
        case list():
            possible = []#[val for val in anledning_dict]
            vikter = []
            for val in anledning_dict:
                match val:
                    case dict():
                        if not censurera * val.get("censur", False):
                            vikter.append(val.get("vikt", 1))
                            possible.append(val)
                    case _:
                        vikter.append(1)
                        possible.append(val)
            if ignorera_vikter:
                valt = random.choice(possible)
            else:
                valt = random.choices(possible, weights=vikter)[0]
            deltext = parse_anledning(valt, ignorera_vikter, censurera)
        case str():
            deltext = anledning_dict
        case dict():
            deltext = ""
            if "text" in anledning_dict:
                deltext += anledning_dict["text"]
            if "alternativ" in anledning_dict:
                deltext += parse_anledning(anledning_dict["alternativ"], ignorera_vikter, censurera)
            if anledning_dict.get("slumptal", False):
                deltext += str(random.randint(anledning_dict.get("min", 0), anledning_dict.get("max", 9))).zfill(anledning_dict.get("siffror", 0))
            if "val" in anledning_dict:
                deltext += parse_anledning(anledning_dict["val"], ignorera_vikter, censurera)
    return deltext


def slumpad_anledning(filnamn, ignorera_vikter = False, censur = False):
    with open(filnamn, "r") as f:
        json_contents = json.loads(f.read())
        anledningstext = ""
        anledningstext += parse_anledning(json_contents, ignorera_vikter, censur)
        return anledningstext


if __name__=="__main__":
    print()
    for i in range(10):
        print(slumpad_anledning("anledningsträd.json"))
    print()
