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

con_fMRI  = {'% signal change A' '% signal change V' '% signal change AV' '% signal change AN' '% signal change AVN'};

%% Mouth ROI
hem = fieldnames(mouth_roi);
con = fieldnames(mouth_roi.lh);

for i = 1:numel(hem)
    
    set(gcf,'Units','centimeters','Position',[10 40 60 35]);

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
    name = ['Correlation_fMRI_Mouth_ROI_ET_Behav_' hem{i}];
    set(gcf,'PaperPositionMode','auto')
    print(f,fullfile(path,name),format,['-r',num2str(rez)])
    close all

end

%% Eyes ROI
hem = fieldnames(eyes_roi);
con = fieldnames(eyes_roi.lh);

for i = 1:numel(hem)
    
    set(gcf,'Units','centimeters','Position',[10 40 60 35]);

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
    name = ['Correlation_fMRI_Eyes_ROI_ET_Behav_' hem{i}];
    set(gcf,'PaperPositionMode','auto')
    print(f,fullfile(path,name),format,['-r',num2str(rez)])
    close all

end
