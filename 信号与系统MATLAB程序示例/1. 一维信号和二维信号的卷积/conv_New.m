function C = convNew(A,B)
% This is the function to do convolution of two arrays.
C = zeros(1,length(A) + length(B)-1);
for i = 1:length(A) 
    C = C + [zeros(1,i-1),A(i)*B, zeros(1,length(A)-i)];%ÁÐ±í·¨
end;
    