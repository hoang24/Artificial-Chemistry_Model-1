function [chemistry,concentration,Diversity] = initializeChem(initialSize,speciesSet,outSpecies)
% input: 
    % initialSize: initial number of molecules in the network
    % speciesSet: the species that might appear in the initial network
% output: chemistry: the initial network
    chemistry = randi(speciesSet,[1,initialSize]);
    Diversity = diversity(chemistry);
    for k = 1:size(outSpecies,2)
        concentration(k) = sum(chemistry == outSpecies{k});
    end
end

