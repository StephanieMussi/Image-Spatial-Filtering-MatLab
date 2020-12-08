# Image_Spatial_Filtering_MatLab
This project aims to handle image with Gaussian noise or speckle noise with Gaussian filter and Median filter. The images used can be found in ["lib-gn.jpg"](https://github.com/StephanieMussi/Image_Spatial_Frequency_Filtering_MatLab/blob/main/lib-gn.jpg) and ["lib-sp.jpg"](https://github.com/StephanieMussi/Image_Spatial_Frequency_Filtering_MatLab/blob/main/lib-sp.jpg).  

## Gaussian filtering
Two Gaussian filters are used with σ = 1 and σ = 2 respectively.  
There are two ways to construct the filters:  
__First approach__ 
```matlab
m = 5; 
n = 5;

sigma = 1;
[x y] = meshgrid(-(m-1)/2:(m-1)/2, -(n-1)/2:(n-1)/2);
hg = exp(-(x.^2+y.^2)/(2*sigma^2))/(2*pi*sigma^2);            %Gaussian function
h1 = hg./sum(hg(:));
mesh(h1);

sigma = 2;
[x y] = meshgrid(-(m-1)/2:(m-1)/2, -(n-1)/2:(n-1)/2);
hg = exp(-(x.^2+y.^2)/(2*sigma^2))/(2*pi*sigma^2);            
h2 = hg ./sum(hg(:))
mesh(h2)
``` 

The filters are shown as below:  
<img src = "https://github.com/StephanieMussi/Image_Spatial_Frequency_Filtering_MatLab/blob/main/Figures/gaus1.png" width = 600 height = 309>
<img src = "https://github.com/StephanieMussi/Image_Spatial_Frequency_Filtering_MatLab/blob/main/Figures/gaus2.png" width = 600 height = 309>  


__Second approach__  
This uses _fspecial_ function in MATLAB Image Processing Toolbox.  
```matlab
h1 = fspecial('gaussian',5, 1);
mesh(h1);
h2 = fspecial('gaussian',5, 2)
mesh(h2);
``` 


The image "lib-gn.jpg" is read and displayed:  
<img src = "https://github.com/StephanieMussi/Image_Spatial_Frequency_Filtering_MatLab/blob/main/lib-gn.jpg" width = 544 height = 365>  
As it can be seen, this image comes with additive Gaussian noise.  
Then, the two filters are applied to the image.  

```matlab
P1 = conv2(Pc1, h1);
imshow(P1, [])
```  
<img src = "https://github.com/StephanieMussi/Image_Spatial_Frequency_Filtering_MatLab/blob/main/Figures/gn_gaus1.png" width = 544 height = 365>  
```matlab
P2 = conv2(Pc1, h2);
imshow(P2, [])
```  
<img src = "https://github.com/StephanieMussi/Image_Spatial_Frequency_Filtering_MatLab/blob/main/Figures/gn_gaus2.png" width = 544 height = 365>  
As observed, applying the filters can significantly reduce the Gaussian noise, while the image quality decreases (edges become blurred and contrast is lower) as compared to the original image.  
When σ (degree of smoothing) is larger, the noise reduction is more effective, but the image is more blurred than using a smaller σ.  


The image "lib-sp.jpg" is read and displayed:  
<img src = "https://github.com/StephanieMussi/Image_Spatial_Frequency_Filtering_MatLab/blob/main/lib-sp.jpg" width = 544 height = 365>  
As it can be seen, this image comes with additive speckle noise.  
Then, the two filters are applied to the image.  

```matlab
P3 = conv2(Pc2, h1);
imshow(P3, [])
```  
<img src = "https://github.com/StephanieMussi/Image_Spatial_Frequency_Filtering_MatLab/blob/main/Figures/sp_gaus1.png" width = 544 height = 365>  
```matlab
P4 = conv2(Pc2, h2);
imshow(P4, [])
```  
<img src = "https://github.com/StephanieMussi/Image_Spatial_Frequency_Filtering_MatLab/blob/main/Figures/sp_gaus2.png" width = 544 height = 365>  
As observed, the image still has visible speckle noise (small white dots) after filtering. The filters are better are better at handling Gaussian noise.   


## Median filtering   
In this section, two median filter of size 3x3 and 5x5 are used.  
For the image with Gaussian noise:  
```matlab
P5 = medfilt2(Pc1, [3 3]);
imshow(P5);
P6 = medfilt2(Pc1, [5 5]);
imshow(P6);
```  
<img src = "https://github.com/StephanieMussi/Image_Spatial_Frequency_Filtering_MatLab/blob/main/Figures/gn_med1.png" width = 544 height = 365>
<img src = "https://github.com/StephanieMussi/Image_Spatial_Frequency_Filtering_MatLab/blob/main/Figures/gn_med2.png" width = 544 height = 365>  

For the image with speckle noise:  
```matlab
P7 = medfilt2(Pc2, [3 3]);
imshow(P7);
P8 = medfilt2(Pc2, [5 5]);
imshow(P8);
```  
<img src = "https://github.com/StephanieMussi/Image_Spatial_Frequency_Filtering_MatLab/blob/main/Figures/sp_med1.png" width = 544 height = 365>
<img src = "https://github.com/StephanieMussi/Image_Spatial_Frequency_Filtering_MatLab/blob/main/Figures/sp_med2.png" width = 544 height = 365>  

As observed, the median filtering significantly reduced speckle noise, but does not perform as well for Gaussian noise. When the kernel size increases, the image becomes more blurred (except the edges).  
Gaussian filtering blurs edges while median filtering preserves sharp edges. Besides, Gaussian filtering produces a black border around the image while median filtering does not.  
Median filtering rounds the corners (window corners in the images) more than Gaussian filtering.   
