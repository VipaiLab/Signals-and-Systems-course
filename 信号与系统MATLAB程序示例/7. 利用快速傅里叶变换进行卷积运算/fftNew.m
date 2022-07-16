function Y = fftNew(X)
%自己实现的MATLAB中的fft程序。
if length(X) == 2
    Y = zeros(1,2);
    Y(1) = X(1)+X(2);
    Y(2) = X(1)-X(2);
else
    N = 2^floor(log2(length(X)));
    X = X(1:N);

    X1 = X([1:2:N]);
    X2 = X([2:2:N]);
    Y1 = fftNew(X1);
    Y2 = fftNew(X2);
    
    Y = zeros(1,N);
    for k = 2:N/2
        Y2(k) = Y2(k)*exp(-1j*2*pi*(k-1)/N);
    end;
    for k = 1:N/2
        Y(k) = Y1(k) +Y2(k);
        Y(k+N/2) = Y1(k) - Y2(k);
    end;
end;
        
        
    
    