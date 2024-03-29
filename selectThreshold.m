% yval is expected to be a list of one-vs-all vectors
% pval is expected to be a list of one-vs-all vectors
function [bestEpsilon, bestF1] = selectThreshold(yval, pval)
  F1 = 0;
  bestF1 = 0;
  bestEpsilon = 0;
  stepsize = (max(max(pval)) - min(min(pval))) / 1000;
  for epsilon = min(pval):stepsize:max(pval)
    [F1, precision, recall] = calculateThreshold(pval, yval, epsilon);
    if F1 > bestF1
       bestF1 = F1;
       bestEpsilon = epsilon;
    end
end
