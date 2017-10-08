input_layer_size = 51;
hidden_layer_size = 30;
num_labels = 2;

trainingData = load('train.reshaped.mat');
Xtrain = trainingData.X;
ytrain = trainingData.y;

[Theta1, Theta2] = train(input_layer_size, hidden_layer_size, num_labels, Xtrain, ytrain, 400, 3);

ptrain = predict(Theta1, Theta2, Xtrain);

% only look at first label
ptrain = ptrain(:, 2:end);
ytrain = ytrain(:, 2:end);
epsilons = selectThresholds(ytrain, ptrain);
p = applyThresholds(ptrain, epsilons);
p = debounce(p);

recall = length(find(p == 1)) / length(find(ytrain == 1));

fprintf('Potential Recall: %f\n', recall * 100)
