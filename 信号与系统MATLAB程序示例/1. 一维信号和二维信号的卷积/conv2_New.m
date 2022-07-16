function C = conv2_New(A,B)
C = zeros(size(A,1)+size(B,1)-1,size(A,2)+size(B,2)-1);
for i = 1:size(C,1)
    minJ = max(1,i-size(A,1)+1);
    maxJ = min(i,size(B,1));
    for j = minJ:maxJ
        C(i,:) = C(i,:) + conv_New(A(i-j+1,:),B(j,:));
    end;
end