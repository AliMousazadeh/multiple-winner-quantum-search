function V = diffusionMatrix(qubit)
V = 2*(qubit*qubit') - eye(size(qubit, 1));
end