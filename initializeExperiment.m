%% Measure Temp 9212

%Create DataAcquisition Object
d = daq("ni");
d.Rate = 15;

%Create Power Object
v = visadev("GPIB0::1::INSTR");
%write(v, "VOLTage 120");
%write(v, "FREQ 50.0");

%Add channels and set channel properties right box
ch = addinput(d, "cDAQ9185-1EBC1EFMod4", "ai0", "Thermocouple");
ch2 = addinput(d, "cDAQ9185-1EBC1EFMod4", "ai1", "Thermocouple");
ch3 = addinput(d, "cDAQ9185-1EBC1EFMod4", "ai2", "Thermocouple");
% ch4 = addinput(d, "cDAQ9185-1EBC1EFMod4", "ai3", "Thermocouple");

% Now left box
% ch5 = addinput(d, "cDAQ9185-1EBC1EFMod4", "ai4", "Thermocouple");
% ch6 = addinput(d, "cDAQ9185-1EBC1EFMod4", "ai5", "Thermocouple");
% ch7 = addinput(d, "cDAQ9185-1EBC1EFMod4", "ai6", "Thermocouple");
% ch8 = addinput(d, "cDAQ9185-1EBC1EFMod4", "ai7", "Thermocouple");


%Set thermocouple type and temperature unit
ch.ThermocoupleType = 'T';
ch.Units = 'Celsius';
ch2.ThermocoupleType = 'T';
ch2.Units = 'Celsius';
ch3.ThermocoupleType = 'T';
ch3.Units = 'Celsius';
% ch4.ThermocoupleType = 'T';
% ch4.Units = 'Celsius';

% ch5.ThermocoupleType = 'T';
% ch5.Units = 'Celsius';
% ch6.ThermocoupleType = 'T';
% ch6.Units = 'Celsius';
% ch7.ThermocoupleType = 'T';
% ch7.Units = 'Celsius';
% ch8.ThermocoupleType = 'T';
% ch8.Units = 'Celsius';

%Show start time
t = datetime('now');
