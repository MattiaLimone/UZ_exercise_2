function result = laplacefilter(img, sigma)

g1 = gauss_2d(sigma);
g2 = gauss_2d(sigma*2);
g3 = zeros(size(g2));

[p,q] = size(g1);
g3((end-p)/2+1:(end-p)/2+p, (end-q)/2+1:(end-q)/2+q) = g1;

l = g2 - g3;
surf(l);
result = conv2(img, l, 'same');



end