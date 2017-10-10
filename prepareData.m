function [] = prepareData(window_size, num_labels, input_file, output_file)
  [X, y] = readData(window_size, input_file);
  [X, y] = zeroEmptyRows(X, y);
  y = labelVectorToY(y, num_labels);
  writeData(X, y, input_file, output_file);
end;
