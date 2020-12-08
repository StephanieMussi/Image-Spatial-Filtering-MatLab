% 2.3 Linear Spatial Filtering and 2.4 Median Filtering
% Written by: Mu Siyi
% Date: 21/09/2020

% Generate Gaussian Averaging Filter 1
m = 5; 
n = 5;
sigma = 1;
[x y] = meshgrid(-(m-1)/2:(m-1)/2, -(n-1)/2:(n-1)/2);
hg = exp(-(x.^2+y.^2)/(2*sigma^2))/(2*pi*sigma^2);            %Gaussian function
h1 = hg./sum(hg(:));
mesh(h1)
% Alternative approach
h1 = fspecial('gaussian',5, 1);
mesh(h1)


% Generate Gaussian Averaging Filter 2
sigma = 2;
[x y] = meshgrid(-(m-1)/2:(m-1)/2, -(n-1)/2:(n-1)/2);
hg = exp(-(x.^2+y.^2)/(2*sigma^2))/(2*pi*sigma^2);            
h2 = hg ./sum(hg(:))
mesh(h2)
% Alternative approach
h2 = fspecial('gaussian',5, 2)
mesh(h2)


% Apply Gaussian filter on the image with Gaussian noise
Pc1 = imread('lib-gn.jpg');
imshow(Pc1)
P1 = conv2(Pc1, h1);
imshow(P1, [])
P2 = conv2(Pc1, h2);
imshow(P2, [])

% Apply Gaussian filter on the image with speckle noise
Pc2 = imread('lib-sp.jpg');
imshow(Pc2)
P3 = conv2(Pc2, h1);
imshow(P3, [])
P4 = conv2(Pc2, h2);
imshow(P4, [])


% Apply Median filter on the image with Gaussian noise
P5 = medfilt2(Pc1, [3 3]);
imshow(P5)
P6 = medfilt2(Pc1, [5 5]);
imshow(P6)

% Apply Median filter on the image with speckle noise
P7 = medfilt2(Pc2, [3 3]);
imshow(P7)
P8 = medfilt2(Pc2, [5 5]);
imshow(P8)
