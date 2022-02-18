
function [] = plotData(dir)

    hoboCSVFile = strcat(dir, "hoboCleanedAndConvertedData.csv");
    matlabCSVFile = strcat(dir, "matlabCurrentTrial.csv");

    [voltage, current, power, time, t1, t2, t3] = readMatlabData(matlabCSVFile);
    [hVoltage, hCurrent, hPower, hPowerFactor, hTime] = readHoboData(hoboCSVFile);

    p1 = subplot(3, 4, 1);
    xlabel("Time (s)");
    ylabel("Temperature (C)");
    plot(time, t2, 'b-');
    title("Ambient Air Temperature");

    p2 = subplot(3, 4, 2);
    xlabel("Time (s)");
    ylabel("Temperature (C)")
    plot(time, t1, 'b-');
    title("Driver Surface (Bottom plastic)");

    p3 = subplot(3, 4, 3);
    xlabel("Time (s)");
    ylabel("Temperature (C)");
    plot(time, t3, "b-");
    title("Top Plastic Bulb Surface");
    
    p4 = subplot(3, 4, 4);
    xlabel("Time (s)");
    ylabel("Voltage");
    plot(time, voltage);
    title("PS Voltage");
    
    p5 = subplot(3, 4, 5);
    xlabel("Time (s)");
    ylabel("Power");
    plot(time, power);
    title("PS Power");
    
    
    p6 = subplot(3, 4, 6);
    xlabel("Time (s)");
    ylabel("Current");
    plot(time, current);
    title("PS Current");

    p7 = subplot(3, 4, 7);
    xlabel("Time (s)");
    ylabel("Voltage");
    plot(hTime, hVoltage);
    title("HOBO Voltage");

    p8 = subplot(3, 4, 8);
    xlabel("Time (s)");
    ylabel("Current");
    plot(hTime, hCurrent);
    title("HOBO Current");

    p9 = subplot(3, 4, 9);
    xlabel("Time (s)");
    ylabel("Power");
    plot(hTime, hPower);
    title("HOBO Power");

    set( get(p1, "XLabel"), "String", "Time (seconds)");
    set( get(p1, "YLabel"), "String", "Temperature (C)");
    set( get(p2, "XLabel"), "String", "Time (seconds)");
    set( get(p2, "YLabel"), "String", "Temperature (C)");
    set( get(p3, "XLabel"), "String", "Time (seconds)");
    set( get(p3, "YLabel"), "String", "Temperature (C)");
    set( get(p4, "XLabel"), "String", "Time (seconds)");
    set( get(p4, "YLabel"), "String", "Volts");
    set( get(p5, "XLabel"), "String", "Time (seconds)");
    set( get(p5, "YLabel"), "String", "Watts");
    set( get(p6, "XLabel"), "String", "Time (seconds)");
    set( get(p6, "YLabel"), "String", "Amps");
    set( get(p7, "XLabel"), "String", "Time (seconds)");
    set( get(p7, "YLabel"), "String", "Volts");
    set( get(p8, "XLabel"), "String", "Time (seconds)");
    set( get(p8, "YLabel"), "String", "Amps");
    set( get(p9, "XLabel"), "String", "Time (seconds)");
    set( get(p9, "YLabel"), "String", "Watts");    
end