function [X, y] = readData(window_size, input_file)
  Xoriginal = csvread(input_file);
  Xoriginal(:, 4) = []; % remove timestamp
  X = reshapeSlidingWindow(Xoriginal(:, 1:end-1), window_size);
  y = Xoriginal(window_size:end, end);
end;
