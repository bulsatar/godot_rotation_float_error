extends Node2D
class_name piece_base

var blocks = []
var blocksize = 50


func _ready():
	for child in get_children():
		if child is Sprite2D:
			blocks.append(child)

	
func rotate_piece(usesnap):
	var modx = fmod(self.global_position.x,10)
	var mody = fmod(self.global_position.y,10)
	var modrot = fmod(self.rotation_degrees,10)
	var hasbadblock = false

	if(usesnap):
		modx = fmod(snapped(self.global_position.x,10),10)
		mody = fmod(snapped(self.global_position.y,10),10)
		modrot = fmod(snapped(self.rotation_degrees,10),10)
		
	for block in get_blocks():
		if(block.badblock(usesnap)): 
			hasbadblock = true
	if(!(modx > 0 || mody > 0 || hasbadblock || modrot > 0)):
		self.rotation_degrees += 90

	
func get_blocks():
	return blocks

