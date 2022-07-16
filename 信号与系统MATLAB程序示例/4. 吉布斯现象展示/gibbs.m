% %方波的吉布斯现象。
T = 4;
T1 = 2;
w = 2*pi/T;
N = 1000;

t = -2.5*T:0.0001:2.5*T;
x = T1*ones(1,length(t))/T;
for k=1:N
    x = x+2*sin(k*pi*T1/T)*cos(k*w*t)/(k*pi);
end;

figure(3);
plot(t,x);
max(x)

%三角波的吉布斯现象
w = 2*pi;
N = 100;

t = -1:0.0001:1;
x = zeros(1,length(t));
for k=1:N
    x = x+(-1)^(k+1)*sin(2*k*pi*t)/(k*pi);
end;

figure(1);
plot(t,x);
max(x)
   
    