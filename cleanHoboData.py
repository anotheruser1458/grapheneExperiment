import os
import sys

"""
This script reads in the hobo CSV file and trims all data after the first "Logged" statement 
and all data before the second "Logged" statement. this is necessary to allow matlab to read
in the data.
"""


def trimDataFront(dataList):
    for x in dataList:
        if "Logged" in x:
            indexOfFirstLogged = dataList.index(x)
            return dataList[indexOfFirstLogged+1:]

def trimDataEnd(dataList):
    for x in dataList:
        if "Logged" in x:
            indexOfSecondLogged = dataList.index(x)
            return dataList[:indexOfSecondLogged]



def cleanData(text):
    text = text.split("\n")
    text = trimDataFront(text)
    text = trimDataEnd(text)
    return "\n".join(text)

def cleanHoboData(inFile, outFile):
    with open(inFile, "r") as hoboFile:
        text = hoboFile.read()
        text = cleanData(text)
        with open(outFile, "w") as outputFile:
            outputFile.write(text)




if __name__ == "__main__":
    cleanHoboData(sys.argv[1], sys.argv[2])

