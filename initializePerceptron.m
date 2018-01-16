function [iterations,normIn,normDesiredOut,bias,wInputs,wBias,coeff,weights,normal,desiredOut,input] = ...
    initializePerceptron(concentration,observedSpecies,outSpecies)
    
    iterations = 10000;    
    outSpecies = cell2mat(outSpecies);
    observedIndex = outSpecies == observedSpecies;
    input = concentration(end,:);
    desiredOut = concentration(end,observedIndex);
    
    normal = max(input);
    normIn = input./normal;
    normDesiredOut = desiredOut/normal;
        
    bias = 1;
    wInputs = rand(1,length(input)); % generate the weight row vector
    wBias = rand;
    coeff = 0.01;
    weights = [];
end