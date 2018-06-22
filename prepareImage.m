function [img] = prepareImage(fl)
bw = im2bw(fl);
[x y] = size(bw);
if sum(sum(bw)) > x*y/3
    bw = imcomplement(bw);
end

[labeledImage, numberOfBlobs] = bwlabel(bw);
measurements = regionprops(labeledImage, 'BoundingBox');
bbox = measurements.BoundingBox;
x1 = ceil(bbox(1)-(bbox(3)/20));
x2 = round(bbox(3)+(bbox(3)/10));
y1 = ceil(bbox(2)-(bbox(4)/20));
y2 = round(bbox(4)+(bbox(4)/10));
I2 = imcrop(bw, [x1, y1, x2, y2]);
I2 = uint8(255 * I2);
I2 = imresize(I2, [28 28]);
img = uint8(255 * I2);