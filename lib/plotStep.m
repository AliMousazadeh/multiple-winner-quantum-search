function [amp, prob] = plotStep(qubit)
subplot(1, 2, 1);
numStates = size(qubit, 1);
amp = plot([(1:numStates); (1:numStates)], [zeros(1, numStates); ...
    qubit'], 'b');
xlabel('state');
title('amplitude');
subplot(1, 2, 2);
prob = plot([(1:numStates); (1:numStates)], [zeros(1, numStates); ...
    (abs(qubit).^2)'], 'b');
xlabel('state');
title('probability');
end