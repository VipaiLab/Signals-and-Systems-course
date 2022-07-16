function H = deconv_new(X,Y)
if X(1) == 0
    error('Input Error. The first term of X should be nonzero.');
end;

%Calculate H.
H = zeros(1,length(Y)-length(X)+1);
X = [X,zeros(1,length(Y)-length(X))];
H(1) = Y(1)/X(1);
for i = 2:length(H)
    H(i) = (Y(i)-H(1:i-1)*X(i:-1:2)')/X(1);
end;

%Check if Y = conv(X,H).
for i = length(H)+1:length(Y)
    if abs(Y(i)-H(1:length(H))*X(i:-1:i-length(H)+1)')>1e-3
        error('Input error. Y is not equal to conv(X,H)');
    end;
end;