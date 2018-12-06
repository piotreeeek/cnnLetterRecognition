%Error codes:
%0 - image is ok
%1 - blank image
function[letter, err] = getLetter(img)

    letters = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M' ,'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];

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