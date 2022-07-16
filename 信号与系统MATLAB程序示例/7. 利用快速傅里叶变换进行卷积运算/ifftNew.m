function Y = ifftNew(X)
%自己实现的MATLAB中的ifft程序。
N = 2^floor(log2(length(X)));
X = X(1:N);
if length(X) == 2
    Y = zeros(1,2);
    Y(1) = X(1)+X(2);
    Y(2) = X(1)-X(2);
else
    X1 = X([1:2:N]);
    X2 = X([2:2:N]);
    Y1 = ifftNew(X1);
    Y2 = ifftNew(X2);
    
    Y = zeros(1,N);
    for k = 2:N/2
        Y2(k) = Y2(k)*exp(1j*2*pi*(k-1)/N);
    end;
    for k = 1:N/2
        Y(k) = Y1(k) +Y2(k);
        Y(k+N/2) = Y1(k) - Y2(k);
    end;
end;
Y= Y/2;
