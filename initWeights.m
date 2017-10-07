function [W] = initWeights(input_size, output_size)
  epsilon_init = 0.12;
  W = rand(output_size, 1 + input_size) * 2 * epsilon_init - epsilon_init;
