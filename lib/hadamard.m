function qubit = hadamard(qubit)
N = size(qubit, 1);
numProd = floor(log2(N));
h = 1/sqrt(2) * [1, 1
                 1,-1];
hP = h;
for i = 1:numProd-1
    H = kron(h, hP);
    hP = H;
end

qubit = H * qubit;
end