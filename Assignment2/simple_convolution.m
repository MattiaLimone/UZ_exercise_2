function conv = simple_convolution(img, kernel)
N = (length(kernel) - 1) / 2;
conv = zeros(1, length(img));
for i = N+1:length(img)-N
    i_left = max([1, i - N]);
    i_right = min([length(img), i + N]);
    conv(i) = sum(kernel .* img(i_left:i_right));
end
end