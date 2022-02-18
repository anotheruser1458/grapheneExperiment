function [] = callPythonWriteStats(filePath, time)
    commandStr = strcat("python writeTestStats.py ", filePath, " ", time);
    system(commandStr);
end