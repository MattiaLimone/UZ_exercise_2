function result = estimate_noise_variance(img, tileWidth)
imgDouble = double(img);
[height, width] = size(img);
numTileRows = floor(height / tileWidth);
numTileCols = floor(width / tileWidth);
samples = zeros(numTileRows, numTileCols);

for nTileRow = 1:numTileRows
    for nTileCol = 1:numTileCols
        rows = (nTileRow-1)*tileWidth+1 : nTileRow*tileWidth;
        cols = (nTileCol-1)*tileWidth+1 : nTileCol*tileWidth;
        tile = imgDouble(rows, cols);
        tileVar = std2(tile)^2;
        samples(nTileRow, nTileCol) = tileVar;
    end % nTileCol
end % nTileRow

samples = sort(samples(:), 'ascend');
result = samples(50);
