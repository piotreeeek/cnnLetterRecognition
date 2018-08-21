function [letter] = getLetterForApp(path)
    img = imread(path);
    letter = getLetter(img);
end