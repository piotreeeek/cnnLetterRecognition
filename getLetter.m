function[letter] = getLetter(img)

letters = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm' ,'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'];

if exist('net.mat', 'file') == 2
    load('net.mat');
else
    net = net_build();
end

img = prepareImage(img);
letter = letters(classify(net, img));