% Experiment 2 - 3D Stereo

% part (a)

function dispMap = dispmap2(limg, rimg, win, dMin, dMax)
dispMap = ones(size(limg)); % initialising dispMap
numr = size(limg, 1);
numc = size(limg, 2);
for i=1+win:1:numr-win
    for j=1+win-dMin:1:numc-win-dMax
    prev = 10000;
    match = dMin;
    % disparity varies from dMin to dMax
        for d=dMin:dMax
            % fixing the left patch for 1 iteration
            left_patch=limg(i-win : i+win, j-win : j+win);
            % traversing row from dMin to dMax for a particular 'i'
            right_patch=rimg(i-win : i+win, j+d-win : j+d+win);
            % computing SSD
            temp = (left_patch - right_patch).^2; 
            curr=sum(sum(temp));
            % checking for the minimum disparity value
            if (prev > curr)
                prev = curr;
                match = d;
            end
        end
        dispMap(i,j) = match; 
    end
end