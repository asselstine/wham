% eliminate repeat values within a window of rows.
function [p] = debounce(ptrain, window = 8)
  p = ptrain;
  [m, k] = size(ptrain);
  for i = m:-1:2,
    p(i, :) = p(i, :) & ~any(p(max(1, i-window):i-1, :));
  end;
end;
