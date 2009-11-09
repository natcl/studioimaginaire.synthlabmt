#!/usr/bin/env python

from pymt import *
import osc

host = '127.0.0.1'
port = 4444

class Note(MTButton):
    def __init__(self, **kwargs):
        super(Note, self).__init__(**kwargs)
        kwargs.setdefault('note_number', 60)
        kwargs.setdefault('round_notes', True)
        self.note_number = kwargs.get('note_number')
        self.round_notes = kwargs.get('round_notes')
        self.push_handlers(on_press =  self.note_on)
        self.push_handlers(on_release =  self.note_off)
        self.touchstarts = [] # only react to touch input that originated on this widget
        self.first_touch = None

    def note_on(self, touch):
        if self.round_notes:
            osc.sendMsg("/note", [self.note_number, 'on', 0.], host, port)
        else:
            osc.sendMsg("/note", [self.note_number, 'on', touch.sx], host, port)
        touch.userdata['first_touch'] = touch.sx

    def note_off(self, touch):
        if self.round_notes:
            osc.sendMsg("/note", [self.note_number, 'off', touch.sx - touch.userdata['first_touch']], host, port)
        else:
            osc.sendMsg("/note", [self.note_number, 'off', touch.sx], host, port)
                
    def on_touch_down(self, touch):
        if self.collide_point(touch.x, touch.y):
            self.touchstarts.append(touch.id)
            self._state = ('down', touch.id)
            self.dispatch_event('on_press', touch)
            return True

    def on_touch_move(self, touch):
        if touch.id in self.touchstarts:
            if self.round_notes:
                osc.sendMsg("/note", [self.note_number, 'bend', touch.sx - touch.userdata['first_touch']], host, port)
            else:
                osc.sendMsg("/note", [self.note_number, 'bend', touch.sx], host, port)

    def on_touch_up(self, touch):
        if self._state[1] == touch.id:
            self._state = ('normal', 0)
            self.dispatch_event('on_release', touch)
        if touch.id in self.touchstarts:
            self.touchstarts.remove(touch.id)

        
class NoteContainer(MTBoxLayout):
    def __init__(self, **kwargs):
        super(NoteContainer,self).__init__(**kwargs)
        kwargs.setdefault('note_range', 12)
        kwargs.setdefault('note_width', 50)
        kwargs.setdefault('base_note', 60)
        self.note_range = kwargs.get('note_range')
        self.note_width = kwargs.get('note_width')
        self.base_note = kwargs.get('base_note')

        for note in range(self.note_range):
            self.add_widget(Note(width = self.note_width, height = self.height, note_number = self.base_note + note))

if __name__ == '__main__':
    w = MTWindow(style = {'bg-color': (0,0,0,1)})
    
    notecontainer = NoteContainer(note_range = 12, note_width = 50, height = 600)
    
    w.add_widget(notecontainer)
    
    runTouchApp()