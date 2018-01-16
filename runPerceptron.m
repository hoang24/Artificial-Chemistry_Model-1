function [actualOut,weights] = runPerceptron(iterations,normIn,wInputs,bias,wBias,normDesiredOut,normal,weights,coeff)
    for i = 1:iterations
        net = sum(normIn.*wInputs) + bias*wBias;
        actualOut(i) = 1./(1+exp(-net));

        error = normDesiredOut - actualOut(i);
        
        wInputs = wInputs + normIn*coeff*error;
        wBias = wBias + coeff*bias*error;
        actualOut(i) = actualOut(i).*normal;
        weights = [weights; wInputs wBias];    
    end
end

