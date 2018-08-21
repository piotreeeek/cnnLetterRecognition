function [x, w, y, h] = getCropCoordinates(bw)
    [labeledImage, numberOfBlobs] = bwlabel(bw);
    measurements = regionprops(labeledImage, 'BoundingBox');
    boundingBox = [measurements.BoundingBox];

    all_x = boundingBox(1:4:end);
    all_y = boundingBox(2:4:end);
    all_width =  boundingBox(3:4:end);
    all_height = boundingBox(4:4:end);

    all_x2 = all_x + all_width;
    all_y2 = all_y + all_height;

    width = round(max(all_x2) - min(all_x));
    height = round(max(all_y2) - min(all_y));

    x = ceil(min(all_x)-(width/10));
    w = round(width+(width/5));
    y = ceil(min(all_y)-(height/10));
    h = round(height+(height/5));
end