% Experiment 1 - Undoing Perspective Distortion of Planar Surface

% part (a)

P = imread('book.jpg');
figure('name','Original image');
imshow(P) % displaying original image

% part (b)

[X Y] = ginput(4); % vectors X and Y store he input coordinates
X
Y

% assuming that we'll click the top left, then top right, bottom right
% then bottom left

% vectors x and y give the output coordinates
x = [0, 210, 210, 0];
y = [0, 0, 297, 297];

% part (c)

% A u = v
% A and v can be calculated based on the input and output coordinates
A = [X(1) Y(1) 1 0 0 0 -X(1)*x(1) -Y(1)*x(1);
    0 0 0 X(1) Y(1) 1 -X(1)*y(1) -Y(1)*y(1);
    X(2) Y(2) 1 0 0 0 -X(2)*x(2) -Y(2)*x(2);
    0 0 0 X(2) Y(2) 1 -X(2)*y(2) -Y(2)*y(2);
    X(3) Y(3) 1 0 0 0 -X(3)*x(3) -Y(3)*x(3);
    0 0 0 X(3) Y(3) 1 -X(3)*y(3) -Y(3)*y(3);
    X(4) Y(4) 1 0 0 0 -X(4)*x(4) -Y(4)*x(4);
    0 0 0 X(4) Y(4) 1 -X(4)*y(4) -Y(4)*y(4);];

v = [x(1);y(1);
    x(2);y(2);
    x(3);y(3);
    x(4);y(4);];

u = A\v;
u
U = reshape([u;1],3,3)';
U
w = U*[X';Y'; ones(1,4)];
w = w ./ (ones(3,1)*w(3,:));
w % w must give the desired output coordinates

% part (d)

T = maketform('projective', U'); % warping the image
P2 = imtransform(P,T,'XData', [0 210], 'YData', [0 297]);

% part (e)

figure('name', 'Final Result');
imshow(P2) % display the final image