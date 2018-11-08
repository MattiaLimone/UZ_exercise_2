function imgOut = morphological_sharpness_enhance(img)
numIterations = 10;
SE = strel('disk', 3);

for nIter = 1:numIterations
	imgDilate = imdilate(img, SE);
    imgErode = imerode(img, SE);
	imgMid = 0.5*(imgDilate + imgErode);
    idxDilate = find(img >= imgMid);
    idxErode = find(img < imgMid);
    img(idxDilate) = imgDilate(idxDilate);
    img(idxErode) = imgErode(idxErode);
end % nIter

imgOut = img;