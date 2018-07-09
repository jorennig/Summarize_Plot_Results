clear all
close all
clc

%% Behavior
% run('/Volumes/data/BCM/Experiments/Noisy_Audiovisual_fMRI/results/Behav_Processing_Noisy_Audiovisual.m');
% 
% run('/Volumes/data/BCM/Experiments/Mouth_Eye_Localizer/results/Behav_Processing_Mouth_Eye_Localizer.m');
% 
% run('/Volumes/data/BCM/Experiments/Clear_Syllables_ET/results/Behav_Processing_Clear_Syllables_ET.m');
% clear all;
% 
% run('/Volumes/data/BCM/Experiments/Noisy_Audiovisual_fMRI/Regressor_Files_Behavior/Noisy_Audiovisual_Regressors_Individual_Response.m');
% clear all;

%% Eye tracking
% run('/Volumes/data/BCM/Experiments/Noisy_Audiovisual_fMRI/results_et/ET_Data_Processing_Noisy_AV_fMRI.m');
% run('/Volumes/data/BCM/Experiments/Noisy_Audiovisual_fMRI/results_et/ET_Data_Processing_Noisy_AV_fMRI_Center_Fixes.m');
% run('/Volumes/data/BCM/Experiments/Noisy_Audiovisual_fMRI/results_et/Correct_Noisy_AV_fMRI.m');
% clear all;
% run('/Volumes/data/BCM/Experiments/Noisy_Audiovisual_fMRI/results_et/ROI_Processing_Noisy_AV_fMRI.m');
% clear all;
% 
% run('/Volumes/data/BCM/Experiments/Mouth_Eye_Localizer/results_et/ET_Data_Processing_Mouth_Eye.m');
% run('/Volumes/data/BCM/Experiments/Mouth_Eye_Localizer/results_et/ET_Data_Processing_Mouth_Eye_Center_Fixes.m');
% run('/Volumes/data/BCM/Experiments/Mouth_Eye_Localizer/results_et/Correct_Mouth_Eye.m');
% clear all;
% 
% run('/Volumes/data/BCM/Experiments/Mouth_Eye_Localizer/results_et/ROI_Processing_Mouth_Eyes.m');
% clear all;
% 
% run('/Volumes/data/BCM/Experiments/Clear_Syllables_ET/results_et/ET_Data_Processing_Clear_Syllables.m');
% run('/Volumes/data/BCM/Experiments/Clear_Syllables_ET/results_et/ET_Data_Processing_Clear_Syllables_Center_Fixes.m');
% run('/Volumes/data/BCM/Experiments/Clear_Syllables_ET/results_et/Correct_Clear_Syllables.m');
% clear all;
% run('/Volumes/data/BCM/Experiments/Clear_Syllables_ET/results_et/ROI_Processing_Clear_Syllables.m');
% clear all;
% run('/Volumes/data/BCM/Experiments/Noisy_Audiovisual_fMRI/Check_Center_Fixations/Show_Fixations.m');
% clear all;

%% Heat maps
% run('/Volumes/data/BCM/Experiments/Noisy_Audiovisual_fMRI/results_et/Heat_Maps/Heat_Map_tot_over_sub.m');
% run('/Volumes/data/BCM/Experiments/Noisy_Audiovisual_fMRI/results_et/Heat_Maps/Heat_Map_tot_per_sub_per_task.m');
% 
% run('/Volumes/data/BCM/Experiments/Mouth_Eye_Localizer/results_et/Heat_Maps/Heat_Map_tot_over_sub.m');
% run('/Volumes/data/BCM/Experiments/Mouth_Eye_Localizer/results_et/Heat_Maps/Heat_Map_tot_per_sub_per_task.m');
% 
% run('/Volumes/data/BCM/Experiments/Clear_Syllables_ET/results_et/Heat_Maps/Heat_Map_tot_over_sub.m');
% run('/Volumes/data/BCM/Experiments/Clear_Syllables_ET/results_et/Heat_Maps/Heat_Map_tot_per_sub_per_task.m');

%% Summarize ROI data
clear all
clc

run('/Volumes/data/BCM/Experiments/Noisy_Audiovisual_fMRI/ROI_Analysis_Mouth_Eye_ROIs/ROI_Analysis_Mouth_Eye.m');
run('/Volumes/data/BCM/Experiments/Noisy_Audiovisual_fMRI/ROI_Analysis_MouthAndEye_ROIs/ROI_Analysis_MouthandEye.m');

run('/Volumes/data/BCM/Experiments/Noisy_Audiovisual_fMRI/ROI_Analysis_AV_ROIs/ROI_Analysis_AV.m');
run('/Volumes/data/BCM/Experiments/Noisy_Audiovisual_fMRI/ROI_Analysis_AV_ROIs_AN_AVN/ROI_Analysis_AV_AN_AVN.m');

%% Summarize behavior, eye tracking and fMRI of all three experiments
clear all
clc

excl = [];

% Behavior
load('/Volumes/data/BCM/Experiments/Noisy_Audiovisual_fMRI/results/Audiovisual_Noisy_Behav.mat');
behav_av_noisy = data_behav_sum_sub;
behav_av_noisy(excl,:) = [];

load('/Volumes/data/BCM/Experiments/Mouth_Eye_Localizer/results/Mouth_Eye_Localizer_Behav.mat');
behav_mouth_eye = data_behav_sum;

load('/Volumes/data/BCM/Experiments/Clear_Syllables_ET/results/Clear_Syllables_ET_Behav.mat');
behav_clear_syllables = data_behav_sum;

% Eye tracking
load('/Volumes/data/BCM/Experiments/Noisy_Audiovisual_fMRI/results_et/ROI_Noisy_AV_fMRI_Results.mat');
et_av_noisy = data_sum;

load('/Volumes/data/BCM/Experiments/Mouth_Eye_Localizer/results_et/ROI_Mouth_Eye_Results.mat');
et_mouth_eye = data_mov;

load('/Volumes/data/BCM/Experiments/Clear_Syllables_ET/results_et/ROI_Clear_Syllables_Results.mat');
et_clear_syllables = data_sum;

% fMRI
load('/Volumes/data/BCM/Experiments/Noisy_Audiovisual_fMRI/ROI_Analysis_Mouth_Eye_ROIs/ROI_results_Mouth_Eye.mat');
roi_data_me = roi_data_tot;

load('/Volumes/data/BCM/Experiments/Noisy_Audiovisual_fMRI/ROI_Analysis_AV_ROIs/ROI_results_AV_A_V.mat');
roi_data_av = roi_data_tot;

load('/Volumes/data/BCM/Experiments/Noisy_Audiovisual_fMRI/ROI_Analysis_MouthAndEye_ROIs/ROI_results_MouthandEye.mat');
roi_data_m_and_e = roi_data_tot;

clearvars -except behav_av_noisy behav_mouth_eye behav_clear_syllables et_av_noisy et_mouth_eye et_clear_syllables roi_data_me roi_data_av roi_data_m_and_e

mouth_roi.lh.psc_a = table2array(roi_data_me(:,1));
mouth_roi.lh.psc_v = table2array(roi_data_me(:,2));
mouth_roi.lh.psc_av = table2array(roi_data_me(:,3));
mouth_roi.lh.psc_an = table2array(roi_data_me(:,4));
mouth_roi.lh.psc_avn = table2array(roi_data_me(:,5));

mouth_roi.rh.psc_a = table2array(roi_data_me(:,6));
mouth_roi.rh.psc_v = table2array(roi_data_me(:,7));
mouth_roi.rh.psc_av = table2array(roi_data_me(:,8));
mouth_roi.rh.psc_an = table2array(roi_data_me(:,9));
mouth_roi.rh.psc_avn = table2array(roi_data_me(:,10));

eyes_roi.lh.psc_a = table2array(roi_data_me(:,11));
eyes_roi.lh.psc_v = table2array(roi_data_me(:,12));
eyes_roi.lh.psc_av = table2array(roi_data_me(:,13));
eyes_roi.lh.psc_an = table2array(roi_data_me(:,14));
eyes_roi.lh.psc_avn = table2array(roi_data_me(:,15));

eyes_roi.rh.psc_a = table2array(roi_data_me(:,16));
eyes_roi.rh.psc_v = table2array(roi_data_me(:,17));
eyes_roi.rh.psc_av = table2array(roi_data_me(:,18));
eyes_roi.rh.psc_an = table2array(roi_data_me(:,19));
eyes_roi.rh.psc_avn = table2array(roi_data_me(:,20));

mouth_eye_roi.lh.psc_a = table2array(roi_data_m_and_e(:,1));
mouth_eye_roi.lh.psc_v = table2array(roi_data_m_and_e(:,2));
mouth_eye_roi.lh.psc_av = table2array(roi_data_m_and_e(:,3));
mouth_eye_roi.lh.psc_an = table2array(roi_data_m_and_e(:,4));
mouth_eye_roi.lh.psc_avn = table2array(roi_data_m_and_e(:,5));
mouth_eye_roi.lh.psc_m = table2array(roi_data_m_and_e(:,6));
mouth_eye_roi.lh.psc_e = table2array(roi_data_m_and_e(:,7));

mouth_eye_roi.rh.psc_a = table2array(roi_data_m_and_e(:,8));
mouth_eye_roi.rh.psc_v = table2array(roi_data_m_and_e(:,9));
mouth_eye_roi.rh.psc_av = table2array(roi_data_m_and_e(:,10));
mouth_eye_roi.rh.psc_an = table2array(roi_data_m_and_e(:,11));
mouth_eye_roi.rh.psc_avn = table2array(roi_data_m_and_e(:,12));
mouth_eye_roi.rh.psc_m = table2array(roi_data_m_and_e(:,13));
mouth_eye_roi.rh.psc_e = table2array(roi_data_m_and_e(:,14));

% Analysis
behav_av_noisy_c = table2array(behav_av_noisy);

an_n = behav_av_noisy_c(:,11);
an_se = behav_av_noisy_c(:,12) + behav_av_noisy_c(:,13);
an_e = behav_av_noisy_c(:,13);

avn_n = behav_av_noisy_c(:,14);
avn_se = behav_av_noisy_c(:,15) + behav_av_noisy_c(:,16);
avn_e = behav_av_noisy_c(:,16);

av_gain = avn_se - an_se;

% mean_an_n = mean(an_n);
% mean_an_se = mean(an_se);
% mean_avn_n = mean(avn_n);
% mean_avn_se = mean(avn_se);

% Correlations ET
et_clear_syllables_low = table2array(et_clear_syllables(:,5));
et_av_noisy_low = table2array(et_av_noisy(:,5));
et_mouth_eye_low = mean(table2array(et_mouth_eye),2);

reg_et_clear_syllables_et_av_noisy = regstats(et_clear_syllables_low,et_av_noisy_low);
reg_et_clear_syllables_et_av_noisy.corr_r = corrcoef(et_clear_syllables_low,et_av_noisy_low);

reg_et_clear_syllables_et_mouth_eye = regstats(et_clear_syllables_low,et_mouth_eye_low);
reg_et_clear_syllables_et_mouth_eye.corr_r = corrcoef(et_clear_syllables_low,et_mouth_eye_low);

reg_et_av_noisy_et_mouth_eye = regstats(et_av_noisy_low,et_mouth_eye_low);
reg_et_av_noisy_et_mouth_eye.corr_r = corrcoef(et_av_noisy_low,et_mouth_eye_low);

% Correlations AV perception
reg_an_se_avn_se = regstats(an_se,avn_se);
reg_an_se_avn_se.corr_r = corrcoef(an_se,avn_se);

reg_av_gain_avn_se = regstats(av_gain,avn_se);
reg_av_gain_avn_se.corr_r = corrcoef(av_gain,avn_se);

reg_av_gain_an_se = regstats(av_gain,an_se);
reg_av_gain_an_se.corr_r = corrcoef(av_gain,an_se);

% Correlations ET - AV perception
reg_an_se_et_clear_syllables = regstats(an_se,et_clear_syllables_low);
reg_an_se_et_clear_syllables.corr_r = corrcoef(an_se,et_clear_syllables_low);

reg_avn_se_et_clear_syllables = regstats(avn_se,et_clear_syllables_low);
reg_avn_se_et_clear_syllables.corr_r = corrcoef(avn_se,et_clear_syllables_low);

reg_av_gain_avn_se = regstats(av_gain,et_clear_syllables_low);
reg_av_gain_avn_se.corr_r = corrcoef(av_gain,et_clear_syllables_low);

reg_av_gain_et_clear_syllables = regstats(av_gain,et_clear_syllables_low);
reg_av_gain_et_clear_syllables.corr_r = corrcoef(av_gain,et_clear_syllables_low);

% Correlation fMRI - AV perception/ET
con_fMRI  = {'A' 'V' 'AV' 'AN' 'AVN'};

% Mouth ROI
hem = fieldnames(mouth_roi);
con = fieldnames(mouth_roi.lh);

for i = 1:numel(hem)
    
    for j = 1:numel(con)
      
        psc_c = mouth_roi.(hem{i}).(con{j});
        
        reg_avn_se_psc = regstats(avn_se,psc_c);
        reg_avn_se_psc.corr_r = corrcoef(avn_se,psc_c);

        reg_av_gain_psc = regstats(av_gain,psc_c);
        reg_av_gain_psc.corr_r = corrcoef(av_gain,psc_c);

        reg_clear_syllables_psc = regstats(et_clear_syllables_low,psc_c);
        reg_clear_syllables_psc.corr_r = corrcoef(et_clear_syllables_low,psc_c);
        
        mouth_roi_corr.(hem{i}).([con_fMRI{j} 'psc_avn_se']) = [reg_avn_se_psc.fstat.pval reg_avn_se_psc.corr_r(1,2)];
        mouth_roi_corr.(hem{i}).([con_fMRI{j} 'psc_av_gain']) = [reg_av_gain_psc.fstat.pval reg_av_gain_psc.corr_r(1,2)];
        mouth_roi_corr.(hem{i}).([con_fMRI{j} 'psc_clear_syll_et']) = [reg_clear_syllables_psc.fstat.pval reg_clear_syllables_psc.corr_r(1,2)];

    end
end

% Eyes ROI
hem = fieldnames(eyes_roi);
con = fieldnames(eyes_roi.lh);

for i = 1:numel(hem)
    
    for j = 1:numel(con)
      
        psc_c = eyes_roi.(hem{i}).(con{j});
        
        reg_avn_se_psc = regstats(avn_se,psc_c);
        reg_avn_se_psc.corr_r = corrcoef(avn_se,psc_c);
        
        reg_av_gain_psc = regstats(av_gain,psc_c);
        reg_av_gain_psc.corr_r = corrcoef(av_gain,psc_c);
        
        reg_clear_syllables_psc = regstats(et_clear_syllables_low,psc_c);
        reg_clear_syllables_psc.corr_r = corrcoef(et_clear_syllables_low,psc_c);
        
        eyes_rois_corr.(hem{i}).([con_fMRI{j} 'psc_avn_se']) = [reg_avn_se_psc.fstat.pval reg_avn_se_psc.corr_r(1,2)];
        eyes_rois_corr.(hem{i}).([con_fMRI{j} 'psc_av_gain']) = [reg_av_gain_psc.fstat.pval reg_av_gain_psc.corr_r(1,2)];
        eyes_rois_corr.(hem{i}).([con_fMRI{j} 'psc_clear_syll_et']) = [reg_clear_syllables_psc.fstat.pval reg_clear_syllables_psc.corr_r(1,2)];

    end
end

% fMRI analysis
mouth_roi_l = table2array(roi_data_me(:,1:5));
mouth_roi_r = table2array(roi_data_me(:,6:10));
eyes_roi_l = table2array(roi_data_me(:,11:15));
eyes_roi_r = table2array(roi_data_me(:,16:20));

% RSA per hemisphere through mouth and eye ROIs
data_lh = [mouth_roi_l eyes_roi_l];
data_rh = [mouth_roi_r eyes_roi_r];

corr_r_l = [];
reg_p_l = [];

for i = 1:size(data_lh,2)
    
    data_c = data_lh(:,i);
    
    corr_r_c = [];
    reg_p_c = [];
    
    for j = 1:size(data_lh,2)
        
        corr_r = corrcoef(data_c,data_lh(:,j));
        corr_r_c(j) = corr_r(1,2);
        reg = regstats(data_c,data_lh(:,j));
        reg_p_c(j) = reg.fstat.pval;
        
    end
    
    corr_r_l(i,:) = corr_r_c;
    reg_p_l(i,:) = reg_p_c;
    
end

corr_r_r = [];
reg_p_r = [];

for i = 1:size(data_rh,2)
    
    data_c = data_rh(:,i);
    
    corr_r_c = [];
    reg_p_c = [];
    
    for j = 1:size(data_rh,2)
        
        corr_r = corrcoef(data_c,data_rh(:,j));
        corr_r_c(j) = corr_r(1,2);
        reg = regstats(data_c,data_rh(:,j));
        reg_p_c(j) = reg.fstat.pval;
        
    end
    
    corr_r_r(i,:) = corr_r_c;
    reg_p_r(i,:) = reg_p_c;
    
end

av_roi_l = table2array(roi_data_av(:,1:2));
av_roi_r = table2array(roi_data_av(:,3:4));

a_roi_l = table2array(roi_data_av(:,5:6));
a_roi_r = table2array(roi_data_av(:,7:8));

v_roi_l = table2array(roi_data_av(:,9:10));
v_roi_r = table2array(roi_data_av(:,11:12));

%% Plot
run('/Volumes/data/BCM/Experiments/Noisy_Audiovisual_fMRI/Analysis_Summary/Plot_fMRI.m');
run('/Volumes/data/BCM/Experiments/Noisy_Audiovisual_fMRI/Analysis_Summary/Plot_Behavior_Eye_Tracking.m');
run('/Volumes/data/BCM/Experiments/Noisy_Audiovisual_fMRI/Analysis_Summary/Plot_fMRI_Behav_ET.m');

% Clear/noise ROIs
run('/Volumes/data/BCM/Experiments/Noisy_Audiovisual_fMRI/Analysis_Summary/Plot_fMRI_Clear_Noise_ROIs.m');

% Mouth and eye ROI
run('/Volumes/data/BCM/Experiments/Noisy_Audiovisual_fMRI/Analysis_Summary/Plot_fMRI_MouthandEye_ROI.m');

%% Mouth/Eye Looker Analysis
run('/Volumes/data/BCM/Experiments/Noisy_Audiovisual_fMRI/Analysis_Summary/Mouth_Eye_Lookers/Mouth_Eye_Looker_Analysis.m');
