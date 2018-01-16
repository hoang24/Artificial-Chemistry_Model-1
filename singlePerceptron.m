function [actualOut,weights,desiredOut] = singlePerceptron(concentration,observedSpecies,outSpecies)
    % initialize the perceptron
    [iterations,normIn,normDesiredOut,bias,wInputs,wBias,coeff,weights,normal,desiredOut,input] = ...
        initializePerceptron(concentration,observedSpecies,outSpecies);

    % run the perceptron
    [actualOut,weights] = runPerceptron(iterations,normIn,wInputs,bias,wBias,normDesiredOut,normal,weights,coeff);

    % read and plot the perceptron
    %readPerceptron(input,outSpecies,weights,actualOut,desiredOut,iterations);
    figure
    colorVec = hsv(length(input));
    %outSpecies = num2cell(outSpecies);
    hold on
    
    for j = 1:length(input)
        plot(1:iterations,weights(:,j),'Color',colorVec(j,:))
        title('Plot of weights vs. iterations')
        xlabel('Number of iterations')
        ylabel('Weights')
        legendInfo{j} = ['Weights of output species: ' num2str(outSpecies{j})];
        legend(legendInfo)
    end
    figure
    plot(1:iterations,actualOut,'k-.','LineWidth',3,'MarkerSize',0.75)
    hold on
    plot(1:iterations,desiredOut,'b-','MarkerSize',0.7)
    title('Plot of actual output and desired output vs. iterations')
    xlabel('Number of iterations')
    ylabel('Outputs')
    hold off
    legend('Actual output','Desired output')
    
    %actualOut = actualOut(end);
end
