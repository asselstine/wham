function [Y] = labelVectorToY(y, num_labels)
  if ~all(y)
    y = y + 1;
  end;
  Y = eye(num_labels)(y,:);
