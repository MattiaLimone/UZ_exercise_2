function result = my_sharpen(img, sigma)
%% INBUILT FUNCTION VERSION
%kernel = [0 -1 0;-1 5 -1;0 -1 0]
%result = conv2(img,kernel);
%% MANUAL VERSION
R = ceil(sigma); 
filtSize = 2*R+1; %Size of matrix to create 

gaussFilt = fspecial('gaussian',filtSize,sigma); %Generate the gaussian

sharpFilt = zeros(filtSize); %Creating Matrix of same dimensione as gaussFilt
sharpFilt(R+1,R+1) = 1; %Make kernel with 1 in the center(Kernel sum must be 1 to sharp)
sharpFilt = sharpFilt - gaussFilt; %Substract Gaussian creating sharpen Kernel
%Example    |0  -1   0|
%           |-1  5  -1|
%           |0  -1   0|
sharpFilt(R+1,R+1) = sharpFilt(R+1,R+1) + 1;

result = conv2(img,sharpFilt,'same');
end