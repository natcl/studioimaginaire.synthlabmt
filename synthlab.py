from __future__ import with_statement
from pymt import *
import os
import osc

host = '127.0.0.1'
port = 4444

class Workspace(MTScatterPlane):
    def __init__(self, **kwargs):
        super(Workspace,self).__init__( **kwargs)
        osc.init()
        self.modules = []
        
    def remove_widget(self, widget):
        if widget.parents != []:
            for parent in widget.parents:
                for index, module in enumerate(parent.signal_connections):
                    if module[0] == widget:
                        parent.signal_connections.pop(index)
                for index, module in enumerate(parent.control_connections):
                    if module[0] == widget:
                        parent.control_connections.pop(index)
        self.modules.remove(widget)
        osc.sendMsg("/delete", [widget.category, widget.instance], host, port)
        
        super(Workspace, self).remove_widget(widget)

        
        
class Module(MTSvg):
    def __init__(self, **kwargs):
        super(Module,self).__init__(**kwargs)
        self.category = kwargs.get('category')
        self.type = kwargs.get('type')
        self.instance = kwargs.get('instance')
        self.touchstarts = [] # only react to touch input that originated on this widget
        self.mode = 'move'
        self.drag_x = 0
        self.drag_y = 0
        self.control_connections = []
        self.signal_connections = []
        self.parents = []
        
    def draw(self):
        if self.mode == 'draw_connection':
            set_color(1,1,1,1)
            x1 = self.x + self.width / 2
            y1 = self.y + 1
            x2 = self.drag_x
            y2 = self.drag_y
            drawLine([x1, y1, x2, y2], width = 1)
        
        set_color(1,1,1,1)
        for module in self.control_connections:
            drawLine(self.return_connection_coordinates(module), width = 1)
        
        for module in self.signal_connections:
            drawLine(self.return_connection_coordinates(module, 'signal'), width = 1)
        
        super(Module, self).draw()
    
    def return_connection_coordinates(self, m2, type='control'):
        x1 = self.x +self.width / 2
        y1 = self.y + 1
        if m2[0].category == 'source':
            x2 = m2[0].x + 16 + (m2[1] - 1) * 16
            y2 = m2[0].y + m2[0].height - 1
        if m2[0].category == 'effect':
            x2 = m2[0].x + m2[0].width - 4
            y2 = m2[0].y + m2[0].height - 20 - (m2[1] - 1) * 13
        if type == 'signal':
            x2 = m2[0].x + self.width / 2. 
            y2 = (m2[0].y + m2[0].height) - 1
        
        return (x1, y1, x2, y2)
        
    def line_collision_with_point(self, x1, y1, x2, y2, x, y):
        # If line is vertical
        if x1 == x2:
            print 'hey'
            print y, y1, y2
            _max = max(y1,y2)
            _min = min(y1,y2)
            if y > _min and y < _max:
                return True
            else:
                return False
        m = float((y2 - y1)) / float((x2 - x1))
        b = y1 - m*x1
        result = abs(int(y) - int(m * x + b))

        if result < 10:
            return True
        else:
            return False
            
    def on_touch_down(self, touch):
        #Delete connections
        if touch.is_double_tap:
            for connection in self.signal_connections:
                x1,y1,x2,y2 = self.return_connection_coordinates(connection, type='signal')
                if self.line_collision_with_point(x1, y1, x2, y2, touch.x, touch.y):
                    self.signal_connections.remove([connection[0], connection[1]])
                    osc.sendMsg("/disconnect", [self.category, self.instance, connection[0].category, connection[0].instance], host, port)
            for connection in self.control_connections:
                x1,y1,x2,y2 = self.return_connection_coordinates(connection, type='control')
                if self.line_collision_with_point(x1, y1, x2, y2, touch.x, touch.y):
                    self.control_connections.remove([connection[0], connection[1]])
                    osc.sendMsg("/disconnect", [self.category, self.instance, connection[0].category, connection[0].instance, connection[1]], host, port)
        
        if self.collide_point(touch.x,touch.y):
            self.touchstarts.append(touch.id)
            
            if touch.is_double_tap:
                self.parent.remove_widget(self)
                                
            self.first_x = touch.x
            self.first_y = touch.y
            self.first_pos_x = self.x
            self.first_pos_y = self.y
            if self.category is not 'output':
                # Lower section
                if touch.y < self.y + 20:
                    self.mode = 'draw_connection'
                    self.drag_x = touch.x
                    self.drag_y = touch.y
                # Middle section        
                else:
                    self.mode = 'move'
            return True
        
    def on_touch_move(self, touch):
        if touch.id in self.touchstarts:
            delta_x = touch.x - self.first_x
            delta_y = touch.y - self.first_y
            if self.mode == 'move':
                self.x = self.first_pos_x + delta_x
                self.y = self.first_pos_y + delta_y
            if self.mode == 'draw_connection':
                self.drag_x = touch.x
                self.drag_y = touch.y
            return True
            
    def on_touch_up(self, touch):
        if self.mode == 'draw_connection':
            for m in self.parent.modules:                    
                if m.collide_point(touch.x,touch.y) and m != self and m.category != 'controller':
                    # Control connections
                    if self.category == 'controller' and m.category != 'output':
                        if m.category == 'source':
                            inlet_calc = int(round((touch.x - m.x) / ((m.width - 10) / 4.)))
                            if inlet_calc >= 1 and inlet_calc <= 4:
                                inlet = inlet_calc
                            else: inlet = None
                        if m.category == 'effect':
                            inlet_calc = int(round((m.height - (touch.y - m.y)) / (m.height / 5.)))
                            if inlet_calc >= 1 and inlet_calc <= 4:
                                inlet = inlet_calc
                            else: inlet = None
                        if inlet:
                            if [m, inlet] not in self.control_connections:
                                self.control_connections.append([m, inlet])
                                m.parents.append(self)
                                osc.sendMsg("/connect", [self.category, self.instance, m.category, m.instance, inlet], host, port)
                    # Signal connections
                    if self.category == 'source' or self.category == 'effect':
                        if m.category != 'source':
                            inlet = 0
                            if [m, inlet] not in self.signal_connections:
                                self.signal_connections.append([m, inlet])
                                m.parents.append(self)
                                osc.sendMsg("/connect", [self.category, self.instance, m.category, m.instance], host, port)
                        
        if touch.id in self.touchstarts:
            self.touchstarts.remove(touch.id)
            self.mode = 'move'
            return True
        
class ModulePick(MTSvg):
    def __init__(self, **kwargs):
        super(ModulePick,self).__init__(**kwargs)
        self.workspace_cb = kwargs.get('workspace_cb')
        self.category = kwargs.get('category')
        self.touchstarts = [] # only react to touch input that originated on this widget
        self.drag_x = 0
        self.drag_y = 0
        self.original_pos = self.pos
        self.instance_count = 1
        
        self.icons = {'source':'icons/sl-addSynth+.svg', 'effect':'icons/sl-distort+.svg', 'controller':'icons/sl-lfo+.svg', 'output':'icons/sl-speaker.svg'}
        
    def draw(self):      
        super(ModulePick, self).draw()
        
    def on_touch_down(self, touch):        
        if self.collide_point(touch.x,touch.y):
            self.touchstarts.append(touch.id)
            self.first_x = touch.x
            self.first_y = touch.y
            self.first_pos_x = self.x
            self.first_pos_y = self.y
            return True
        
    def on_touch_move(self, touch):
        if touch.id in self.touchstarts:
            delta_x = touch.x - self.first_x
            delta_y = touch.y - self.first_y
            self.x = self.first_pos_x + delta_x
            self.y = self.first_pos_y + delta_y
            return True
            
    def on_touch_up(self, touch):                     
        if touch.id in self.touchstarts:
            self.workspace_cb.modules.append(Module(pos = (touch.x, touch.y), filename = self.icons[self.category], category = self.category, instance = self.instance_count))
            self.workspace_cb.add_widget(self.workspace_cb.modules[len(self.workspace_cb.modules)-1])
            osc.sendMsg("/create", [self.category, self.instance_count], host, port)
            self.pos = self.original_pos
            self.instance_count += 1
            self.touchstarts.remove(touch.id)
            return True

class MasterControls(MTBoxLayout):
    def __init__(self, **kwargs):
        super(MasterControls,self).__init__(**kwargs)
        self.workspace_cb = kwargs.get('workspace_cb')
        self.volume = MTSlider(min = 0, max = 1, height = 200)
        self.dspactive = MTToggleButton(label = 'DSP', size = (50,50))
        self.clear_modules = MTButton(label = 'Clear', size = (50,50))
        @self.volume.event
        def on_value_change(value):
            osc.sendMsg("/master/volume", [value], host, port)
        @self.dspactive.event
        def on_press(value):
            if self.dspactive.state == 'down':
                osc.sendMsg("/master/dspactive", [1], host, port)
            else:
                osc.sendMsg("/master/dspactive", [0], host, port)
        @self.clear_modules.event
        def on_press(value):
            for module in self.workspace_cb.modules[:]:
                self.workspace_cb.remove_widget(module)
        
        self.add_widget(self.volume)
        self.add_widget(self.dspactive)
        self.add_widget(self.clear_modules)
        
class ModulePicker(MTWidget):
    def __init__(self, **kwargs):
        super(ModulePicker,self).__init__(**kwargs)
        self.workspace_cb = kwargs.get('workspace_cb')
        self.touchstarts    = [] # only react to touch input that originated on this widget
        
        self.spacing = 4

        self.source_img = MTSvg(filename = 'icons/sl-addSynth+.svg', pos = self.pos)
        self.effect_img = MTSvg(filename = 'icons/sl-distort+.svg', pos = (self.x + self.source_img.width + self.spacing, self.y))
        self.controller_img = MTSvg(filename = 'icons/sl-lfo+.svg', pos = (self.effect_img.x + self.source_img.width + self.spacing, self.y))
        self.output_img = MTSvg(filename = 'icons/sl-speaker.svg', pos = (self.controller_img.x + self.source_img.width + self.spacing, self.y - 10))
        
        self.source = ModulePick(filename = 'icons/sl-addSynth+.svg', pos = self.pos, workspace_cb = self.workspace_cb, category = 'source')
        self.effect = ModulePick(filename = 'icons/sl-distort+.svg', pos = (self.x + self.source.width + self.spacing, self.y), workspace_cb = self.workspace_cb, category = 'effect')
        self.controller = ModulePick(filename = 'icons/sl-lfo+.svg', pos = (self.effect.x + self.source.width + self.spacing, self.y), workspace_cb = self.workspace_cb, category = 'controller')
        self.output = ModulePick(filename = 'icons/sl-speaker.svg', pos = (self.controller.x + self.source.width + self.spacing, self.y - 10), workspace_cb = self.workspace_cb, category = 'output')
                       
        self.add_widget(self.source_img)
        self.add_widget(self.effect_img)
        self.add_widget(self.controller_img)
        self.add_widget(self.output_img)
        
        self.add_widget(self.source)
        self.add_widget(self.effect)
        self.add_widget(self.controller)
        self.add_widget(self.output)
              
    
w = MTWindow(style = {'bg-color': (0,0,0,1)})
workspace = Workspace(do_rotation = False, auto_bring_to_front = False)
mastercontrols = MasterControls(pos = (2,2), spacing = 4, workspace_cb = workspace)
modulepicker = ModulePicker(pos = (140,2), workspace_cb = workspace) 


w.add_widget(workspace)
w.add_widget(mastercontrols)
w.add_widget(modulepicker)


runTouchApp()
