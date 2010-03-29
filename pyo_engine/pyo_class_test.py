#!/usr/bin/env python

import pyo

server = pyo.Server()
server.boot()
server.start()

oscreceive = pyo.OscReceive(port = 3333, address = ['/1/fader1', '/1/fader2', '/1/fader3', '/1/fader4', '/1/toggle1', '/1/toggle2', '/1/toggle3', '/1/toggle4'])

class Voice():
    def __init__(self, instance, oscreceive):
        self.instance = instance
        self.oscreceive = oscreceive
        self.faderchange = pyo.Change(self.oscreceive['/1/fader{0}'.format(self.instance)])
        self.togglechange = pyo.Change(self.oscreceive['/1/toggle{0}'.format(self.instance)])
        
        self.triggerfader = pyo.TrigFunc(self.faderchange, self.fader_callback)
        self.triggertoggle = pyo.TrigFunc(self.togglechange, self.toggle_callback)
        
        self.fader = pyo.Fader(fadein = 1, fadeout = 1, dur = 0, mul = 0.2)
        self.sine = pyo.Sine(mul = self.fader)
        
        self.sine.out()
        
    def fader_callback(self):
        self.sine.freq = self.oscreceive.get('/1/fader{0}'.format(self.instance)) * 300 + 100
        
    def toggle_callback(self):
        if self.oscreceive.get('/1/toggle{0}'.format(self.instance)) == 1:
            self.fader.play()
        if self.oscreceive.get('/1/toggle{0}'.format(self.instance)) == 0:
            self.fader.stop()
            
sine1 = Voice(1, oscreceive)
sine2 = Voice(2, oscreceive)
sine3 = Voice(3, oscreceive)
sine4 = Voice(4, oscreceive)

server.gui(locals())
