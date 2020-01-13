close all; clear; clc;
addpath('./lib');
%%%%%%%%%%
numStates = 128;
winners = [64; 32; 16];
pauseTime = 1;
FrameRatePerSecond = 1 / pauseTime;
%%%%%%%%%%
writerObj = VideoWriter('qubitState', 'MPEG-4');
writerObj.FrameRate = FrameRatePerSecond;
open(writerObj);


N = numStates;
M = size(winners, 1);
numIterations = floor(pi/4*sqrt(N/M));

qubit = zeros(numStates, 1);
%Initial state
qubit(1) = 1;
qubit = hadamard(qubit);

V = diffusionMatrix(qubit);

[amp, prob] = plotStep(qubit);
pause(pauseTime)
drawnow
F = getframe(gcf) ;
writeVideo(writerObj, F);

for i = 1:numIterations
   qubit = oracle(qubit, winners);
   
   delete(amp);
   delete(prob);
   plotStep(qubit);
   pause(pauseTime);
   drawnow
   F = getframe(gcf) ;
   writeVideo(writerObj, F);
   
   qubit = V * qubit;
   
   delete(amp);
   delete(prob);
   plotStep(qubit);
   pause(pauseTime);
   drawnow
   F = getframe(gcf) ;
   writeVideo(writerObj, F);
end

close(writerObj);
fprintf('Sucessfully generated the video.\n');

qubit = measure(qubit);
winner = find(qubit == true);
fprintf('Winner state is: %d\n', winner);