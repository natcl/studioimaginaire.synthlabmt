#!/usr/bin/env python

from pymt import *
from pyo import *

voices = 10

s = Server(nchnls = 2).boot()
s.start()

sines = []
for x in range(voices):
    sines.append(Sine(mul = 0, freq = 100*(x+1)))
    sines[x].out()

mt = MTMultiSlider(sliders = voices)

@mt.event
def on_value_change(values):
    for slider in range(voices):
        sines[slider].mul = values[slider] * 0.2

w = MTWindow()
w.add_widget(mt)

if __name__ == '__main__':
    runTouchApp()