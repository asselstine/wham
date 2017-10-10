function [Y] = labelVectorToY(y, num_labels)
  if ~all(y) % check if there are zeros
    y = y + 1;
  end;
  if num_labels > 1
    L = eye(num_labels);
  else
    L = [0; 1];
  end;
  Y = L(y,:);
