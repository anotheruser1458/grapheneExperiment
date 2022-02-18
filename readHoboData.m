%read data from hobo csv
function [hVoltage, hCurrent, hPower, hPowerFactor, hTime] = readHoboData(file)
    hData = csvread(file);
    hVoltage = hData(:, 1);
    hCurrent = hData(:, 2);
    hPower = hData(:, 3);
    hPowerFactor = hData(:, 4);
    hTime = [1:size(hData, 1)];
end