import os
import sys

def convert(infile, outfile):

    with open(infile, "r") as file:
        text = file.read()
        text = text.replace('\n', ',')
        text = text.split(',')
        text = [x for x in text if x != '']
        #print(text)
        voltage = text[2::8]
        current = text[3::8]
        power = text[4::8]
        powerFactor = text[7::8]
        

        with open(outfile, "w") as f:
            for x in range(len(voltage)):
                line = [voltage[x], current[x], power[x], powerFactor[x]]
                line = ",".join(line) + "\n"
                f.write(line)

if __name__ == "__main__":
    convert(sys.argv[1], sys.argv[2])