 trials = [2, 6, 7];

hoboPath2 = createHoboPath(trials(2));
matlabPath2 = createMatlabPath(trials(2));

[voltage, current, power, time, t1, t2, t3] = readMatlabData(matlabPath2);
[hVoltage, hCurrent, hPower, hPowerFactor, hTime] = readHoboData(hoboPath2);

for x = 1:3
figure(1)
plot(time, t2);
xlabel("Time (s)");
ylabel("Temperature (C)");
title("Ambient Air Temperature");  
hold on

end

figure(2)
plot(time, t1);
title("Driver Surface (Bottom plastic)");
xlabel("Time (s)");
ylabel("Temperature (C)")
 
figure(3)
plot(time, t3);
title("Top Plastic Bulb Surface");
xlabel("Time (s)");
ylabel("Temperature (C)");

