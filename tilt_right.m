window_size = 17;
input_layer_size = 51;
hidden_layer_size = 400;
num_labels = 1;

Xtrain_original = csvread('tilt_right.txt');

Xtrain = cacheReshapeSlidingWindow(Xtrain_original(:, 1:end-2), window_size, 'tilt_right.reshaped.mat');
ytrain = Xtrain_original(window_size:end, end);
% need to create a set of data that mimics the sliding window.

% plot(X(:, 4), X(:, 1))

% checkNNGradients

fprintf('\nTraining Neural Network... \n')

initial_Theta1 = initWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = initWeights(hidden_layer_size, num_labels);

initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];

%  After you have completed the assignment, change the MaxIter to a larger
%  value to see how more training helps.
options = optimset('MaxIter', 200);

%  You should also try different values of lambda
lambda = 1;

% Create "short hand" for the cost function to be minimized
costFunction = @(p) nnCostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, Xtrain, ytrain, lambda);

% Now, costFunction is a function that takes in only one argument (the
% neural network parameters)
[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);
% load('hidden2601iterations100weights.mat')

% Obtain Theta1 and Theta2 back from nn_params
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

ptrain = predict(Theta1, Theta2, Xtrain);

[epsilon, dummy] = selectThreshold(ytrain, ptrain);
[p] = applyThreshold(ptrain, epsilon);
[F1, precision, recall] = calculateThreshold(p, ytrain, epsilon);

fprintf('Train Precision %f\n', precision * 100)
fprintf('Train Recall %f\n', recall * 100)



Xval_original = csvread('tilt_right.validation.txt');
Xval = cacheReshapeSlidingWindow(Xval_original(:, 1:end-2), window_size, 'tilt_right.validation.reshaped.mat');
yval = Xval_original(window_size:end, end);

pval = predict(Theta1, Theta2, Xval);
[p] = applyThreshold(pval, epsilon);
[F1, precision, recall] = calculateThreshold(p, yval, epsilon);

fprintf('Validation Precision %f\n', precision * 100)
fprintf('Validation Recall %f\n', recall * 100)
