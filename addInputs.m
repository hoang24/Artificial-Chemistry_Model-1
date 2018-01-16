function [chemistry,concentration,Diversity] = addInputs(chemistry,inSpecies,concentration,Diversity,outSpecies)
    chemistry = [chemistry,inSpecies];
   
    newDiversity = diversity(chemistry);
    Diversity = [Diversity,newDiversity];
    
    for k = 1 : size(outSpecies,2)
        newConcentration(k) = sum(chemistry == outSpecies{k});
    end
        concentration = [concentration;newConcentration];
end

