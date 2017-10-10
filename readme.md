# Wham Gesture Controller Helmet with lights

Allows the user to control lights on their helmet with gestures

## Setup

First ensure there is test data in ```train.txt``` and ```validation.txt```.

Then run:

```
octave setup.m
```

To generated the reshaped 'windowed' versions.

Then run:

```
octave main.m
```

To train against the windowed data.
