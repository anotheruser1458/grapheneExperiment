%read data from matlab csv
function [voltage, current, power, time, t1, t2, t3] = readMatlabData(file)
    data = csvread(file);
    
    t1 = data(:, 1);
    t2 = data(:, 2);
    t3 = data(:, 3);
    voltage = data(:, 4);
    current = data(:, 5);
    power = data(:, 6);
    time = data(:, 7);
end