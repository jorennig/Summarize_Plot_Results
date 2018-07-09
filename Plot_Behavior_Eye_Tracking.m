clc
close all

% Plot variables
lw = 1.1; % Line Width
bw = 0.8; % Barwidth
fsb = 16; % Font Size big
fsbb = 18; % Font Size small
path = pwd;
rez = 600; % resolution (dpi) of final graphic
ds = 80;
format = '-djpeg'; % image format

% Correlation ET Clear Syllables
clear behav_et
data_c = et_clear_syllables_low;
%behav_et.et_clear_syllables_low = et_clear_syllables_low;
behav_et.et_av_noisy_low = et_av_noisy_low;
behav_et.et_mouth_eye_low = et_mouth_eye_low;
behav_et.avn_se = avn_se;
behav_et.av_gain = av_gain;

bet = fieldnames(behav_et);

set(gcf,'Units','centimeters','Position',[10 30 70 20]);
titles = {'% Mouth Looking AV Noisy' '% Mouth Looking Mouth Eye' '% Auditory Perception Noisy AV' '% AV Gain'};
title_c = {'% Mouth Looking Clear Syllables'};

for i = 1:numel(bet)
    
    subplot(1,numel(bet),i)
    scatter(data_c,behav_et.(bet{i}),ds,'filled','o','k');
    ylim([0.0,1.0]);
    xlim([0.0,1.0]);

    a = lsline;
    set(a,'LineWidth',1.1,'Color','k');

    stat = regstats(data_c,behav_et.(bet{i}),'linear');
    corr_r = corrcoef(data_c,behav_et.(bet{i}));
    p = stat.fstat.pval;
    r = corr_r(1,2);
    
    pos = 0.1;
    text(0.9,pos+0.05,['\it{r}\rm = ' num2str(r,' %1.3f')],'Fontsize',fsb,'HorizontalAlignment','Center');
    text(0.9,pos,['\it{p}\rm = ' num2str(p,' %1.3f')],'Fontsize',fsb,'HorizontalAlignment','Center');
    
    xlabel(title_c,'Fontsize',fsb);
    ylabel(titles{i},'FontSize',fsb);

    set(gca,'Fontsize',fsb);
    
    box off
    
end

% Save plot
f = gcf; % f is the handle of the figure you want to export
name = 'Correlation_ET_Clear_Syllables';
set(gcf,'PaperPositionMode','auto')
print(f,fullfile(path,name),format,['-r',num2str(rez)])
close all

% Correlation ET AV Noisy
clear behav_et
data_c = et_av_noisy_low;
behav_et.et_clear_syllables_low = et_clear_syllables_low;
%behav_et.et_av_noisy_low = et_av_noisy_low;
behav_et.et_mouth_eye_low = et_mouth_eye_low;
behav_et.avn_se = avn_se;
behav_et.av_gain = av_gain;

bet = fieldnames(behav_et);

set(gcf,'Units','centimeters','Position',[10 30 70 20]);
titles = {'% Mouth Looking Clear Syllables' '% Mouth Looking Mouth Eye' '% Auditory Perception Noisy AV' '% AV Gain'};
title_c = {'% Mouth Looking AV Noisy'};

for i = 1:numel(bet)
    
    subplot(1,numel(bet),i)
    scatter(data_c,behav_et.(bet{i}),ds,'filled','o','k');
    ylim([0.0,1.0]);
    xlim([0.0,1.0]);

    a = lsline;
    set(a,'LineWidth',1.1,'Color','k');

    stat = regstats(data_c,behav_et.(bet{i}),'linear');
    corr_r = corrcoef(data_c,behav_et.(bet{i}));
    p = stat.fstat.pval;
    r = corr_r(1,2);
    
    pos = 0.1;
    text(0.9,pos+0.05,['\it{r}\rm = ' num2str(r,' %1.3f')],'Fontsize',fsb,'HorizontalAlignment','Center');
    text(0.9,pos,['\it{p}\rm = ' num2str(p,' %1.3f')],'Fontsize',fsb,'HorizontalAlignment','Center');
    
    xlabel(title_c,'Fontsize',fsb);
    ylabel(titles{i},'FontSize',fsb);

    set(gca,'Fontsize',fsb);
    
    box off
    
end

% Save plot
f = gcf; % f is the handle of the figure you want to export
name = 'Correlation_ET_AV Noisy';
set(gcf,'PaperPositionMode','auto')
print(f,fullfile(path,name),format,['-r',num2str(rez)])
close all

% Correlation ET Mouth Eye
clear behav_et
data_c = et_mouth_eye_low;
behav_et.et_clear_syllables_low = et_clear_syllables_low;
behav_et.et_av_noisy_low = et_av_noisy_low;
%behav_et.et_mouth_eye_low = et_mouth_eye_low;
behav_et.avn_se = avn_se;
behav_et.av_gain = av_gain;

bet = fieldnames(behav_et);

set(gcf,'Units','centimeters','Position',[10 30 70 20]);
titles = {'% Mouth Looking Clear Syllables' '% Mouth Looking AV Noisy' '% Auditory Perception Noisy AV' '% AV Gain'};
title_c = {'% Mouth Looking Mouth Eye'};

for i = 1:numel(bet)
    
    subplot(1,numel(bet),i)
    scatter(data_c,behav_et.(bet{i}),ds,'filled','o','k');
    ylim([0.0,1.0]);
    xlim([0.0,1.0]);

    a = lsline;
    set(a,'LineWidth',1.1,'Color','k');

    stat = regstats(data_c,behav_et.(bet{i}),'linear');
    corr_r = corrcoef(data_c,behav_et.(bet{i}));
    p = stat.fstat.pval;
    r = corr_r(1,2);
    
    pos = 0.1;
    text(0.9,pos+0.05,['\it{r}\rm = ' num2str(r,' %1.3f')],'Fontsize',fsb,'HorizontalAlignment','Center');
    text(0.9,pos,['\it{p}\rm = ' num2str(p,' %1.3f')],'Fontsize',fsb,'HorizontalAlignment','Center');
    
    xlabel(title_c,'Fontsize',fsb);
    ylabel(titles{i},'FontSize',fsb);

    set(gca,'Fontsize',fsb);
    
    box off
    
end

% Save plot
f = gcf; % f is the handle of the figure you want to export
name = 'Correlation_ET_Mouth_Eye';
set(gcf,'PaperPositionMode','auto')
print(f,fullfile(path,name),format,['-r',num2str(rez)])
close all

% Correlation Auditory Perception AVN
clear behav_et
data_c = avn_se;
behav_et.et_clear_syllables_low = et_clear_syllables_low;
behav_et.et_av_noisy_low = et_av_noisy_low;
behav_et.et_mouth_eye_low = et_mouth_eye_low;
%behav_et.avn_se = avn_se;
behav_et.av_gain = av_gain;

bet = fieldnames(behav_et);

set(gcf,'Units','centimeters','Position',[10 30 70 20]);
titles = {'% Mouth Looking Clear Syllables' '% Mouth Looking AV Noisy' '% Mouth Looking Mouth Eye' '% AV Gain'};
title_c = {'% Auditory Perception Noisy AV'};

for i = 1:numel(bet)
    
    subplot(1,numel(bet),i)
    scatter(data_c,behav_et.(bet{i}),ds,'filled','o','k');
    ylim([0.0,1.0]);
    xlim([0.0,1.0]);

    a = lsline;
    set(a,'LineWidth',1.1,'Color','k');

    stat = regstats(data_c,behav_et.(bet{i}),'linear');
    corr_r = corrcoef(data_c,behav_et.(bet{i}));
    p = stat.fstat.pval;
    r = corr_r(1,2);
    
    pos = 0.1;
    text(0.9,pos+0.05,['\it{r}\rm = ' num2str(r,' %1.3f')],'Fontsize',fsb,'HorizontalAlignment','Center');
    text(0.9,pos,['\it{p}\rm = ' num2str(p,' %1.3f')],'Fontsize',fsb,'HorizontalAlignment','Center');
    
    xlabel(title_c,'Fontsize',fsb);
    ylabel(titles{i},'FontSize',fsb);

    set(gca,'Fontsize',fsb);
    
    box off
    
end

% Save plot
f = gcf; % f is the handle of the figure you want to export
name = 'Correlation_Auditory_Perception_Noisy_AV';
set(gcf,'PaperPositionMode','auto')
print(f,fullfile(path,name),format,['-r',num2str(rez)])
close all

% Correlation AV Gain
clear behav_et
data_c = av_gain;
behav_et.et_clear_syllables_low = et_clear_syllables_low;
behav_et.et_av_noisy_low = et_av_noisy_low;
behav_et.et_mouth_eye_low = et_mouth_eye_low;
behav_et.avn_se = avn_se;
%behav_et.av_gain = av_gain;

bet = fieldnames(behav_et);

set(gcf,'Units','centimeters','Position',[10 30 70 20]);
titles = {'% Mouth Looking Clear Syllables' '% Mouth Looking AV Noisy' '% Mouth Looking Mouth Eye' '% Auditory Perception Noisy AV'};
title_c = {'% AV Gain'};

for i = 1:numel(bet)
    
    subplot(1,numel(bet),i)
    scatter(data_c,behav_et.(bet{i}),ds,'filled','o','k');
    ylim([0.0,1.0]);
    xlim([0.0,1.0]);

    a = lsline;
    set(a,'LineWidth',1.1,'Color','k');

    stat = regstats(data_c,behav_et.(bet{i}),'linear');
    corr_r = corrcoef(data_c,behav_et.(bet{i}));
    p = stat.fstat.pval;
    r = corr_r(1,2);
    
    pos = 0.1;
    text(0.9,pos+0.05,['\it{r}\rm = ' num2str(r,' %1.3f')],'Fontsize',fsb,'HorizontalAlignment','Center');
    text(0.9,pos,['\it{p}\rm = ' num2str(p,' %1.3f')],'Fontsize',fsb,'HorizontalAlignment','Center');
    
    xlabel(title_c,'Fontsize',fsb);
    ylabel(titles{i},'FontSize',fsb);

    set(gca,'Fontsize',fsb);
    
    box off
    
end

% Save plot
f = gcf; % f is the handle of the figure you want to export
name = 'Correlation_AV_Gain';
set(gcf,'PaperPositionMode','auto')
print(f,fullfile(path,name),format,['-r',num2str(rez)])
close all
