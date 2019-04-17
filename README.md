# TMS-BS

Implementation of the bootstrapping-based analysis of the accuracy of cortical representation parameters obtained by TMS-mappings,
including sample parameter function and mappings dataset 

## How to run:

Just run example.m script

## Files:

*computeBS.m -* function to compute bootstrap distributions and accuracy values (normalized SD and normalized bias) 
for the set of TMS-mappings data and the set of different number of stimuli in reduced maps

*plotMeanStd.m -* auxillary function for plotting mean+-SD of an input data

*mappings.mat -* sample mappings database (30 mappings of EDC and FDS muscles in the format [x1,y1,z1,amp1; x2,y2,z2,amp2; ...])

*sampleParameter.m -* function to compute the sample parameter of cortical muscle representation 
(mean amplitude above threshold multiplied by the maximal distance to the center of gravity)

*example.m -* example of the usage of computeBS on the sample data and cortical representation parameter

### Requirements:

The code only needs core Matlab software (it was tested in Matlab 2010).


### Study contributors:

Andrey Yu. Chernyavskiy 1,2, Dmitry O. Sinitsyn 1, Alexandra G. Poydasheva 1, Ilya S. Bakulin 1, Natalia А. Suponeva 1, Michael A. Piradov 1

1 Research Center of Neurology, Moscow, Russia

2 Valiev Institute of Physics and Technology of Russian Academy of Sciences, Moscow, Russia
