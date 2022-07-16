
[x1,fs] = audioread('segment2.wav');
x1 = x1(:,1);

x1 = x1(:,1);
figure(1);
plot(x1);
title('原始语音信号');
xlabel('时间 t');
ylabel('音量 n');
figure(2);
y1 = fft(x1);
y1 = fftshift(y1);
derta_fs = fs/length(x1);
plot([-fs/2:derta_fs:fs/2-derta_fs],abs(y1)/fs);
title('原始语音信号的幅度谱');
figure(3)
plot([-fs/2:derta_fs:fs/2-derta_fs],atan2(imag(y1),real(y1)));
title('原始语音信号的相位谱');

[x1,fs] = audioread('voice.wav');
x1 = x1(:,1);

x1 = x1(:,1);
figure(4);
plot(x1);
title('原始语音信号');
xlabel('时间 t');
ylabel('音量 n');
figure(5);
y1 = fft(x1);
y1 = fftshift(y1);
derta_fs = fs/length(x1);
plot([-fs/2:derta_fs:fs/2-derta_fs],abs(y1)/fs);
title('原始语音信号的幅度谱');
figure(6)
plot([-fs/2:derta_fs:fs/2-derta_fs],atan2(imag(y1),real(y1)));
title('原始语音信号的相位谱');
