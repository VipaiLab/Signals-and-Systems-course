N = 25;
x = 0:N-1;
H = zeros(N,1);

for i = 1:N
    if i == (N+1)/2
        H(i) = 1/6;
    else
        H(i) = sin(pi*(i-(N+1)/2)/6)/(pi*(i-(N+1)/2));
    end;
end;
H = H.*blackman(N);
newN = 1000;
H = [H',zeros(1,newN-length(H))];
Y = fft(H);
Y = fftshift(Y);
W = calculateDiscreteFrequencyIndex(length(Y));
subplot(2,1,1);
%plot(W,abs(Y));
plot(W,10*log10(abs(Y)));
subplot(2,1,2);
plot(W,angle(Y));
