function qubit = measure(qubit)
N = size(qubit, 1);
probabilities = abs(qubit).^2;
winner = randsample(N,1,true,probabilities);
qubit = zeros(N, 1);
qubit(winner) = 1;
end