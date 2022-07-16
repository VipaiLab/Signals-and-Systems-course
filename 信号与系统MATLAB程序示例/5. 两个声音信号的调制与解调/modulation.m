[x1,fs] = audioread('voice1.wma');
[x2,fs] = audioread('voice2.wma');
x1 = x1(:,1);
x2 = x2(:,1);

len1 = length(x1);
len2 = length(x2);
if len1>len2
    x2(len2+1:len1) = 0;
else
    x1(len1+1:len2) = 0;
end;

derta_fs = fs/length(x1);

%低通滤波
fp = 3000;
N1 = 2*pi*0.9/(0.1*pi);
wc1 = 2*pi*fp/fs;
if rem(N1,2)
    N1 = N1+1;
end;
Window = boxcar(N1+1);
b1 = fir1(N1,wc1/pi,Window);
figure(1);
freqz(b1,1,512);
title('低通滤波器的频率响应');
x1_low = filter(b1,1,x1);
x2_low = filter(b1,1,x2);

audiowrite('voice1AfterLowpassFilter.wav', x1_low, fs);

audiowrite('voice2AfterLowpassFilter.wav', x2_low, fs);

%调制
x3 = zeros(1,len1);
fc1 = 8000;
fc2 = 27000;
for i =1:length(x3)
    x3(i) = x1_low(i)*cos(fc1*(i-1)/fs)+x2_low(i)*cos(fc2*(i-1)/fs);
end;
audiowrite('voice1and2AfterModulation.wav', x3, fs);

%解调
x1_afterModulation = zeros(1,len1);
x2_afterModulation = zeros(1,len1);
for i =1:length(x3)
    x1_afterModulation(i) = x3(i)*cos(fc1*(i-1)/fs);
    x2_afterModulation(i) = x3(i)*cos(fc2*(i-1)/fs);
end;
x1_afterModulation = filter(b1,1,x1_afterModulation);
x2_afterModulation = filter(b1,1,x2_afterModulation);
audiowrite('voice1AfterDemodulation.wav', x1_afterModulation, fs);
audiowrite('voice2AfterDemodulation.wav', x2_afterModulation, fs);