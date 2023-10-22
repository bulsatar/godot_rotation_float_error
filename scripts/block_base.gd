extends Node2D
class_name block_base


var blocksize = 50
var label = null


func _ready():
	
	label = Label.new()
	self.add_child(label)
	label.size.x = blocksize
	label.size.y = blocksize

	
func _process(delta): 
	
	var parent_rotation = get_parent().rotation 
	set_rotation(-parent_rotation)

	var text = str("x: ",self.global_position.x,"\ny: ", self.global_position.y)
	label.text = text

func badblock(usesnap):
	var modx = fmod(self.global_position.x,10)
	var mody = fmod(self.global_position.y,10)
	var modrot = fmod(self.rotation_degrees,10)
	var isbad = false
	#comment out this if section to see that snapping rotation doesn't matter
	if(usesnap):
		modx = fmod(snapped(self.global_position.x,10),10)
		mody = fmod(snapped(self.global_position.y,10),10)
		modrot = fmod(snapped(self.rotation_degrees,10),10)
	if(modx > 0 || mody > 0 || modrot > 0):
		isbad = true
	return isbad
