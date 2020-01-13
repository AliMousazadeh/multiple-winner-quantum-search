function qubit = oracle(qubit, winners)
N = size(qubit, 1);
M = size(winners, 1);
U = zeros(N, 1);
U(winners) = 1 / sqrt(M);
qubit = (eye(N) - 2*(U*U'))*qubit;
end