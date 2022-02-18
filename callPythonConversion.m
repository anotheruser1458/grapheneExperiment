%call python script, converts hobo csv into matlab readable format
function convertedHoboFilePath = callPythonConversion(inputFilePath, outputFilePath)
    commandStr = strcat("python convertHoboCSV.py ", inputFilePath, " ", outputFilePath);
    system(commandStr);
    convertedHoboFilePath = outputFilePath;
end