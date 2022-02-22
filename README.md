# Graphene Experiment
These scripts are used to automate the data capture of the NI-9214 C Series Temperature input module https://www.ni.com/en-us/shop/hardware/products/c-series-temperature-input-module.html?modelId=122166 the BK Precision 9803 Power Supply https://www.bkprecision.com/products/power-supplies/9803-programmable-ac-power-source-750-va.html and the HOBO plug load data logger https://www.onsetcomp.com/products/data-loggers/ux120-018/

## Execute Experiment
The main project script executeExperiment.m is called at the beginning of every experiment. The parameters are the trialName and the desired length in seconds of the experiment.

<em><strong>executeExperiment.m</strong></em> 
<br>

### Initialization

Function declared and reminder to launch the HOBO data logger is displayed. This is necessary because the HOBO logger does not have a direct matlab interface and will run on it's own thread for the duration of each experiment. The data is cleaned and combined with the rest of the instrument data later on via python scripts.

```matlab
function [] = executeExperiment(trialName, length) 

  disp("Ensure hobo device is launched, press any key to coninue")
  pause;
```

Directories are essential to the structural design of this script. The script expects each experiment to have its own directory in the root folder. Specific files will be created and stored in each experiment directory throughout the script. These files should remain in their associated directory or the data will not be properly processed or displayed later on.

The experiment directory is created along with other constants. BASE_DIR will serve as the current experiment's base directory path, and is immediately used to create the path to the matlabCurrentTrial.csv file.

```matlab
    mkdir(trialName);
    BASE_DIR = strcat(trialName, "\");
    matlabCSVPath = strcat(BASE_DIR, "matlabCurrentTrial.csv");
```

The initializeExperiment script is called, which uses MATLAB drivers/plugins to create objects associated with each instrument plugged into the computer. The important result of this script is now in the MATLAB work station <strong>b</strong> is the object associated with the Ni-9214 Thermal Couple and <strong>v</strong> is the object associated with the BK Precision 9803 Power Supply. An empty 'data' matrix is also initiated.

```matlab
    initializeExperiment;
    data = [];
```

Start the thermal couples on a seperate thread, which runs in the background until stopped.
```matlab
    start(d, "Continuous");
```

Turn on the power supply, which turns on the bulb for the experiment. After multiple tests, the two function calls took on average 0.992 seconds to complete, which is why the pause is warrented to keep the experiment synchronized.
```matlab
    write(v, "OUTP 1");
    pause(0.992);
```

### Main Loop
Main loop for capturing data. Each iteration takes 1 second to complete and iterates the number of times that were intiaially passed into the main function. Data is queried from the <strong>d</strong> object which pulls it from the running Ni-9214 instrument thread. tempData is a matrix and the temperatures of each thermal couple (these experiments used 3) are stored in their own variables: t1, t2, t3. Voltage, current, and power readings are also pulled from the powersupply and will later be used to compare with the HOBO data logs.

```matlab
    for c = 1:length
        [tempData, timeStamp, triggerTime] = read(d, "all", "OutputFormat","Matrix");

        t1 = tempData(end, 1);
        t2 = tempData(end, 2);
        t3 = tempData(end, 3);

        volt = writeread(v, "MEAS:VOLT?");
        current = writeread(v, "MEAS:CURR?");
        power = writeread(v, "MEAS:POWer?");

```

### RAM Limitations
The average experiment length was approximately 3600 seconds (one hour). In anticipation of limited volatile memory becoming an issue for the amount of data samples required for each experiment, a decision was made to instead write each iteration to a csv file instead of trying to store in in one large matrix in the MATLAB workstation. Each iteration's data is added to the data matrix. The matrix is then appended to the csv file path established earlier.
```matlab
        data = [ t1, t2, t3, volt, current, power, timeStamp(end)];
        writematrix(data, matlabCSVPath, "WriteMode", "append");
        pause(0.8605);
    end
```

### Accounting For Drift
The function calls for each iteration took on average 0.1395 seconds. A 0.8605 second pause was warrented to keep each iteration one second in length. These times were based on estimates and the drift after 1000, 2000, and 5000 iterations was measured and declared small enough to be negligible for the purpose of this experiment.

The loop finishes, the power supply is turned off and the thermal couple thread is stopped.
```matlab
    write(v, "OUTP 0");
    stop(d);
```

### Data Cleaning and Display
At this time the data is nicely stored in a csv file in the current experiment's directory. The HOBO device needs to be manually turned off and the csv data needs to be exported to the current experiment directory. Another pause and message is displayed instructing the operator what to do. 
```matlab
    disp("Export hobo csv data to the current trial directory, name it 'hoboCurrentTrial.csv'")
    pause;
```

Once properly exported, the python scripts <em><strong>cleanHoboData.py</strong></em> and <em><strong>convertHoboData.py</strong></em> will format the data so MATLAB can easily read it into a matrix. The version of MATLAB installed on the computers that were running the script would not read csv file data if it was delimited by anything other than a comma. The HOBO data logger exported csv data with a space delimiter, which required a python script to adjust this. MATLAB modules were created for the sole purpose of calling python python scripts.

```matlab
    % clean and convert hobo data
    hoboCSVInputPath = strcat(BASE_DIR, "hoboCurrentTrial.csv");
    hoboCleanedDataPath = callPythonClean(hoboCSVInputPath, strcat(BASE_DIR, "hoboCleanedData.csv"));
    hoboCleanedAndConvertedPath = callPythonConversion(hoboCleanedDataPath, strcat(BASE_DIR, "hoboCleanedAndConvertedData.csv"));
```

Meta data was recorded for each trial and added as a text file to each experiment directory.
```matlab
    % take stats of trial
    trialStatsFilePath = strcat(BASE_DIR, "trialStats.txt");
    callPythonWriteStats(trialStatsFilePath, string(length));
```

Finally plotData() is called on the experiment directory.
```matlab
    plotData(BASE_DIR);
end
```

### Displaying Data
There are many scripts that will display data in various ways. They all rely heavily on the project structure of having the data files named correctly in their correct experiment directories. The main script is <strong>plotData()</strong> which is called at the end of each experiment. It is used to display all data from each experiment.



<strong>plotData()</strong> is made up of many submodules. Each submodule used the directory and naming conventions described earlier to read csv data into matlab matrixes, and plot the data on plots and subplots. All plot functions are very similar because they all use the same suite of submodules, but are different because they display the data slightly different, giving emphasis on individual parts of the experiment.


