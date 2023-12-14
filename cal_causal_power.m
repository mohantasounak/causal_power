function [stats] = cal_causal_power(trial_type, conditions)
% calcualtes delta_P and causal power from conditions.
% inputs:
% trial_type = array of N conditions from experiment [N x1]
% conditions = matrix of unique conditions
%%

        N_e_pos_c_pos_A1V1=0;
        N_e_pos_c_neg_A1V1=0;
        N_e_neg_c_pos_A1V1=0;       
        N_e_neg_c_neg_A1V1=0;

        

% update at each trial
for i= 1: size(trial_type,1)
    if trial_type(i) == conditions(1, 1)
        N_e_pos_c_pos_A1V1= N_e_pos_c_pos_A1V1+1;
        delta_P_A1V1= (N_e_pos_c_pos_A1V1)/(N_e_pos_c_pos_A1V1+N_e_neg_c_pos_A1V1) - ...
            (N_e_pos_c_neg_A1V1)/(N_e_pos_c_neg_A1V1+N_e_neg_c_neg_A1V1); % calculating delta_P

        update_delta_P_A1(i)= delta_P_A1V1;

        power_A1(i)= delta_P_A1V1/( 1-  (N_e_pos_c_neg_A1V1)/(N_e_pos_c_neg_A1V1+N_e_neg_c_neg_A1V1)); % calculating causal power

            continue;

    elseif trial_type(i) == conditions(1, 2) | trial_type(i) == conditions(1, 3)
        N_e_neg_c_pos_A1V1= N_e_neg_c_pos_A1V1+1;
        delta_P_A1V1= (N_e_pos_c_pos_A1V1)/(N_e_pos_c_pos_A1V1+N_e_neg_c_pos_A1V1) - ...
            (N_e_pos_c_neg_A1V1)/(N_e_pos_c_neg_A1V1+N_e_neg_c_neg_A1V1);
        update_delta_P_A1(i)= delta_P_A1V1;
        power_A1(i)= delta_P_A1V1/( 1-  (N_e_pos_c_neg_A1V1)/(N_e_pos_c_neg_A1V1+N_e_neg_c_neg_A1V1));

            continue;

    elseif trial_type(i) == conditions(2,2) | trial_type(i) == conditions(2,3) | trial_type(i) == conditions(3, 2) | trial_type(i) == conditions(3, 3) 
        N_e_neg_c_neg_A1V1= N_e_neg_c_neg_A1V1+1;
        delta_P_A1V1= (N_e_pos_c_pos_A1V1)/(N_e_pos_c_pos_A1V1+N_e_neg_c_pos_A1V1) - ...
            (N_e_pos_c_neg_A1V1)/(N_e_pos_c_neg_A1V1+N_e_neg_c_neg_A1V1);
        update_delta_P_A1(i)= delta_P_A1V1;
        power_A1(i)= delta_P_A1V1/( 1-  (N_e_pos_c_neg_A1V1)/(N_e_pos_c_neg_A1V1+N_e_neg_c_neg_A1V1));

            continue;

    else N_e_pos_c_neg_A1V1= N_e_pos_c_neg_A1V1+1;
         delta_P_A1V1= (N_e_pos_c_pos_A1V1)/(N_e_pos_c_pos_A1V1+N_e_neg_c_pos_A1V1) - ...
        (N_e_pos_c_neg_A1V1)/(N_e_pos_c_neg_A1V1+N_e_neg_c_neg_A1V1);
            update_delta_P_A1(i)= delta_P_A1V1;
         power_A1(i)= delta_P_A1V1/( 1-  (N_e_pos_c_neg_A1V1)/(N_e_pos_c_neg_A1V1+N_e_neg_c_neg_A1V1));

            continue;

    end

end
stats.delta_P = update_delta_P_A1;
stats.causal_power = power_A1;

end

