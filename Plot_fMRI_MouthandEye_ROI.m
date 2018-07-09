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

%% Correlation of all responses from mouth and eye ROIs with behavior

hem = fieldnames(mouth_eye_roi);
con = fieldnames(mouth_eye_roi.lh);
con_me = {'% Signal Change A' '% Signal Change V' '% Signal Change AV' '% Signal Change AN' '% Signal Change AVN' '% Signal Change Mouth' '% Signal Change Eyes'};

for i = 1:numel(hem)
    
    set(gcf,'Units','centimeters','Position',[5 40 100 70]);

    for j = 1:numel(con)
      
        psc_c = mouth_eye_roi.(hem{i}).(con{j});
        
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
        ylabel(con_me{j},'FontSize',fsb);

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
        ylabel(con_me{j},'FontSize',fsb);

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
        ylabel(con_me{j},'FontSize',fsb);

        set(gca,'Fontsize',fsb);

        box off
        
    end
    
    % Save plot
    f = gcf; % f is the handle of the figure you want to export
    name = ['Correlation_fMRI_MouthAndEye_ROI_ET_Behav_' hem{i}];
    set(gcf,'PaperPositionMode','auto')
    print(f,fullfile(path,name),format,['-r',num2str(rez)])
    close all

end

%% Correlation of all mouth and eye from mouth and eye ROIs with behavior
mouth_eye_roi_n = mouth_eye_roi;

fields = {'psc_a','psc_v','psc_av','psc_an','psc_avn'};
mouth_eye_roi_n.lh = rmfield(mouth_eye_roi_n.lh,fields);
mouth_eye_roi_n.rh = rmfield(mouth_eye_roi_n.rh,fields);

hem = fieldnames(mouth_eye_roi_n);
con = fieldnames(mouth_eye_roi_n.lh);
con_me = {'% Signal Change Mouth' '% Signal Change Eyes'};

for i = 1:numel(hem)
    
    set(gcf,'Units','centimeters','Position',[10 40 30 35]);

    for j = 1:numel(con)
      
        psc_c = mouth_eye_roi_n.(hem{i}).(con{j});
        
        reg_avn_se_psc = regstats(avn_se,psc_c);
        reg_avn_se_psc.corr_r = corrcoef(avn_se,psc_c);

        reg_av_gain_psc = regstats(av_gain,psc_c);
        reg_av_gain_psc.corr_r = corrcoef(av_gain,psc_c);

        reg_clear_syllables_psc = regstats(et_clear_syllables_low,psc_c);
        reg_clear_syllables_psc.corr_r = corrcoef(et_clear_syllables_low,psc_c);
        
        subplot(3,2,j)
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
        ylabel(con_me{j},'FontSize',fsb);

        set(gca,'Fontsize',fsb);

        box off

        subplot(3,2,j+numel(con))
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
        ylabel(con_me{j},'FontSize',fsb);

        set(gca,'Fontsize',fsb);

        box off
       
        subplot(3,2,j+(numel(con)*2))
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
        ylabel(con_me{j},'FontSize',fsb);

        set(gca,'Fontsize',fsb);

        box off
        
    end
    
    % Save plot
    f = gcf; % f is the handle of the figure you want to export
    name = ['Correlation_fMRI_MouthAndEye_ROI_Mouth_Eye_Resp_ET_Behav_' hem{i}];
    set(gcf,'PaperPositionMode','auto')
    print(f,fullfile(path,name),format,['-r',num2str(rez)])
    close all

end
