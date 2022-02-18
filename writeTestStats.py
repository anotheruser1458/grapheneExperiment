import sys, os

def writeTimeToFile(fileName, time):
    stringData = "Time: " + str(time) + "s"
    with open(fileName, "a") as file:
        file.write(stringData)

if __name__ == "__main__":
    writeTimeToFile(sys.argv[1], sys.argv[2])