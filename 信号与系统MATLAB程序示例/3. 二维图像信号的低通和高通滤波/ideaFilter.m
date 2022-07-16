%理想低通滤波。
clear all;
A = imread('Lenna.bmp');
s = fftshift(fft2(A));

[M,N] = size(s);
n1 = floor(M/2);
n2 = floor(N/2);

d0 = 20;
for i = 1:M
    for j = 1:N
        d = sqrt((i-n1)^2+(j-n2)^2);
        if d<=d0
            h = 1;
        else
            h = 0;
        end;
        s(i,j) = h*s(i,j);
    end;
end;
s = ifftshift(s);
s = uint8(real(ifft2(s)));
imwrite(s,'LennaAfterLowpassFilter.bmp','bmp');

%理想高通滤波。
s = fftshift(fft2(A));

for i = 1:M
    for j = 1:N
        d = sqrt((i-n1)^2+(j-n2)^2);
        if d>d0
            h = 1;
        else
            h = 0;
        end;
        s(i,j) = h*s(i,j);
    end;
end;
s = ifftshift(s);
s = uint8(real(ifft2(s)));
imwrite(s,'LennaAfterHighpassFilter.bmp','bmp');

%巴特乌斯低通滤波。
clear all;
A = imread('Lenna.bmp');
s = fftshift(fft2(A));
[M,N] = size(s);
n = 2;

d0 = 20;
n1 = floor(M/2);
n2 = floor(N/2);
for i = 1:M
    for j = 1:N
        d = sqrt((i-n1)^2+(j-n2)^2);
        h = 1/(1+(d/d0)^(2*n));
        s(i,j) = h*s(i,j);
    end;
end;
s = ifftshift(s);
s = uint8(real(ifft2(s)));
imwrite(s,'LennaAfterButterworthLowpassFilter.bmp','bmp');

%巴特乌斯高通滤波。
s = fftshift(fft2(A));
for i = 1:M
    for j = 1:N
        d = sqrt((i-n1)^2+(j-n2)^2);
        h = 1-1/(1+(d/d0)^(2*n));
        s(i,j) = h*s(i,j);
    end;
end;
s = ifftshift(s);
s = uint8(real(ifft2(s)));
imwrite(s,'LennaAfterButterworthHighpassFilter.bmp','bmp');