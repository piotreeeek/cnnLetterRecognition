%Error codes:
%0 - image is ok
%1 - blank image
function[letter, err] = getLetter(img)

    letters = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm' ,'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'];

    if exist('net.mat', 'file') == 2
        load('net.mat');
    else
        net = netBuild();
    end

    [img, err] = prepareImage(img);
    if err ~= 0 
        letter = '-1';
    else
        letter = letters(classify(net, img));
    end
end