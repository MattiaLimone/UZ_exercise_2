function result = median_2d(image, width)
N = (width-1)/2;
[h, w] = size(image);
result = zeros(h, w);
for j = 1:h
    for i = 1:w
        i_left = max([1, i - N]);
        i_right = min([w, i + N]);
        i_up = max([1, j - N]);
        i_down = min([h, j + N]);
        kernel = image(i_left:i_right, i_up:i_down);
        
        result(i, j) = median(kernel(:));
    end
end

end