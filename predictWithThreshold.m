function [p] = predictWithThreshold(Theta1, Theta2, epsilons, X)
  p = predict(Theta1, Theta2, X);
  p = p(:, 2:end); % chop off nothing class
  p = applyThresholds(p, epsilons);
  p = debounce(p);
