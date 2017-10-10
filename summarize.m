function [] = summarize(y, p)
  recall = length(find(p == 1)) / length(find(y == 1));
  fprintf('Ratio of found / actual: %f\n', recall);
end;
