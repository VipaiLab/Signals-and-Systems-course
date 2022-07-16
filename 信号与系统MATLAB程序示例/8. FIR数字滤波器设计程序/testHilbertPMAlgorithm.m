clear all;
N=81;
f=[0.05 0.95];%设置带宽
m=[1 1];%理想滤波器的幅频特性
fs=2000;%采样频率
b=firpm(N,f,m,'h');%采用Parks-McClellan方法设计Hilbert变换器

T=0.01;
t=0:T:100;
%x=0.3*t.*cos(3*t);
%x = cos(0.02*pi*t).*cos(pi*10*t);
%x=cos(0.2*t).*cos(30*t);
x=cos(2*pi*0.01*t).*cos(2*pi*10*t+0.01*t);
y =filter(b,1,x);%滤波
A=(abs(x).^2+abs(y).^2).^0.5;
subplot(3,1,1);plot(t,A);title('计算所得幅度');

phase=atan2(y,x);
subplot(3,1,2);plot(t,phase);title('计算所得相位');

q=x+j*y;
w = zeros(1,length(q));
for n=1:length(w)-1
    w(n)=imag(2*(q(n+1)-q(n))./((q(n+1)+q(n))*T));
end
w(end)=phase(end);
subplot(3,1,3);plot(t,w);title('计算所得瞬时频率');