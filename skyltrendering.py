import os
import time
import argparse
import anledning
import text_till_typsnitt as ttt

class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKCYAN = '\033[96m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'


def rendera_text(text, typsnitt):
    skylttext = ttt.SkyltStr(text)
    return skylttext.rendera_skylt(typsnitt)


def rendera_utsnitt(text_in, position = 0, längd = 10):
    rader = text_in.split("\n")
    rader_utsnitt = []
    for rad in rader:
        förlängd_text = ((" " * (längd + 1)) + rad) * 2
        modulo_pos = position % len(förlängd_text)
        rader_utsnitt.append(förlängd_text[modulo_pos:modulo_pos+längd])
    return "\n".join(rader_utsnitt)


if __name__=="__main__":
    #Kommandotolksargument
    parser = argparse.ArgumentParser(description="Renderar en tunnelbaneskylt med dumma förseningsmeddelanden.")
    parser.add_argument("-f", help="Uppdateringsfrekvens", type=int, default=24)
    parser.add_argument("-t", help="Filsökväg för typsnitt (json)", type=str, default="typsnitt_a.json")
    parser.add_argument("-d", help="Debug-läge", action="store_true")
    parser.add_argument("-m", help="Eget meddelande", type=str, default="")
    args = parser.parse_args()

    typsnitt = ttt.ASCIITypsnitt.new_from_file(args.t)
    förseningsanledning = anledning.slumpad_anledning()
    if args.m != "":
        förseningsanledning = args.m
    renderad_anledning = rendera_text(förseningsanledning, typsnitt)

    print('\033[?25l', end="") #Göm pekare

    pos = 0
    while True:
        try:
            time.sleep(1/args.f)
            os.system('clear')

            print(f"{bcolors.WARNING}{rendera_utsnitt(renderad_anledning, pos, os.get_terminal_size().columns)}{bcolors.ENDC}")
            if args.d:
                print(förseningsanledning)
                print(args)
            pos += 1
        except KeyboardInterrupt:
            print("Avslutad")
            print('\033[?25h', end="")
            break
