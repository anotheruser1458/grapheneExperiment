# Graphene Experiment
These scripts are used to automate the data capture of the NI-9214 C Series Temperature input module https://www.ni.com/en-us/shop/hardware/products/c-series-temperature-input-module.html?modelId=122166 the BK Precision 9803 Power Supply https://www.bkprecision.com/products/power-supplies/9803-programmable-ac-power-source-750-va.html and the HOBO plug load data logger https://www.onsetcomp.com/products/data-loggers/ux120-018/

## Execute Experiment
The main project script is <em><i>executeExperiment.m</i></em>, which is called at the beginning of every experiment. The parameters are the trialName and the desired length in seconds of the experiment.

Function declared and reminder to launch the HOBO data logger is displayed.

```matlab
function [] = executeExperiment(trialName, length) 

disp("Ensure hobo device is launched, press any key to coninue")
pause;
```
