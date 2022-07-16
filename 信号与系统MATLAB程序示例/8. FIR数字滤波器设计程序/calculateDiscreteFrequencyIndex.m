function w = calculateDiscreteFrequencyIndex(N)
interval = 2*pi/N;
wStart = 2*pi*ceil(N/2)/N-2*pi;
wEnd = wStart+2*pi*(N-1)/N;
w = [wStart:interval:wEnd];
