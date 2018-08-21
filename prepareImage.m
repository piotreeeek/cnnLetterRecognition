function [img, err] = prepareImage(fl)
    err = 0;
   if size(fl, 3) == 3
        fl = rgb2gray(fl);
    end
    bw = imbinarize(fl);
    [x y] = size(bw);
    if sum(sum(bw)) > x*y/3
        bw = imcomplement(bw);
    end
    if sum(sum(bw)) > 0
        [labeledImage, numberOfBlobs] = bwlabel(bw);
        measurements = regionprops(labeledImage, 'BoundingBox');
        bbox = measurements.BoundingBox;
        x1 = ceil(bbox(1)-(bbox(3)/10));
        x2 = round(bbox(3)+(bbox(3)/5));
        y1 = ceil(bbox(2)-(bbox(4)/10));
        y2 = round(bbox(4)+(bbox(4)/5));
        I2 = imcrop(bw, [x1, y1, x2, y2]);

        imgSize = size(I2);
        imgSizeMax = max(imgSize)
        I3 = uint8(zeros(imgSizeMax));

        I2 = uint8(255 * I2);
        x1 = floor((imgSizeMax-imgSize(1))/2)+1;
        x2 = floor((imgSizeMax-imgSize(1))/2)+imgSize(1);
        y1 = floor((imgSizeMax-imgSize(2))/2)+1;
        y2 = floor((imgSizeMax - imgSize(2))/2)+imgSize(2);
        I3(x1:x2,y1:y2) = I2;
        I2 = imresize(I3, [28 28]);
        img = uint8(255 * I2);
    else
        img = 0;
        err = 'Image blank';
    end
end