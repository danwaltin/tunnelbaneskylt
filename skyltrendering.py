import os
import time
import argparse

parser = argparse.ArgumentParser(description="Renderar en tunnelbaneskylt med dumma förseningsmeddelanden.")
parser.add_argument("-f", help="Uppdateringsfrekvens", type=int, default=24)
args = parser.parse_args()



def rendera_text():
    return


if __name__=="__main__":
    while False:
        time.sleep(1/args.f)
        os.system('clear')
