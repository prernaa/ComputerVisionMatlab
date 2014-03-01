% part (a)

function dispmap = sdispmapgen(Pl, Pr, Tm, Tn)
% x denotes horizontal axis value, hence it's column number
% y denotes vertical axis value, hence it's row number

dispmap = zeros(size(Pl)); %preallocation
 
p = (Tm-1)/2; %half the number of rows
q = (Tn-1)/2; %half the number of columns
p,q,size(Pl) 
%iterate through each pixel in Pl
for y = p+1:size(Pl, 1)- p %rows 
    for x = q+1:size(Pl, 2)-q %columns
    %create template using TmxTn neighbourhood of Pl(y, x)
    T = Pl(y-p:y+p, x-q:x+q);
 
    %create subset of image Pr that's on the same scan line
    subPr = Pr(y-p:y+p, x-q+1:x+min(256-x-q, 15)+q);
    
    S = zeros(1, size(subPr,2));
    if(size(subPr,2)-2*q==0)
        T,size(subPr,2),q
    end
    for a = q+1:size(subPr, 2)-q-1
        Diff = T-subPr(:, a-q:a+q);
        S(1, a-q) = sum(sum(Diff.^2));
    end
 
    %find minimum SSD within 15 pixel disparity threshold
    [~, xr] = min(S);
    x,y, S, min(S), xr
    dispmap(x,y) = x-xr;
    end
end