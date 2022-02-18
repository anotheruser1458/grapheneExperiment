function [] = graphAllDataSingleFigure()

trials = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 13];

Legend = cell(12, 1);
Legend{1} = "GTLED-1";
Legend{2} = "GTLED-2";
Legend{3} = "GTLED-3";
Legend{4} = "GTLED-4";
Legend{5} = "GTLED-5";
Legend{6} = "GTLED-6";
Legend{7} = "GTLED-7";
Legend{8} = "GTLED-8";
Legend{9} = "GTLED-9";
Legend{10} = "GTLED-10";
Legend{11} = "GTLED-12";
Legend{12} = "GTLED-13";

for x=1:12

hoboPath = createHoboPath(trials(x));
matlabPath = createMatlabPath(trials(x));

[voltage, current, power, time, t1, t2, t3] = readMatlabData(matlabPath);
[hVoltage, hCurrent, hPower, hPowerFactor, hTime] = readHoboData(hoboPath);

figure(1)
plot(time, t2);
xlabel("Time (s)");
ylabel("Temperature (C)");
title("Ambient Air Temperature"); 
legend(Legend);
hold on

figure(2)
plot(time, t1);
title("Driver Surface (Bottom plastic)");
xlabel("Time (s)");
ylabel("Temperature (C)")
legend(Legend);
hold on

figure(3)
plot(time, t3);
title("Top Plastic Bulb Surface");
xlabel("Time (s)");
ylabel("Temperature (C)");
legend(Legend);
hold on

figure(4)
xlabel("Time (s)");
ylabel("Voltage");
plot(time, voltage);
title("PS Voltage");
legend(Legend);
hold on

figure(5)
xlabel("Time (s)");
ylabel("Power");
plot(time, power);
title("PS Power");
legend(Legend);
hold on

figure(6)
xlabel("Time (s)");
ylabel("Current");
plot(time, current);
title("PS Current");
legend(Legend);
hold on

figure(7)
xlabel("Time (s)");
ylabel("Voltage");
plot(hTime, hVoltage);
title("HOBO Voltage");
legend(Legend);
hold on

figure(8)
xlabel("Time (s)");
ylabel("Current");
plot(hTime, hCurrent);
title("HOBO Current");
legend(Legend);
hold on

figure(9)
xlabel("Time (s)");
ylabel("Power");
plot(hTime, hPower);
title("HOBO Power");
legend(Legend);
hold on
end

hold off

end