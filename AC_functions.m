function [chemistry,concentration,Diversity,actualOut,weights,desiredOut] = AC_functions(inSpecies,observedSpecies,varargin)
    % inSpecies: molecule to be added into the AC
    % numOut: number of output species
    % varargin: molecule whose concentration is desired to read
    clc
    close all
    RandStream.setGlobalStream(RandStream('mt19937ar','seed',sum(100*clock)));
    initialSize = 100;
    speciesSet = [0,99];
    outSpecies = varargin;
    [chemistry,concentration,Diversity] = initializeChem(initialSize,speciesSet,outSpecies); % initialize AC

    reactions = 10^4;
    [chemistry,concentration,Diversity] = runChem(initialSize,chemistry,reactions,concentration,Diversity,outSpecies); % reactions heppening in AC

    [chemistry,concentration,Diversity] = addInputs(chemistry,inSpecies,concentration,Diversity,outSpecies); % inject inputs into AC

    [chemistry,concentration,Diversity] = runChem(initialSize,chemistry,reactions,concentration,Diversity,outSpecies); % reactions happening in AC
    
    readChem(reactions,concentration,Diversity,outSpecies) % plot concentration and diversity
        
    [actualOut,weights,desiredOut] = singlePerceptron(concentration,observedSpecies,outSpecies);
    
end