clc
close all
%clear all

% Plot variables
lw = 1.1; % Line Width
bw = 0.8; % Barwidth
fsb = 16; % Font Size big
fsbb = 18; % Font Size small
path = pwd;
rez = 600; % resolution (dpi) of final graphic
ds = 80;
format = '-djpeg'; % image format

load('/Volumes/data/BCM/Experiments/Noisy_Audiovisual_fMRI/ROI_Analysis_Clear_Noisy_A/ROI_results_Clear_Noisy_A.mat');
roi_data_tot_a = table2array(roi_data_tot);

load('/Volumes/data/BCM/Experiments/Noisy_Audiovisual_fMRI/ROI_Analysis_Clear_Noisy_AV/ROI_results_Clear_Noisy_AV.mat');
roi_data_tot_av = table2array(roi_data_tot);

load('/Volumes/data/BCM/Experiments/Noisy_Audiovisual_fMRI/ROI_Analysis_Clear_Noisy_A_AV/ROI_results_Clear_Noisy_A_AV.mat');
roi_data_tot_a_av = table2array(roi_data_tot);
clear roi_data_tot

roi.a.lh.clear = roi_data_tot_a(:,1:7);
roi.a.rh.clear = roi_data_tot_a(:,8:14);
roi.a.lh.noise = roi_data_tot_a(:,15:21);
roi.a.rh.noise = roi_data_tot_a(:,22:28);

roi.av.lh.clear = roi_data_tot_av(:,1:7);
roi.av.rh.clear = roi_data_tot_av(:,8:14);
roi.av.lh.noise = roi_data_tot_av(:,15:21);
roi.av.rh.noise = roi_data_tot_av(:,22:28);

roi.a_av.lh.clear = roi_data_tot_a_av(:,1:7);
roi.a_av.rh.clear = roi_data_tot_a_av(:,8:14);
roi.a_av.lh.noise = roi_data_tot_a_av(:,15:21);
roi.a_av.rh.noise = roi_data_tot_a_av(:,22:28);

rois = fieldnames(roi);
hem = fieldnames(roi.a);
con = fieldnames(roi.a.lh);

con_fMRI = {'A' 'V' 'AV' 'AN' 'AVN' 'Mouth' 'Eye'};
roi_type = {'A' 'AV' 'A-AV'};

for i = 1:numel(rois)
    
    data_roi = roi.(rois{i});
    
    for j = 1:numel(hem)
        
        data_hem = roi.(rois{i}).(hem{j});
        
        mean_clear = nanmean(data_hem.clear);
        sem_clear = nanstd(data_hem.clear)/size(data_hem.clear,1);
        mean_noise = nanmean(data_hem.noise);
        sem_noise = nanstd(data_hem.noise)/size(data_hem.noise,1);
        
        set(gcf,'Units','centimeters','Position',[10 30 40 20]);

        subplot(2,numel(hem),j)
        bar(mean_clear,bw,'Edgecolor','none','FaceColor','b');
        hold on
        errorbar(mean_clear,sem_clear,'LineStyle','none','Color','k','LineWidth',1);

        set(gca,'xticklabel',[]);

        x_tick_label = con_fMRI;
        set(gca,'xticklabel',x_tick_label,'Fontsize',fsb);

        set(gca,'ytick',[]);
        set(gca,'yticklabel',[]);

        y_tick = [0 0.2 0.4 0.6 0.8 1.0];
        set(gca,'ytick',y_tick);
        set(gca,'yticklabel',y_tick,'Fontsize',fsb);
        ylabel('% signal change','Fontsize',fsb);
        ylim([0,1]);

        title([roi_type{i} ' Clear ROI ' hem{j}],'Fontsize',fsb);
        
        subplot(2,numel(hem),j+2)
        bar(mean_noise,bw,'Edgecolor','none','FaceColor','b');
        hold on
        errorbar(mean_noise,sem_noise,'LineStyle','none','Color','k','LineWidth',1);

        set(gca,'xticklabel',[]);

        x_tick_label = con_fMRI;
        set(gca,'xticklabel',x_tick_label,'Fontsize',fsb);

        set(gca,'ytick',[]);
        set(gca,'yticklabel',[]);

        y_tick = [0 0.2 0.4 0.6 0.8 1.0];
        set(gca,'ytick',y_tick);
        set(gca,'yticklabel',y_tick,'Fontsize',fsb);
        ylabel('% signal change','Fontsize',fsb);
        ylim([0,1]);

        title([roi_type{i} ' Noise ROI ' hem{j}],'Fontsize',fsb);
        
    end
    
    % Save plot
    f = gcf; % f is the handle of the figure you want to export
    name = ['Clear_Noise_fMRI_' roi_type{i}];
    set(gcf,'PaperPositionMode','auto')
    print(f,fullfile(path,name),format,['-r',num2str(rez)])
    close all
    
end
