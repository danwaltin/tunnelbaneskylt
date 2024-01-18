import json

#

class ASCIITypsnitt:
    def __init__(self, letterdict, w, h):
        self.letterdict = letterdict
        self.w = w
        self.h = h

    def render_char(self, char="", space=0):
        if char in self.letterdict and len(char) == 1:
            char_rendered = self.letterdict[char]
        else:
            char_rendered = ASCIITypsnitt.render_full_char(self.w, self.h, "?")
        return ASCIITypsnitt.add_strings(char_rendered, ASCIITypsnitt.render_full_char(space, self.h, " "))

    @classmethod
    def add_strings(cls, a, b):
        #Dela upp a, b i rader, sätt ihop rad för rad och kombinera till en sträng
        if b != "":
            if a != "":
                c = "\n".join([x[0] + x[1] for x in zip(a.split("\n"), b.split("\n"))])
                return c
            return b
        return a

    @classmethod
    def render_full_char(cls, w, h, char):
        return "\n" + (((char * w) + "\n") * h)

    @classmethod
    def new_from_file(cls, file_path):
        #{"w":int, "h":int, "characters":{"a":str, "b":str ... }}
        with open(file_path, "r") as file:
            json_dict = json.loads(file.read())
            #Byt ut punkter mot mellanslag, | mot radbrytningar
            json_dict["characters"] = {k:v.replace("|", "\n").replace(".", " ") for k, v in json_dict["characters"].items()}
            print(json_dict["characters"])
            new_typsnitt = ASCIITypsnitt(json_dict["characters"], json_dict["w"], json_dict["h"])
            return new_typsnitt


class SkyltStr:
    def __init__(self, text="", mellanrum=2):
        self.plain_text = text
        self.mellanrum = mellanrum

    def rendera_skylt(self, typsnitt):
        if self.plain_text != "":
            out = ""
            for char in self.plain_text:
                out = ASCIITypsnitt.add_strings(out, typsnitt.render_char(char, self.mellanrum))
            return out
        return ""


if __name__=="__main__":
    typsnitt = ASCIITypsnitt.new_from_file("typsnitt_a.json")

    a = SkyltStr("ABCDEFGHIJKLMNOPQRS")
    print(a.rendera_skylt(typsnitt))
