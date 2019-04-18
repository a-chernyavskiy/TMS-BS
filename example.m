%Example of ComputeBS usage

%Loading the cell of maps
load('mappings.mat');
x = 50:10:150;

%Computing bootstrap
[nSDs, nBiases, distribs] = computeBS(mappings, @sampleParameter, x, 50);


%Plotting the results
paramname = 'Sample parameter';

subplot(2,2,1);
plotMeanStd(x, nSDs,'Red');
title([paramname char(13) ' (normalized SD)']);
xlabel('Number of stimuli');
ylabel('nSD (mean \pm sd)');

subplot(2,2,2);
plotMeanStd(x, nBiases,'Blue');
title([paramname ' (normalized bias)']);
xlabel('Number of stimuli');
ylabel('Normalized bias (mean \pm sd)');

subplot(2,2,3);
plot(x, nSDs');
xlabel('Number of stimuli');
ylabel('nSD');

subplot(2,2,4);
plot(x, nBiases');
xlabel('Number of stimuli');
ylabel('Normalized bias');