#!/usr/bin/env python

#!/usr/bin/env python

import pyo

server = pyo.Server()
server.boot()
server.start()

addresses =  ['/1/fader1', '/1/fader2', '/1/fader3', '/1/fader4','/1/fader5', '/1/toggle1', '/1/toggle2', '/1/toggle3', '/1/toggle4']
oscreceive = pyo.OscReceive(port = 3333, address = addresses)

triggers = []

def connect(osc, address, callback):
    triggers.append(pyo.TrigFunc(pyo.Change(osc[address]), callback))
    
f1 = pyo.Fader(fadein = 1, fadeout = 1, dur = 0, mul = 0.2)
f2 = pyo.Fader(fadein = 1, fadeout = 1, dur = 0, mul = 0.2)
f3 = pyo.Fader(fadein = 1, fadeout = 1, dur = 0, mul = 0.2)
f4 = pyo.Fader(fadein = 1, fadeout = 1, dur = 0, mul = 0.2)
sine1 = pyo.Sine(mul = f1)
sine2 = pyo.Sine(mul = f2) 
sine3 = pyo.Sine(mul = f3)
sine4 = pyo.Sine(mul = f4)
sine1.out()
sine2.out()
sine3.out()
sine4.out()

def fader1_callback():
    sine1.freq = oscreceive.get('/1/fader1') * 300 + 100
def fader2_callback():
    sine2.freq = oscreceive.get('/1/fader2') * 300 + 100
def fader3_callback():
    sine3.freq = oscreceive.get('/1/fader3') * 300 + 100
def fader4_callback():
    sine4.freq = oscreceive.get('/1/fader4') * 300 + 100
    
def toggle1_callback():
    print oscreceive.get('/1/toggle1')
    if oscreceive.get('/1/toggle1') == 1:
        f1.play()
    if oscreceive.get('/1/toggle1') == 0:
        f1.stop()
def toggle2_callback():
    if oscreceive.get('/1/toggle2') == 1:
        f2.play()
    if oscreceive.get('/1/toggle2') == 0:
        f2.stop()
def toggle3_callback():
    if oscreceive.get('/1/toggle3') == 1:
        f3.play()
    if oscreceive.get('/1/toggle3') == 0:
        f3.stop()
def toggle4_callback():
    if oscreceive.get('/1/toggle4') == 1:
        f4.play()
    if oscreceive.get('/1/toggle4') == 0:
        f4.stop()

def fader5_callback():
    f1.setFadein(oscreceive.get('/1/fader5'))
    f2.setFadein(oscreceive.get('/1/fader5'))
    f3.setFadein(oscreceive.get('/1/fader5'))
    f4.setFadein(oscreceive.get('/1/fader5'))
    f1.setFadeout(oscreceive.get('/1/fader5'))
    f2.setFadeout(oscreceive.get('/1/fader5'))
    f3.setFadeout(oscreceive.get('/1/fader5'))
    f4.setFadeout(oscreceive.get('/1/fader5'))
    
connect(oscreceive, '/1/fader1', fader1_callback)
connect(oscreceive, '/1/toggle1', toggle1_callback)
connect(oscreceive, '/1/fader2', fader2_callback)
connect(oscreceive, '/1/toggle2', toggle2_callback)
connect(oscreceive, '/1/fader3', fader3_callback)
connect(oscreceive, '/1/toggle3', toggle3_callback)
connect(oscreceive, '/1/fader4', fader4_callback)
connect(oscreceive, '/1/toggle4', toggle4_callback)
connect(oscreceive, '/1/fader5', fader5_callback)

server.gui(locals())