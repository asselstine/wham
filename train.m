function [Theta1, Theta2] = train(input_layer_size, hidden_layer_size, num_labels, X, y, max_iterations = 200, lambda = 1)

  fprintf('\nTraining Neural Network... \n')

  initial_Theta1 = initWeights(input_layer_size, hidden_layer_size);
  initial_Theta2 = initWeights(hidden_layer_size, num_labels);

  initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];

  %  After you have completed the assignment, change the MaxIter to a larger
  %  value to see how more training helps.
  options = optimset('MaxIter', max_iterations);

  % Create "short hand" for the cost function to be minimized
  costFunction = @(p) nnCostFunction(p, ...
                                     input_layer_size, ...
                                     hidden_layer_size, ...
                                     num_labels, X, y, lambda);

  % Now, costFunction is a function that takes in only one argument (the
  % neural network parameters)
  [nn_params, cost] = fmincg(costFunction, initial_nn_params, options);
  % load('hidden2601iterations100weights.mat')

  % Obtain Theta1 and Theta2 back from nn_params
  Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                   hidden_layer_size, (input_layer_size + 1));

  Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                   num_labels, (hidden_layer_size + 1));

end;
