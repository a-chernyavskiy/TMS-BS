function [nSDs, nBiases, distribs] = computeBS(mappings, procfunction, nstimuli, nsample)
%COMPUTEBS Computes the distributions and accuracy parameters
%of procfunction TMS-mapping parameter by statistical bootstrapping 

%  BSCOMPUTE computes the bootstrap distributions of procfunction values
%  for the set of maps and for different numbers of stimuli in reduced maps.
%
%  Input arguments:
%  mappings -  the cell array containing maps to analyze
%       each map must be an array of the format [x1,y1,z1,amp1; x2,y2,z2,amp2; ...]
%  nstimuli – vector of numbers of stimuli to analyze 
%  nsample - number of samples in bootstrap distribution.
%
%  Output arguments:
%  nSDs – 2D-array of values of normalized SD accuracy parameter 
%     (first array dimension corresponds to mapping, 
%     and the second one corresponds to the number of stimuli)
%  nBiases – 2D-array of values of the normalized bias accuracy parameter 
%     (first array dimension corresponds to mapping, 
%     and the second one corresponds to the number of stimuli)
%  distribs – 3D-array of bootstrapped distributions of procfunc  number of stimuli 
%     (first array dimension corresponds to mapping, 
%     the second one corresponds to the number of stimuli, 
%     and the third one corresponds to the index in distribution)

    nmaps = length(mappings);
    nsteps = length(nstimuli);
    nSDs = zeros(nmaps, nsteps);
    nBiases = zeros(nmaps, nsteps);
    distribs = zeros(nmaps, nsteps, nsample);
    f = waitbar(0, 'Bootstrapping: 0 complete');
    for j = 1:nmaps        
        [nsd, nb, dist] = bscomputeone(mappings{j}, procfunction, nstimuli, nsample);
        nSDs(j,:) = nsd;
        nBiases(j,:) = nb;
        distribs(j,:,:) = dist; 
        waitbar(j/nmaps, f, sprintf('Bootstrapping: %i complete', j));
    end
    close(f);
end

function [nSDs, nBiases, distribs] = bscomputeone(mapping, procfunction, nstimuli, nsample)
%COMPUTEBS  Auxilarry function. It is the same as BSCOMPUTE, but makes
%the computation obly for a single map.
    nsteps = length(nstimuli);
    nSDs = zeros(nsteps,1);
    nBiases = zeros(nsteps, 1);
    distribs = zeros(nsteps, nsample);
    for k = 1:nsteps
        realval = procfunction(mapping);
        distrib = zeros(5,1);
        n = size(mapping,1);
        for j = 1:nsample
            indexes = randomsample(n, nstimuli(k));
            bsmapping = mapping(indexes,:);
            distrib(j) = procfunction(bsmapping);
        end
        distribs(k,:) = distrib;
        nSDs(k) = std(distrib)/realval;
        nBiases(k) = mean(distrib - realval)/realval;
    end
end

function res = randomsample(n, k)
%Returns k values sampled uniformly at random, without replacement, from the integers 1 to n.
%This function is implemented in new Matlab as randsample
r = randperm(n);
res = r(1:k);
end

