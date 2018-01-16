function [chemistry,concentration,Diversity] = runChem(initialSize,chemistry,reactions,concentration,Diversity,outSpecies)
    for i = 1:reactions
        draw1 = randi([1,initialSize]); 
        s1 = chemistry(draw1); % draw molecule s1 from the chamber
    
        draw2 = randi([1,initialSize]);
        while draw2 == draw1
            draw2 = randi([1,initialSize]);
        end
        s2 = chemistry(draw2); % draw molecule s2 from the chamber
    
        if mod(s1,s2) == 0
            s3 = s1/s2;
            chemistry = [chemistry,s3];
        end
        
        for k = 1 : size(outSpecies,2)
            newConcentration(k) = sum(chemistry == outSpecies{k});
        end
        concentration = [concentration;newConcentration];
    
        newDiversity = diversity(chemistry);
        Diversity = [Diversity,newDiversity];
    end
end
