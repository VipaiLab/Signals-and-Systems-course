f = [0 0.3 0.4 0.6 0.7 1.0];
a = [0 1.0 0.0 0.0 0.5 0.5];
b = firpm(50,f,a);

[h,w] = freqz(b,1,512);
subplot(2,1,1);
plot(w,20*log10(abs(h))) 
title('离散系统幅频特性曲线')
subplot(2,1,2);
plot(w,angle(h))
title('离散系统相频特性曲线')
plot(f,a,w/pi,abs(h))
legend('Ideal','firpm Design')
xlabel 'Radian Frequency (\omega/\pi)', ylabel 'Magnitude'