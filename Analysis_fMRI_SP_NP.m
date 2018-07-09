clear all
close all
clc

run('/Volumes/data/BCM/Experiments/Noisy_Audiovisual_fMRI/ROI_Analysis_Mouth_Eye_ROIs_SP_NP/ROI_Analysis_Mouth_Eye_SP_NP.m');

run('/Volumes/data/BCM/Experiments/Noisy_Audiovisual_fMRI/ROI_Analysis_AV_ROIs_AN_AVN_SP_NP/ROI_Analysis_AN_AVN_SP_NP.m');

%% Correlate
clear all
close all
clc

load('/Volumes/data/BCM/Experiments/Noisy_Audiovisual_fMRI/ROI_Analysis_Mouth_Eye_ROIs_SP_NP/ROI_results_Mouth_Eye_SP_NP.mat');
roi_data_me = table2array(roi_data_tot);

mouth_roi.lh.psc_a = roi_data_me(:,1);
mouth_roi.lh.psc_v = roi_data_me(:,2);
mouth_roi.lh.psc_av = roi_data_me(:,3);
mouth_roi.lh.psc_an_sp = roi_data_me(:,4);
mouth_roi.lh.psc_an_np = roi_data_me(:,5);
mouth_roi.lh.psc_avn_sp = roi_data_me(:,6);
mouth_roi.lh.psc_avn_np = roi_data_me(:,7);
mouth_roi.lh.psc_av_gain = roi_data_me(:,3) - mean([roi_data_me(:,1) roi_data_me(:,2)],2);

mouth_roi.rh.psc_a = roi_data_me(:,8);
mouth_roi.rh.psc_v = roi_data_me(:,9);
mouth_roi.rh.psc_av = roi_data_me(:,10);
mouth_roi.rh.psc_an_sp = roi_data_me(:,11);
mouth_roi.rh.psc_an_np = roi_data_me(:,12);
mouth_roi.rh.psc_avn_sp = roi_data_me(:,13);
mouth_roi.rh.psc_avn_np = roi_data_me(:,14);
mouth_roi.rh.psc_av_gain = roi_data_me(:,10) - mean([roi_data_me(:,8) roi_data_me(:,9)],2);

eyes_roi.lh.psc_a = roi_data_me(:,15);
eyes_roi.lh.psc_v = roi_data_me(:,16);
eyes_roi.lh.psc_av = roi_data_me(:,17);
eyes_roi.lh.psc_an_sp = roi_data_me(:,18);
eyes_roi.lh.psc_an_np = roi_data_me(:,19);
eyes_roi.lh.psc_avn_sp = roi_data_me(:,20);
eyes_roi.lh.psc_avn_np = roi_data_me(:,21);
eyes_roi.lh.psc_av_gain = roi_data_me(:,17) - mean([roi_data_me(:,15) roi_data_me(:,16)],2);

eyes_roi.rh.psc_a = roi_data_me(:,22);
eyes_roi.rh.psc_v = roi_data_me(:,23);
eyes_roi.rh.psc_av = roi_data_me(:,24);
eyes_roi.rh.psc_an_sp = roi_data_me(:,25);
eyes_roi.rh.psc_an_np = roi_data_me(:,26);
eyes_roi.rh.psc_avn_sp = roi_data_me(:,27);
eyes_roi.rh.psc_avn_np = roi_data_me(:,28);
eyes_roi.rh.psc_av_gain = roi_data_me(:,24) - mean([roi_data_me(:,22) roi_data_me(:,23)],2);

load('/Volumes/data/BCM/Experiments/Noisy_Audiovisual_fMRI/ROI_Analysis_AV_ROIs_AN_AVN_SP_NP/ROI_results_AV_A_V_AN_AVN.mat');
roi_data_av = table2array(roi_data_tot);

av_roi.lh.psc_a = roi_data_av(:,1);
av_roi.lh.psc_v = roi_data_av(:,2);
av_roi.lh.psc_av = roi_data_av(:,3);
av_roi.lh.psc_an_sp = roi_data_av(:,4);
av_roi.lh.psc_an_np = roi_data_av(:,5);
av_roi.lh.psc_avn_sp = roi_data_av(:,6);
av_roi.lh.psc_avn_np = roi_data_av(:,7);
av_roi.lh.psc_av_gain = roi_data_av(:,3) - mean([roi_data_av(:,1) roi_data_av(:,2)],2);

av_roi.rh.psc_a = roi_data_av(:,8);
av_roi.rh.psc_v = roi_data_av(:,9);
av_roi.rh.psc_av = roi_data_av(:,10);
av_roi.rh.psc_an_sp = roi_data_av(:,11);
av_roi.rh.psc_an_np = roi_data_av(:,12);
av_roi.rh.psc_avn_sp = roi_data_av(:,13);
av_roi.rh.psc_avn_np = roi_data_av(:,14);
av_roi.rh.psc_av_gain = roi_data_av(:,10) - mean([roi_data_av(:,8) roi_data_av(:,9)],2);

% a_roi.lh.psc_a = roi_data_av(:,15);
% a_roi.lh.psc_v = roi_data_av(:,16);
% a_roi.lh.psc_av = roi_data_av(:,17);
% a_roi.lh.psc_an_sp = roi_data_av(:,18);
% a_roi.lh.psc_an_np = roi_data_av(:,19);
% a_roi.lh.psc_avn_sp = roi_data_av(:,20);
% a_roi.lh.psc_avn_np = roi_data_av(:,21);
% 
% a_roi.rh.psc_a = roi_data_av(:,22);
% a_roi.rh.psc_v = roi_data_av(:,23);
% a_roi.rh.psc_av = roi_data_av(:,24);
% a_roi.rh.psc_an_sp = roi_data_av(:,25);
% a_roi.rh.psc_an_np = roi_data_av(:,26);
% a_roi.rh.psc_avn_sp = roi_data_av(:,27);
% a_roi.rh.psc_avn_np = roi_data_av(:,28);
% 
% v_roi.lh.psc_a = roi_data_av(:,29);
% v_roi.lh.psc_v = roi_data_av(:,30);
% v_roi.lh.psc_av = roi_data_av(:,31);
% v_roi.lh.psc_an_sp = roi_data_av(:,32);
% v_roi.lh.psc_an_np = roi_data_av(:,33);
% v_roi.lh.psc_avn_sp = roi_data_av(:,34);
% v_roi.lh.psc_avn_np = roi_data_av(:,35);
% 
% v_roi.rh.psc_a = roi_data_av(:,36);
% v_roi.rh.psc_v = roi_data_av(:,37);
% v_roi.rh.psc_av = roi_data_av(:,38);
% v_roi.rh.psc_an_sp = roi_data_av(:,39);
% v_roi.rh.psc_an_np = roi_data_av(:,40);
% v_roi.rh.psc_avn_sp = roi_data_av(:,41);
% v_roi.rh.psc_avn_np = roi_data_av(:,42);

load('/Volumes/data/BCM/Experiments/Clear_Syllables_ET/results_et/ROI_Clear_Syllables_Results.mat');
et_clear_syllables_low = table2array(data_sum(:,5));

load('/Volumes/data/BCM/Experiments/Noisy_Audiovisual_fMRI/results/Audiovisual_Noisy_Behav.mat');
avn_se = table2array(data_behav_sum_sub(:,15))+table2array(data_behav_sum_sub(:,16));
av_gain = (table2array(data_behav_sum_sub(:,15))+table2array(data_behav_sum_sub(:,16))) - (table2array(data_behav_sum_sub(:,12))+table2array(data_behav_sum_sub(:,13)));
clearvars -except roi_data_me roi_data_av et_clear_syllables_low avn_se av_gain mouth_roi eyes_roi av_roi a_roi v_roi

% Plot variables
lw = 1.1; % Line Width
bw = 0.8; % Barwidth
fsb = 14; % Font Size big
fsbb = 18; % Font Size small
path = pwd;
rez = 300; % resolution (dpi) of final graphic
ds = 80;
format = '-djpeg'; % image format

% fMRI and behavior/ET
con_fMRI  = {'% signal change A' '% signal change V' '% signal change AV' '% signal change AN-SP' '% signal change AN-NP' '% signal change AVN-SP' '% signal change AVN-NP' '% % signal change AV gain'};

% Mouth ROI
hem = fieldnames(mouth_roi);
con = fieldnames(mouth_roi.lh);

for i = 1:numel(hem)
    
    set(gcf,'Units','centimeters','Position',[10 40 90 35]);

    for j = 1:numel(con)
      
        psc_c = mouth_roi.(hem{i}).(con{j});
        
        reg_avn_se_psc = regstats(avn_se,psc_c);
        reg_avn_se_psc.corr_r = corrcoef(avn_se,psc_c);

        reg_av_gain_psc = regstats(av_gain,psc_c);
        reg_av_gain_psc.corr_r = corrcoef(av_gain,psc_c);

        reg_clear_syllables_psc = regstats(et_clear_syllables_low,psc_c);
        reg_clear_syllables_psc.corr_r = corrcoef(et_clear_syllables_low,psc_c);
        
        subplot(3,numel(con),j)
        scatter(avn_se,psc_c,ds,'filled','o','k');
        
        if min(psc_c) < 0
            y_low = floor(min(psc_c)*10)/10;
        else
            y_low = 0;
        end
        
        if max(psc_c) > 1
            y_up = ceil(max(psc_c)*10)/10;
        else
            y_up = 1;
        end
        
        ylim([y_low,y_up]);
        xlim([0.0,1.0]);

        a = lsline;
        set(a,'LineWidth',1.1,'Color','k');

        p = reg_avn_se_psc.fstat.pval;
        r = reg_avn_se_psc.corr_r(1,2);

        pos = y_up-(y_up*0.15);
        text(0.2,pos+0.08,['\it{r}\rm = ' num2str(r,' %1.3f')],'Fontsize',fsb,'HorizontalAlignment','Center');
        text(0.2,pos,['\it{p}\rm = ' num2str(p,' %1.3f')],'Fontsize',fsb,'HorizontalAlignment','Center');

        xlabel('% Auditory Perception AVN','Fontsize',fsb);
        ylabel(con_fMRI{j},'FontSize',fsb);

        set(gca,'Fontsize',fsb);

        box off

        subplot(3,numel(con),j+numel(con))
        scatter(av_gain,psc_c,ds,'filled','o','k');

        if min(psc_c) < 0
            y_low = floor(min(psc_c)*10)/10;
        else
            y_low = 0;
        end
        
        if max(psc_c) > 1
            y_up = ceil(max(psc_c)*10)/10;
        else
            y_up = 1;
        end
        
        ylim([y_low,y_up]);
        xlim([0.0,1.0]);

        a = lsline;
        set(a,'LineWidth',1.1,'Color','k');

        p = reg_av_gain_psc.fstat.pval;
        r = reg_av_gain_psc.corr_r(1,2);

        pos = y_up-(y_up*0.15);
        text(0.2,pos+0.08,['\it{r}\rm = ' num2str(r,' %1.3f')],'Fontsize',fsb,'HorizontalAlignment','Center');
        text(0.2,pos,['\it{p}\rm = ' num2str(p,' %1.3f')],'Fontsize',fsb,'HorizontalAlignment','Center');

        xlabel('% AV Gain','Fontsize',fsb);
        ylabel(con_fMRI{j},'FontSize',fsb);

        set(gca,'Fontsize',fsb);

        box off
       
        subplot(3,numel(con),j+(numel(con)*2))
        scatter(et_clear_syllables_low,psc_c,ds,'filled','o','k');

        if min(psc_c) < 0
            y_low = floor(min(psc_c)*10)/10;
        else
            y_low = 0;
        end
        
        if max(psc_c) > 1
            y_up = ceil(max(psc_c)*10)/10;
        else
            y_up = 1;
        end
        
        ylim([y_low,y_up]);
        xlim([0.0,1.0]);

        a = lsline;
        set(a,'LineWidth',1.1,'Color','k');

        p = reg_clear_syllables_psc.fstat.pval;
        r = reg_clear_syllables_psc.corr_r(1,2);

        pos = y_up-(y_up*0.15);
        text(0.2,pos+0.08,['\it{r}\rm = ' num2str(r,' %1.3f')],'Fontsize',fsb,'HorizontalAlignment','Center');
        text(0.2,pos,['\it{p}\rm = ' num2str(p,' %1.3f')],'Fontsize',fsb,'HorizontalAlignment','Center');

        xlabel('% Mouth Looking Clear Syllables','Fontsize',fsb);
        ylabel(con_fMRI{j},'FontSize',fsb);

        set(gca,'Fontsize',fsb);

        box off
        
    end
    
    % Save plot
    f = gcf; % f is the handle of the figure you want to export
    name = ['Correlation_fMRI_Mouth_ROI_ET_Behav_SP_NP_' hem{i}];
    set(gcf,'PaperPositionMode','auto')
    print(f,fullfile(path,name),format,['-r',num2str(rez)])
    close all

end

% Eye ROI
hem = fieldnames(eyes_roi);
con = fieldnames(eyes_roi.lh);

for i = 1:numel(hem)
    
    set(gcf,'Units','centimeters','Position',[10 40 90 35]);

    for j = 1:numel(con)
      
        psc_c = eyes_roi.(hem{i}).(con{j});
        
        reg_avn_se_psc = regstats(avn_se,psc_c);
        reg_avn_se_psc.corr_r = corrcoef(avn_se,psc_c);

        reg_av_gain_psc = regstats(av_gain,psc_c);
        reg_av_gain_psc.corr_r = corrcoef(av_gain,psc_c);

        reg_clear_syllables_psc = regstats(et_clear_syllables_low,psc_c);
        reg_clear_syllables_psc.corr_r = corrcoef(et_clear_syllables_low,psc_c);
        
        subplot(3,numel(con),j)
        scatter(avn_se,psc_c,ds,'filled','o','k');
        
        if min(psc_c) < 0
            y_low = floor(min(psc_c)*10)/10;
        else
            y_low = 0;
        end
        
        if max(psc_c) > 1
            y_up = ceil(max(psc_c)*10)/10;
        else
            y_up = 1;
        end
        
        ylim([y_low,y_up]);
        xlim([0.0,1.0]);

        a = lsline;
        set(a,'LineWidth',1.1,'Color','k');

        p = reg_avn_se_psc.fstat.pval;
        r = reg_avn_se_psc.corr_r(1,2);

        pos = y_up-(y_up*0.15);
        text(0.2,pos+0.08,['\it{r}\rm = ' num2str(r,' %1.3f')],'Fontsize',fsb,'HorizontalAlignment','Center');
        text(0.2,pos,['\it{p}\rm = ' num2str(p,' %1.3f')],'Fontsize',fsb,'HorizontalAlignment','Center');

        xlabel('% Auditory Perception AVN','Fontsize',fsb);
        ylabel(con_fMRI{j},'FontSize',fsb);

        set(gca,'Fontsize',fsb);

        box off

        subplot(3,numel(con),j+numel(con))
        scatter(av_gain,psc_c,ds,'filled','o','k');

        if min(psc_c) < 0
            y_low = floor(min(psc_c)*10)/10;
        else
            y_low = 0;
        end
        
        if max(psc_c) > 1
            y_up = ceil(max(psc_c)*10)/10;
        else
            y_up = 1;
        end
        
        ylim([y_low,y_up]);
        xlim([0.0,1.0]);

        a = lsline;
        set(a,'LineWidth',1.1,'Color','k');

        p = reg_av_gain_psc.fstat.pval;
        r = reg_av_gain_psc.corr_r(1,2);

        pos = y_up-(y_up*0.15);
        text(0.2,pos+0.08,['\it{r}\rm = ' num2str(r,' %1.3f')],'Fontsize',fsb,'HorizontalAlignment','Center');
        text(0.2,pos,['\it{p}\rm = ' num2str(p,' %1.3f')],'Fontsize',fsb,'HorizontalAlignment','Center');

        xlabel('% AV Gain','Fontsize',fsb);
        ylabel(con_fMRI{j},'FontSize',fsb);

        set(gca,'Fontsize',fsb);

        box off
       
        subplot(3,numel(con),j+(numel(con)*2))
        scatter(et_clear_syllables_low,psc_c,ds,'filled','o','k');

        if min(psc_c) < 0
            y_low = floor(min(psc_c)*10)/10;
        else
            y_low = 0;
        end
        
        if max(psc_c) > 1
            y_up = ceil(max(psc_c)*10)/10;
        else
            y_up = 1;
        end
        
        ylim([y_low,y_up]);
        xlim([0.0,1.0]);

        a = lsline;
        set(a,'LineWidth',1.1,'Color','k');

        p = reg_clear_syllables_psc.fstat.pval;
        r = reg_clear_syllables_psc.corr_r(1,2);

        pos = y_up-(y_up*0.15);
        text(0.2,pos+0.08,['\it{r}\rm = ' num2str(r,' %1.3f')],'Fontsize',fsb,'HorizontalAlignment','Center');
        text(0.2,pos,['\it{p}\rm = ' num2str(p,' %1.3f')],'Fontsize',fsb,'HorizontalAlignment','Center');

        xlabel('% Mouth Looking Clear Syllables','Fontsize',fsb);
        ylabel(con_fMRI{j},'FontSize',fsb);

        set(gca,'Fontsize',fsb);

        box off
        
    end
    
    % Save plot
    f = gcf; % f is the handle of the figure you want to export
    name = ['Correlation_fMRI_Eye_ROI_ET_Behav_SP_NP_' hem{i}];
    set(gcf,'PaperPositionMode','auto')
    print(f,fullfile(path,name),format,['-r',num2str(rez)])
    close all

end

% AV ROI
hem = fieldnames(av_roi);
con = fieldnames(av_roi.lh);

for i = 1:numel(hem)
    
    set(gcf,'Units','centimeters','Position',[10 40 90 35]);

    for j = 1:numel(con)
      
        psc_c = av_roi.(hem{i}).(con{j});
        
        reg_avn_se_psc = regstats(avn_se,psc_c);
        reg_avn_se_psc.corr_r = corrcoef(avn_se,psc_c);

        reg_av_gain_psc = regstats(av_gain,psc_c);
        reg_av_gain_psc.corr_r = corrcoef(av_gain,psc_c);

        reg_clear_syllables_psc = regstats(et_clear_syllables_low,psc_c);
        reg_clear_syllables_psc.corr_r = corrcoef(et_clear_syllables_low,psc_c);
        
        subplot(3,numel(con),j)
        scatter(avn_se,psc_c,ds,'filled','o','k');
        
        if min(psc_c) < 0
            y_low = floor(min(psc_c)*10)/10;
        else
            y_low = 0;
        end
        
        if max(psc_c) > 1
            y_up = ceil(max(psc_c)*10)/10;
        else
            y_up = 1;
        end
        
        ylim([y_low,y_up]);
        xlim([0.0,1.0]);

        a = lsline;
        set(a,'LineWidth',1.1,'Color','k');

        p = reg_avn_se_psc.fstat.pval;
        r = reg_avn_se_psc.corr_r(1,2);

        pos = y_up-(y_up*0.15);
        text(0.2,pos+0.08,['\it{r}\rm = ' num2str(r,' %1.3f')],'Fontsize',fsb,'HorizontalAlignment','Center');
        text(0.2,pos,['\it{p}\rm = ' num2str(p,' %1.3f')],'Fontsize',fsb,'HorizontalAlignment','Center');

        xlabel('% Auditory Perception AVN','Fontsize',fsb);
        ylabel(con_fMRI{j},'FontSize',fsb);

        set(gca,'Fontsize',fsb);

        box off

        subplot(3,numel(con),j+numel(con))
        scatter(av_gain,psc_c,ds,'filled','o','k');

        if min(psc_c) < 0
            y_low = floor(min(psc_c)*10)/10;
        else
            y_low = 0;
        end
        
        if max(psc_c) > 1
            y_up = ceil(max(psc_c)*10)/10;
        else
            y_up = 1;
        end
        
        ylim([y_low,y_up]);
        xlim([0.0,1.0]);

        a = lsline;
        set(a,'LineWidth',1.1,'Color','k');

        p = reg_av_gain_psc.fstat.pval;
        r = reg_av_gain_psc.corr_r(1,2);

        pos = y_up-(y_up*0.15);
        text(0.2,pos+0.08,['\it{r}\rm = ' num2str(r,' %1.3f')],'Fontsize',fsb,'HorizontalAlignment','Center');
        text(0.2,pos,['\it{p}\rm = ' num2str(p,' %1.3f')],'Fontsize',fsb,'HorizontalAlignment','Center');

        xlabel('% AV Gain','Fontsize',fsb);
        ylabel(con_fMRI{j},'FontSize',fsb);

        set(gca,'Fontsize',fsb);

        box off
       
        subplot(3,numel(con),j+(numel(con)*2))
        scatter(et_clear_syllables_low,psc_c,ds,'filled','o','k');

        if min(psc_c) < 0
            y_low = floor(min(psc_c)*10)/10;
        else
            y_low = 0;
        end
        
        if max(psc_c) > 1
            y_up = ceil(max(psc_c)*10)/10;
        else
            y_up = 1;
        end
        
        ylim([y_low,y_up]);
        xlim([0.0,1.0]);

        a = lsline;
        set(a,'LineWidth',1.1,'Color','k');

        p = reg_clear_syllables_psc.fstat.pval;
        r = reg_clear_syllables_psc.corr_r(1,2);

        pos = y_up-(y_up*0.15);
        text(0.2,pos+0.08,['\it{r}\rm = ' num2str(r,' %1.3f')],'Fontsize',fsb,'HorizontalAlignment','Center');
        text(0.2,pos,['\it{p}\rm = ' num2str(p,' %1.3f')],'Fontsize',fsb,'HorizontalAlignment','Center');

        xlabel('% Mouth Looking Clear Syllables','Fontsize',fsb);
        ylabel(con_fMRI{j},'FontSize',fsb);

        set(gca,'Fontsize',fsb);

        box off
        
    end
    
    % Save plot
    f = gcf; % f is the handle of the figure you want to export
    name = ['Correlation_fMRI_AV_ROI_ET_Behav_SP_NP_' hem{i}];
    set(gcf,'PaperPositionMode','auto')
    print(f,fullfile(path,name),format,['-r',num2str(rez)])
    close all

end
