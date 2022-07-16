clear all;
N = 15 % Set N as an odd number.
Np = 1000; % Parameter for zero padding.

% retangular window
window = ones(1,N);
window = [window,zeros(1,Np-length(window))];
[w,y] = calculateDiscreteFourierTransform(window);
subplot(5,1,1);plot(w,abs(y));title('矩形窗');

%hanning window
window = hanning(N)';
window = [window,zeros(1,Np-length(window))];
[w,y] = calculateDiscreteFourierTransform(window);
subplot(5,1,2);plot(w,abs(y));title('汉宁窗');

%hamming window
window = hamming(N)';
window = [window,zeros(1,Np-length(window))];
[w,y] = calculateDiscreteFourierTransform(window);
subplot(5,1,3);plot(w,abs(y));title('汉明窗');

%kaiser window
window = kaiser(N)';
window = [window,zeros(1,Np-length(window))];
[w,y] = calculateDiscreteFourierTransform(window);
subplot(5,1,4);plot(w,abs(y));title('凯泽窗');

%blackman window
window = blackman(N)';
window = [window,zeros(1,Np-length(window))];
[w,y] = calculateDiscreteFourierTransform(window);
subplot(5,1,5);plot(w,abs(y));title('布莱克曼窗');
