function C = convNew(A,B)
% 用卷积的定义实现了两个一维信号的卷积。
C = zeros(1,length(A) + length(B)-1);
for i = 1:length(A) 
    C = C + [zeros(1,i-1),A(i)*B, zeros(1,length(A)-i)];%列表法
end;
    