clear all;
N = 2^16;
X = randn(1,N);
Y = randn(1,N);
N
tic
%用卷积的定义实现的两个信号的卷积，是三个中最慢的。
Z1 = convNew(X,Y);
toc

tic
%用我们自己的FFTNEW和IFFTNEW两个程序实现的卷积，比上面快一点，尤其当序列长度很长的时候。
Z2 = convNew2(X,Y);
toc

tic
%这是最快的，因为用的是MATLAB自带的卷积程序，里面的FFT, IFFT模块经过优化
Z3 = conv(X,Y);
toc


