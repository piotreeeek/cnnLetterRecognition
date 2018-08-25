function [images, images_test, labels, labels_test] =  loadTrainData()
    load('emnist-letters');

    temp = dataset.train.images;
    temp_test = dataset.test.images;
    labels = categorical(uint8(dataset.train.labels(:))');
    images = uint8(zeros(28,28, 1, 124800));
    labels_test = categorical(uint8(dataset.test.labels(:))');
    images_test = uint8(zeros(28,28, 1, 20800));
    for i = 1: size(temp, 1)
        images(:, :, i) = reshape(temp(i,:),[28,28,1]);

    end
    for j = 1: size(temp_test, 1)
        images_test(:, :, j) = reshape(temp_test(j,:),[28,28,1]);
    end
end
