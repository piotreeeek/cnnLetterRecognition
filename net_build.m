function [net] = net_build()
clear, clc;

[images, images_test, labels, labels_test] = loadTrainData();

layers = [
    imageInputLayer([28 28 1])
    
    convolution2dLayer(3,16,'Padding',1)
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(3,32,'Padding',1)
    batchNormalizationLayer
    reluLayer
    
    maxPooling2dLayer(2,'Stride',2)
    
    convolution2dLayer(3,64,'Padding',1)
    batchNormalizationLayer
    reluLayer
    dropoutLayer
    
    fullyConnectedLayer(26)
    softmaxLayer
    classificationLayer];

options = trainingOptions('rmsprop', ...
    'MaxEpochs',10, ...
    'ValidationData',{images_test, labels_test}, ...
    'ValidationFrequency',300, ...
    'Verbose',false, ...
    'Plots','training-progress');

net = trainNetwork(images,labels,layers,options);
save net.mat net;
