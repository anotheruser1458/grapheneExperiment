function data = graphSpecificData()

trials = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 13];

for i = 1:12

matLabPath = createMatlabPath(trials(i));
hoboPath = createHoboPath(trials(i));

[voltage, current, power, time, t1, t2, t3] = readMatlabData(matLabPath);
[hVoltage, hCurrent, hPower, hPowerFactor, hTime] = readHoboData(hoboPath);


%change these variables to decide what you want to see
%note hobo params need to use hTime
plot(time, t1);
hold on

end
hold off

end