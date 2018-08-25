function [letter, err] = getLetterForApp(path)
    img = imread(path);
    [letter, err] = getLetter(img);
end