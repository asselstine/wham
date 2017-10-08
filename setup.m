window_size = 17;
num_labels = 2;
prepareData(window_size, num_labels, 'train.txt', 'train.reshaped.mat');
prepareData(window_size, num_labels, 'validation.txt', 'validation.reshaped.mat');
