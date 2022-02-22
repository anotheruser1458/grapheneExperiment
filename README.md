# Graphene Experiment
These scripts are used to automate the data capture of the NI-9214 C Series Temperature input module https://www.ni.com/en-us/shop/hardware/products/c-series-temperature-input-module.html?modelId=122166 the BK Precision 9803 Power Supply https://www.bkprecision.com/products/power-supplies/9803-programmable-ac-power-source-750-va.html and the HOBO plug load data logger https://www.onsetcomp.com/products/data-loggers/ux120-018/

## Execute Experiment
The main project script is <em><i>executeExperiment.m</i></em>, which is called at the beginning of every experiment. The parameters are the trialName and the desired length in seconds of the experiment.

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

The initializeExperiment script is called, which uses MATLAB drivers/plugins to create objects associated with each instrument plugged into the computer. The important result of this script is now in the MATLAB work station <b>b</b> is the object associated with the Ni-9214 Thermal Couple and <b>v</b> is the object associated with the BK Precision 9803 Power Supply. An empty 'data' matrix is also initiated.

