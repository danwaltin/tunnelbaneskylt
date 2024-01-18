import os
import time
import argparse
import anledning

parser = argparse.ArgumentParser(description="Renderar en tunnelbaneskylt med dumma förseningsmeddelanden.")
parser.add_argument("-f", help="Uppdateringsfrekvens", type=int, default=24)
args = parser.parse_args()


def rendera_text(text):
    return text


def rendera_utsnitt(text_in, position = 0, längd = 10):
    förlängd_text = ((" " * (längd + 1)) + text_in) * 2
    modulo_pos = position % len(förlängd_text)
    text_ut = förlängd_text[modulo_pos:modulo_pos+längd]
    return text_ut


if __name__=="__main__":
    renderad_anledning = rendera_text(anledning.slumpad_anledning())
    pos = 0

    while True:
        time.sleep(1/args.f)
        os.system('clear')

        print(rendera_utsnitt(renderad_anledning, pos, os.get_terminal_size().columns))
        pos += 1
