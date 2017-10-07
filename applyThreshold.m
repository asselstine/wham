function [p] = applyThreshold(ptrain, epsilon)
  indices = (ptrain > epsilon);
  p = zeros(size(ptrain, 1), 1);
  p(indices, :) = 1;
end
