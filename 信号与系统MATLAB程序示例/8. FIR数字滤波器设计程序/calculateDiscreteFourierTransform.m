function [w,y] = calculateDiscreteFourierTransform(x)
y = fft(x);
y = fftshift(y);
w =calculateDiscreteFrequencyIndex(length(y));

