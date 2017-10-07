# Gesture recognition

Each gesture is about a half second.

At 19200 baud, that's about 17 samples.

Each sample has three axis => total input is 3 * 17 = 51 input neurons.

Let's try a hidden layer with double the output neurons.

51 -> 102 -> 1

Theta1: 102x52
Theta2: 1x103
