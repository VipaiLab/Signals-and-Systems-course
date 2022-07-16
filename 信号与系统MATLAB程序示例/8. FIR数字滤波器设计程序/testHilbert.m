clear all;
T = 0.01;
t = 0:T:100;
%x=0.3*t.*cos(3*t);
%x = cos(0.02*pi*t).*cos(pi*10*t);
x=cos(0.2*t).*cos(30*t);
n = -1000:1000;
hn = zeros(1,length(n));
for i = 1:length(hn)
    if mod(n(i),2)
        hn(i) = 2/(pi*n(i));
    end;
end;
hn = hn.*hamming(length(hn))'% add the windowfunction. 
%hn = hn.*hanning(length(hn))'
%hn = hn.*kaiser(length(hn))'
%hn = hn.*blackman(length(hn))'; 
y = conv(x,hn,'same');
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

