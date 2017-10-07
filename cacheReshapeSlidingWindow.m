function [Result] = cacheReshapeSlidingWindow(X, row_window_size, filename)
  if exist(filename)
    load(filename);
  else
    Result = reshapeSlidingWindow(X, row_window_size);
    save(filename, 'Result');
  end;
