function plotMeanStd(x, data, color)
%PLOTMEANSTD Plots mean and mean \pm std of the data with painted inner area

plot(x,mean(data),color,'LineWidth',1);

hold on;
plot(x,mean(data)+std(data),color,'LineStyle','--');
plot(x,mean(data)-std(data),color,'LineStyle','--');

x2 = [x, fliplr(x)];
inBetween = [mean(data)-std(data), fliplr(mean(data)+std(data))];
h = fill(x2, inBetween, color);
set(h,'facealpha',.05);
set(h,'edgecolor','none');
xlim([min(x),max(x)]);

end

