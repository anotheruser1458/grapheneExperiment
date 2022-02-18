function matLabPath = createMatlabPath(number)

splitDir1 = "GTLED-";
splitDir2 = "--1-1";
trialDir = strcat(splitDir1, num2str(number), splitDir2);
matLabPath = strcat(trialDir, "\matlabCurrentTrial.csv");

end