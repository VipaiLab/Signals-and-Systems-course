N = 15; % Set N as an odd number;
w0 = 0.4*pi;
n0 = floor(N/2);
hn = zeros(1,N);
for i = 1:length(hn)
    if i == n0
        hn(i) = w0/pi;
    else
        hn(i) = sin(w0*(i-n0))/(pi*(i-n0));
    end;
end;
subplot(3,1,1);stem(hn);title('h[n]');
 
Np = 1000;
hn = [hn,zeros(1, Np-length(hn))];%zero padding
[w,y] = calculateDiscreteFourierTransform(hn);
 
subplot(3,1,2);plot(w,abs(y)),title('幅度谱');
subplot(3,1,3);plot(w,angle(y)),title('相位谱');
