function [epsilon] = selectThresholds(ytrain, ptrain)
  % size(ytrain) should == size(ptrain)
  [m, k] = size(ytrain);
  epsilon = zeros(k, 1);
  for i = 1:k,
    ys = ytrain(:, i);
    ps = ptrain(:, i);
    [bestEpsilon, bestF1] = selectThreshold(ys, ps);
    epsilon(i) = bestEpsilon;
  end;
end;
