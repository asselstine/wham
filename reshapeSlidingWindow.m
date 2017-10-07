function [Result] = reshapeSlidingWindow(X, row_window_size)
  [m, n] = size(X);
  cols = row_window_size * n;
  Result = [];
  for i = row_window_size:1:m,
    Result = [Result; reshape(X((i-row_window_size+1):i, :), 1, cols)];
  end;
