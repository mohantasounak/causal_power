# causal_power
calculates causal power (as well as delta P) based on Cheng 1997 "From covariation to causation: A causal power theory."
Example code and simulated data.

# Requirements
Tested on Matlab 2018a.

# Installation
Step 1: Addpath cal_causal_power.m. This is an example function on how to calculate causal power from an array of conditions. 

Step 2: Load simulation_data.mat in the workspace. This will load "trial_type" and "conditions" onto the workspace.

Step 3: "trial_type" is a [900 x 1] array with 9 unique experiment conditions repeated over the experiment. "conditions" is a [3 x 3] matrix with the 9 unique conditions. "conditions" is structured in the following way:

    [cause_positive:effect_positive, cause_positive:effect_negative, cause_positive:effect_negative
      cause_negative:effect_positive,  cause_negative:effect_negative, cause_negative:effect_negative
      cause_negative:effect_negative, cause_negative:effect_negative, cause_negative:effect_negative]
      
Step 4: Run [stats] = cal_causal_power(trial_type, conditions)

stats.deltaP = delta P calculations

stats.causal_power = causal_power calculations
