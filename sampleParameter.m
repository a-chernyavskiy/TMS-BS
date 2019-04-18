function [res] = sampleParameter(mapping, threshold)
%SAMPLEPARAMETER Computes the sample parameter of TMS-map 
%(mean amplitude above threshold multiplied by 
%the maximal distance of positive MEP point to the center of gravity).
% mapping - the mapping data in the format [x1,y1,z1,amp1; x2,y2,z2,amp2; ...]

if(nargin < 2)
   threshold = 50;
end
amps = mapping(:,4);
posmap = mapping(amps>threshold,:); 
mv = mean(posmap(:,4));
c = mean(posmap(:,1:3));
n = length(posmap);
dists = zeros(1,n);
for j = 1:n
    dists(j) = norm(posmap(j,1:3)-c);
end
res = mv*max(dists); 
end

