function readChem(reactions,concentration,Diversity,outSpecies)
    generations = 2*(reactions + 1);
    hold on
    title(['Plot of concentration of outSpecies vs. generations'])
    ylabel(['concentration of outSpecies and diversity'])
    xlabel('generations')
    grid 
    
    colorVec = hsv(length(outSpecies));
    for k = 1:size(outSpecies,2)
        speciesConcentration = concentration(:,k);
        plot(1:generations,speciesConcentration,'Color',colorVec(k,:)) % plot concentration of output species vs. generations
        legendInfo{k} = ['output species: ' num2str(outSpecies{k})];
        legend(legendInfo)
    end
    plot(1:generations,Diversity,'-.','DisplayName','diversity') % plot diversity vs. generations
    %hold off
end

