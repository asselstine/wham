window_size = 14;
input_layer_size = window_size * 3;
hidden_layer_size = 6;
num_labels = 2;
lambda = 1;

trainingData = load('train.reshaped.mat');
Xtrain = trainingData.X;
ytrain = trainingData.y;
[m, n] = size(Xtrain);

[Theta1, Theta2] = train(input_layer_size, hidden_layer_size, num_labels, Xtrain, ytrain, 400, lambda);

ptrain = predict(Theta1, Theta2, Xtrain);

% epsilons = selectThresholds(ytrain, ptrain);
epsilons = [0.5, 0.5]

ptrain = applyThresholds(ptrain, epsilons);
% ptrain = debounce(ptrain);
%
disp('Training data:');
summarize(ytrain, ptrain);
%
validationData = load('validation.reshaped.mat');
Xval = validationData.X;
yval = validationData.y;

pval = predict(Theta1, Theta2, Xval);
pval = applyThresholds(pval, epsilons);
disp('Validation data:');
summarize(yval, pval);

csvwrite('theta1.csv', Theta1);
csvwrite('theta2.csv', Theta2);

% plot learning curve:
jtrain = zeros(m, 1);
jval = zeros(m, 1);

for i = 1:m,
  fprintf('Building Training Curve for %i/%i\n', i, m)
  Xt = Xtrain(1:i, :);
  yt = ytrain(1:i, :);
  [Theta1, Theta2] = train(input_layer_size, hidden_layer_size, num_labels, Xt, yt, 100, lambda);
  nn_params =[Theta1(:) ; Theta2(:)];
  jtrain(i, :) = nnCostFunction(nn_params, input_layer_size, hidden_layer_size, num_labels, Xt, yt, lambda);
  jval(i, :) = nnCostFunction(nn_params, input_layer_size, hidden_layer_size, num_labels, Xval, yval, lambda);
end;

hold off;
plot(jtrain);
hold on;
plot(jval);

pause;
