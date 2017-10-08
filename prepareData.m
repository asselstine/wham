function [] = prepareData(window_size, num_labels, input_file, output_file)
  Xoriginal = csvread(input_file);
  % ignore category and timestamp
  X = reshapeSlidingWindow(Xoriginal(:, 1:end-2), window_size);
  y = labelVectorToY(Xoriginal(window_size:end, end), num_labels);
  save(output_file, 'X', 'y', 'window_size');
  fprintf('Reshaped data from %s into %s\n', input_file, output_file)
