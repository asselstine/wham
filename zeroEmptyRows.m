function [X, y] = zeroEmptyRows(X, y)
  nonZeroRows = find(y ~= 0);
  zeroRows = find(y == 0);
  % below keeps some of the zero rows
  % ratio = int16( size(zeroRows, 1) / size(nonZeroRows, 1) )
  % zeroRows(2:ratio:size(zeroRows, 1), :) = [];
  X(zeroRows, :) = [];
  y(zeroRows, :) = [];
end;
