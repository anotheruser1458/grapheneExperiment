
% script reads all data from each trial into workspace
% chane trialNumber to select a different trial
trialNumber = 10;

hoboPath = createHoboPath(trialNumber);
matlabPath = createMatlabPath(trialNumber);

[voltage, current, power, time, t1, t2, t3] = readMatlabData(matlabPath);
[hVoltage, hCurrent, hPower, hPowerFactor, hTime] = readHoboData(hoboPath);