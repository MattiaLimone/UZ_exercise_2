function mat = gauss_2d(sigma)
% Function takes from internet and edited by Miroslav Purkrabek
% Original function on http://bit.ly/2AOJL2n

N = round(3.0*sigma);
mat = zeros(2*N+1, 2*N+1);
center = [N+1, N+1];
gsize = size(mat);

[R,C] = ndgrid(1:gsize(1), 1:gsize(2));
mat = gaussC(R,C, sigma, center);
mat = mat / (sum(sum(mat)));

    function val = gaussC(x, y, sigma, center)
        xc = center(1);
        yc = center(2);
        exponent = ((x-xc).^2 + (y-yc).^2)./(2*sigma);
        val       = (exp(-exponent));
    end

end