A = imread('Lenna.bmp');
A = double(A);
h = [1,1,1;1,1,1;1,1,1]/9;
processedA = conv2(A,h);
processedA = rescale(processedA,0,255);
imwrite(uint8(processedA),'LennaAfterMeanFilter.bmp');

h = [-1,-1,-1;-1,8,-1;-1,-1,-1]/9;
processedA = conv2(A,h);
processedA = rescale(processedA,0,255);
imwrite(uint8(processedA),'LennaAfterEdgeExtraction.bmp');

h = [1,2,1;0,0,0;-1,-2,-1]/9;
processedA = conv2(A,h);
processedA = rescale(processedA,0,255);
imwrite(uint8(processedA),'LennaAfterSobelEdgeExtractionHoriental.bmp');

h = [1,0,-1;2,0,-2;1,0,-1]/9;
processedA = conv2(A,h);
processedA = rescale(processedA,0,255);
imwrite(uint8(processedA),'LennaAfterSobelEdgeExtractionVertical.bmp');




