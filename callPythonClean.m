function cleanedHoboFilePath = callPythonClean(inputFilePath, outputFilePath)
    commandStr = strcat("python cleanHoboData.py ", inputFilePath, " ", outputFilePath);
    system(commandStr);
    cleanedHoboFilePath = outputFilePath;
end