function [F1, precision, recall] = calculateThreshold(pval, yval, epsilon)
  matches = pval > epsilon;

  true_positives = sum(matches & yval);
  false_positives = sum(matches & ~yval);
  true_negatives = sum(~matches & ~yval);
  false_negatives = sum(~matches & yval);

  precision = true_positives / (true_positives + false_positives);
  recall = true_positives / (true_positives + false_negatives);

  F1 = (2 * precision * recall) / (precision + recall);
end
