extends Node2D


var piece_J = preload("res://scenes/piece_J.tscn")
var piece_O = preload("res://scenes/piece_O.tscn")
var tetrisPieces = [piece_J, piece_O]
var useJ = true

var col1_j = null
var col2_j = null
var col1_o = null
var col2_o = null
var col1_text = ""
var col2_text = ""

var counter = 0

func _ready():
	col1_j = piece_J.instantiate()
	col2_j = piece_J.instantiate()
	col1_o = piece_O.instantiate()
	col2_o = piece_O.instantiate()
	col1_text = get_node("Camera2D/col1_label")
	col2_text = get_node("Camera2D/col2_label")
	add_child(col1_j)
	add_child(col1_o)
	add_child(col2_j)
	add_child(col2_o)

	col1_j.position.x = -350
	col1_j.position.y = -100
	col2_j.position.x = 300
	col2_j.position.y = -100
	
	col1_o.position.x = -350
	col1_o.position.y = 150
	col2_o.position.x = 300
	col2_o.position.y = 150
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(counter > 50):
		
		col1_j.rotate_piece(false)
		col2_j.rotate_piece(true)
		col1_o.rotate_piece(false)
		col2_o.rotate_piece(true)
		counter = 0
	
	counter += 1
	col1_text.text = str("reg calc","\nL rot deg: ", col1_j.rotation_degrees,"\nO rot deg: ", col1_o.rotation_degrees)
	col2_text.text = str("With snap calc","\nL rot deg: ", col2_j.rotation_degrees,"\nO rot deg: ", col2_o.rotation_degrees)
	

		
