function result = simple_median(signal, width)
N = (width-1)/2;
result = zeros(1, length(signal));
for i = N+1:length(signal)-N
    i_left = max([1, i - N]);
    i_right = min([length(signal), i + N]);
    result(i) = median(signal(i_left:i_right));
end

end