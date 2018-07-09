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

mouth_roi_l_mean = mean(mouth_roi_l);
mouth_roi_r_mean = mean(mouth_roi_r);
eyes_roi_l_mean = mean(eyes_roi_l);
eyes_roi_r_mean = mean(eyes_roi_r);

mouth_roi_l_sem = std(mouth_roi_l)/sqrt(size(mouth_roi_l,1));
mouth_roi_r_sem = std(mouth_roi_r)/sqrt(size(mouth_roi_r,1));
eyes_roi_l_sem = std(eyes_roi_l)/sqrt(size(eyes_roi_l,1));
eyes_roi_r_sem = std(eyes_roi_r)/sqrt(size(eyes_roi_r,1));

av_roi_l_mean = mean(av_roi_l);
av_roi_r_mean = mean(av_roi_r);
a_roi_l_mean = mean(a_roi_l);
a_roi_r_mean = mean(a_roi_r);
v_roi_l_mean = mean(v_roi_l);
v_roi_r_mean = mean(v_roi_r);

av_roi_l_sem = std(av_roi_l)/sqrt(size(av_roi_l,1));
av_roi_r_sem = std(av_roi_r)/sqrt(size(av_roi_r,1));
a_roi_l_sem = std(a_roi_l)/sqrt(size(a_roi_l,1));
a_roi_r_sem = std(a_roi_r)/sqrt(size(a_roi_r,1));
v_roi_l_sem = std(v_roi_l)/sqrt(size(v_roi_l,1));
v_roi_r_sem = std(v_roi_r)/sqrt(size(v_roi_r,1));

%% Plot fMRI from mouth/eye STS ROIs
subplot(2,2,1);
data = mouth_roi_l_mean;
sem = mouth_roi_l_sem;

bar(data,bw,'Edgecolor','none','FaceColor','r');
hold on
errorbar(data,sem,'LineStyle','none','Color','k','LineWidth',1);

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

title('Mouth ROI L','Fontsize',fsb);

box off

subplot(2,2,2);
data = mouth_roi_r_mean;
sem = mouth_roi_r_sem;

bar(data,bw,'Edgecolor','none','FaceColor','r');
hold on
errorbar(data,sem,'LineStyle','none','Color','k','LineWidth',1);

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

title('Mouth ROI R','Fontsize',fsb);

box off

subplot(2,2,3);
data = eyes_roi_l_mean;
sem = eyes_roi_l_sem;

bar(data,bw,'Edgecolor','none','FaceColor','b');
hold on
errorbar(data,sem,'LineStyle','none','Color','k','LineWidth',1);

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

title('Eyes ROI L','Fontsize',fsb);

box off

subplot(2,2,4);
data = eyes_roi_r_mean;
sem = eyes_roi_r_sem;

bar(data,bw,'Edgecolor','none','FaceColor','b');
hold on
errorbar(data,sem,'LineStyle','none','Color','k','LineWidth',1);

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

title('Eyes ROI R','Fontsize',fsb);

box off

% Save plot
f = gcf; % f is the handle of the figure you want to export
name = 'PSC_Mouth_Eye_ROIs';
set(gcf,'PaperPositionMode','auto');
print(f,fullfile(path,name),format,['-r',num2str(rez)])

close all

%% Plot fMRI from AV, A, V STS ROIs
con_me = {'Mouth' 'Eyes'};
set(gcf,'Units','centimeters','Position',[10 30 30 20]);

subplot(2,3,1);
data = av_roi_l_mean;
sem = av_roi_l_sem;

bar(data,bw,'Edgecolor','none','FaceColor','r');
hold on
bar(1,data(1),'FaceColor','r','Edgecolor','none');
hold on
bar(2,data(2),'FaceColor','b','Edgecolor','none');
hold on
errorbar(data,sem,'LineStyle','none','Color','k','LineWidth',1);

set(gca,'xticklabel',[]);

x_tick_label = con_me;
set(gca,'xticklabel',x_tick_label,'Fontsize',fsb);

set(gca,'ytick',[]);
set(gca,'yticklabel',[]);

y_tick = [0 0.2 0.4 0.6 0.8 1.0];
set(gca,'ytick',y_tick);
set(gca,'yticklabel',y_tick,'Fontsize',fsb);
ylabel('% signal change','Fontsize',fsb);
ylim([0,1]);

title('AV ROI L','Fontsize',fsb);

box off

subplot(2,3,2);
data = a_roi_l_mean;
sem = a_roi_l_sem;

bar(data,bw,'Edgecolor','none','FaceColor','r');
hold on
bar(1,data(1),'FaceColor','r','Edgecolor','none');
hold on
bar(2,data(2),'FaceColor','b','Edgecolor','none');
hold on
errorbar(data,sem,'LineStyle','none','Color','k','LineWidth',1);

set(gca,'xticklabel',[]);

x_tick_label = con_me;
set(gca,'xticklabel',x_tick_label,'Fontsize',fsb);

set(gca,'ytick',[]);
set(gca,'yticklabel',[]);

y_tick = [0 0.2 0.4 0.6 0.8 1.0];
set(gca,'ytick',y_tick);
set(gca,'yticklabel',y_tick,'Fontsize',fsb);
ylabel('% signal change','Fontsize',fsb);
ylim([0,1]);

title('A ROI L','Fontsize',fsb);

box off

subplot(2,3,3);
data = v_roi_l_mean;
sem = v_roi_l_sem;

bar(data,bw,'Edgecolor','none','FaceColor','r');
hold on
bar(1,data(1),'FaceColor','r','Edgecolor','none');
hold on
bar(2,data(2),'FaceColor','b','Edgecolor','none');
hold on
errorbar(data,sem,'LineStyle','none','Color','k','LineWidth',1);

set(gca,'xticklabel',[]);

x_tick_label = con_me;
set(gca,'xticklabel',x_tick_label,'Fontsize',fsb);

set(gca,'ytick',[]);
set(gca,'yticklabel',[]);

y_tick = [0 0.2 0.4 0.6 0.8 1.0];
set(gca,'ytick',y_tick);
set(gca,'yticklabel',y_tick,'Fontsize',fsb);
ylabel('% signal change','Fontsize',fsb);
ylim([0,1]);

title('V ROI L','Fontsize',fsb);

box off

subplot(2,3,4);
data = av_roi_r_mean;
sem = av_roi_r_sem;

bar(data,bw,'Edgecolor','none','FaceColor','r');
hold on
bar(1,data(1),'FaceColor','r','Edgecolor','none');
hold on
bar(2,data(2),'FaceColor','b','Edgecolor','none');
hold on
errorbar(data,sem,'LineStyle','none','Color','k','LineWidth',1);

set(gca,'xticklabel',[]);

x_tick_label = con_me;
set(gca,'xticklabel',x_tick_label,'Fontsize',fsb);

set(gca,'ytick',[]);
set(gca,'yticklabel',[]);

y_tick = [0 0.2 0.4 0.6 0.8 1.0];
set(gca,'ytick',y_tick);
set(gca,'yticklabel',y_tick,'Fontsize',fsb);
ylabel('% signal change','Fontsize',fsb);
ylim([0,1]);

title('AV ROI R','Fontsize',fsb);

box off

subplot(2,3,5);
data = a_roi_r_mean;
sem = a_roi_r_sem;

bar(data,bw,'Edgecolor','none','FaceColor','r');
hold on
bar(1,data(1),'FaceColor','r','Edgecolor','none');
hold on
bar(2,data(2),'FaceColor','b','Edgecolor','none');
hold on
errorbar(data,sem,'LineStyle','none','Color','k','LineWidth',1);

set(gca,'xticklabel',[]);

x_tick_label = con_me;
set(gca,'xticklabel',x_tick_label,'Fontsize',fsb);

set(gca,'ytick',[]);
set(gca,'yticklabel',[]);

y_tick = [0 0.2 0.4 0.6 0.8 1.0];
set(gca,'ytick',y_tick);
set(gca,'yticklabel',y_tick,'Fontsize',fsb);
ylabel('% signal change','Fontsize',fsb);
ylim([0,1]);

title('A ROI R','Fontsize',fsb);

box off

subplot(2,3,6);
data = v_roi_r_mean;
sem = v_roi_r_sem;

bar(data,bw,'Edgecolor','none','FaceColor','r');
hold on
bar(1,data(1),'FaceColor','r','Edgecolor','none');
hold on
bar(2,data(2),'FaceColor','b','Edgecolor','none');
hold on
errorbar(data,sem,'LineStyle','none','Color','k','LineWidth',1);

set(gca,'xticklabel',[]);

x_tick_label = con_me;
set(gca,'xticklabel',x_tick_label,'Fontsize',fsb);

set(gca,'ytick',[]);
set(gca,'yticklabel',[]);

y_tick = [0 0.2 0.4 0.6 0.8 1.0];
set(gca,'ytick',y_tick);
set(gca,'yticklabel',y_tick,'Fontsize',fsb);
ylabel('% signal change','Fontsize',fsb);
ylim([0,1]);

title('V ROI R','Fontsize',fsb);

box off

% Save plot
f = gcf; % f is the handle of the figure you want to export
name = 'PSC_AV_A_V_ROIs';
set(gcf,'PaperPositionMode','auto');
print(f,fullfile(path,name),format,['-r',num2str(rez)])

close all

%% Correlation of mouth and eye responses from AV ROIs with behavior
av_roi.lh.psc_m = av_roi_l(:,1);
av_roi.lh.psc_e = av_roi_l(:,2);
av_roi.rh.psc_m = av_roi_r(:,1);
av_roi.rh.psc_e = av_roi_r(:,2);

hem = fieldnames(av_roi);
con = fieldnames(av_roi.lh);
con_me = {'% Signal Change Mouth' '% Signal Change Eyes'};

for i = 1:numel(hem)
    
    set(gcf,'Units','centimeters','Position',[10 40 30 35]);

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
    name = ['Correlation_fMRI_AV_ROI_Mouth_Eye_Resp_ET_Behav_' hem{i}];
    set(gcf,'PaperPositionMode','auto')
    print(f,fullfile(path,name),format,['-r',num2str(rez)])
    close all

end

%% RSA
set(gcf,'Units','centimeters','Position',[10 30 55 20]);
tick_label = {'M-A','M-V','M-AV','M-AN', 'M-AVN', 'E-A','E-V','E-AV','E-AN', 'E-AVN'};

min_tot = min(min([corr_r_l corr_r_r]));
thresh = floor(min_tot*10)/10;

subplot(1,2,1);
imagesc(corr_r_l);
caxis([thresh 1]);
colormap(jet);
colorbar;

set(gca,'xtick',1:size(corr_r_l,1));
set(gca,'ytick',1:size(corr_r_l,1));

set(gca,'xticklabel',tick_label,'Fontsize',fsb);
set(gca,'yticklabel',tick_label,'Fontsize',fsb);

title('Left hemisphere','Fontsize',fsb);

subplot(1,2,2);
imagesc(corr_r_r);
caxis([thresh 1]);
colormap(jet);
colorbar;

set(gca,'xtick',1:size(corr_r_r,1));
set(gca,'ytick',1:size(corr_r_r,1));

set(gca,'xticklabel',tick_label,'Fontsize',fsb);
set(gca,'yticklabel',tick_label,'Fontsize',fsb);

title('Right hemisphere','Fontsize',fsb);

% Save plot
f = gcf; % f is the handle of the figure you want to export
name = 'RSA_over_subjects_Mouth_Eye_ROIs';
set(gcf,'PaperPositionMode','auto');
print(f,fullfile(path,name),format,['-r',num2str(rez)])

close all
