function result = gaussfilter_RGB(img, sigma)
g = gauss(sigma);
result = imgaussfilt(img,sigma);
%result = ones(size(img));
%for i = 1:3
%    img(:, :, i) = conv2(img(:, :, i), g.', 'same');
%    result(:, :, i) = conv2(img(:, :, i), g, 'same');
%end
%figure(1); imagesc(img);
%pause(1);
%close(1);
end