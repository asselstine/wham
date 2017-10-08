function [p] = applyThresholds(ptrain, epsilons)
  [m, k] = size(ptrain);
  p = zeros(m, k);
  for i = 1:k,
    p(:, i) = applyThreshold(ptrain(:, i), epsilons(i));
  end;
end
