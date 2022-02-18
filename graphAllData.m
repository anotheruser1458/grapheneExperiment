function [] = graphAllData()
trials = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 13];

for i = 1:12

matLabPath = createMatlabPath(trials(i));
hoboPath = createHoboPath(trials(i));

[voltage, current, power, time, t1, t2, t3] = readMatlabData(matLabPath);
[hVoltage, hCurrent, hPower, hPowerFactor, hTime] = readHoboData(hoboPath);


%change these variables to decide what you want to see
%note hobo params need to use hTime

    p1 = subplot(3, 4, 1);
    xlabel("Time (s)");
    ylabel("Temperature (C)");
    plot(time, t2);
    title("Ambient Air Temperature");
    hold on

    p2 = subplot(3, 4, 2);
    xlabel("Time (s)");
    ylabel("Temperature (C)")
    plot(time, t1);
    title("Driver Surface (Bottom plastic)");
    hold on

    p3 = subplot(3, 4, 3);
    xlabel("Time (s)");
    ylabel("Temperature (C)");
    plot(time, t3);
    title("Top Plastic Bulb Surface");
    hold on

    p4 = subplot(3, 4, 4);
    xlabel("Time (s)");
    ylabel("Voltage");
    plot(time, voltage);
    title("PS Voltage");
    hold on

    p5 = subplot(3, 4, 5);
    xlabel("Time (s)");
    ylabel("Power");
    plot(time, power);
    title("PS Power");
    hold on

    p6 = subplot(3, 4, 6);
    xlabel("Time (s)");
    ylabel("Current");
    plot(time, current);
    title("PS Current");
    hold on

    p7 = subplot(3, 4, 7);
    xlabel("Time (s)");
    ylabel("Voltage");
    plot(hTime, hVoltage);
    title("HOBO Voltage");
    hold on

    p8 = subplot(3, 4, 8);
    xlabel("Time (s)");
    ylabel("Current");
    plot(hTime, hCurrent);
    title("HOBO Current");
    hold on

    p9 = subplot(3, 4, 9);
    xlabel("Time (s)");
    ylabel("Power");
    plot(hTime, hPower);
    title("HOBO Power");
    hold on

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

    %figure
    xlabel("Time (s)");
    ylabel("Temperature (C)");
    plot(time, t2, 'b-');
    title("Ambient Air Temperature");
end

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

legend(Legend);

hold off
end