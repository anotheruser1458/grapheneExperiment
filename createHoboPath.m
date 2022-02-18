function hoboPath = createHoboPath(number) 

splitDir1 = "GTLED-";
splitDir2 = "--1-1";
trialDir = strcat(splitDir1, num2str(number), splitDir2);
hoboPath = strcat(trialDir, "\hoboCleanedAndConvertedData.csv");

end