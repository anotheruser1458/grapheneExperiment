function [] = executeExperiment(trialName, length) 

disp("Ensure hobo device is launched, press any key to coninue")
pause;

mkdir(trialName);
BASE_DIR = strcat(trialName, "\");
matlabCSVPath = strcat(BASE_DIR, "matlabCurrentTrial.csv");

initializeExperiment;

data = [];

%Turn on power, collect data in loop
start(d, "Continuous");
write(v, "OUTP 1");
pause(0.992);
for c = 1:length
[tempData, timeStamp, triggerTime] = read(d, "all", "OutputFormat","Matrix");

t1 = tempData(end, 1);
t2 = tempData(end, 2);
t3 = tempData(end, 3);

volt = writeread(v, "MEAS:VOLT?");
current = writeread(v, "MEAS:CURR?");
power = writeread(v, "MEAS:POWer?");
data = [ t1, t2, t3, volt, current, power, timeStamp(end)];
writematrix(data, matlabCSVPath, "WriteMode", "append");
pause(0.8605);
end

write(v, "OUTP 0");
stop(d);

%manually export the hobo data to current trial directory named
%   'hoboCurrentTrial.csv'
disp("Export hobo csv data to the current trial directory, name it 'hoboCurrentTrial.csv'")
pause;

% take stats of trial
trialStatsFilePath = strcat(BASE_DIR, "trialStats.txt");
callPythonWriteStats(trialStatsFilePath, string(length));

% clean and convert hobo data
hoboCSVInputPath = strcat(BASE_DIR, "hoboCurrentTrial.csv");
hoboCleanedDataPath = callPythonClean(hoboCSVInputPath, strcat(BASE_DIR, "hoboCleanedData.csv"));
hoboCleanedAndConvertedPath = callPythonConversion(hoboCleanedDataPath, strcat(BASE_DIR, "hoboCleanedAndConvertedData.csv"));

% plot data
plotData(BASE_DIR);

end