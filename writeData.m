function [] = writeData(X, y, input_file, output_file)
  save(output_file, 'X', 'y');
  fprintf('Reshaped data from %s into %s\n', input_file, output_file);
end
