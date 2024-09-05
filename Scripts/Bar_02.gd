extends Node2D



func _ready():
	pass # Replace with function body.



func _process(_delta):
	pass

#-----------Переход стартовая комната -----------------
func _on_move_room_body_entered(_body):
	var node = get_node("YSort_Map/Player")
	if node.interaction and node.interaction_obj == $Interaction/Move_Room.global_position:
		call_deferred("_change_scene")
		


func _on_move_room_input_event(_viewport, _event, _shape_idx):
	if !Input.is_action_just_pressed("ui_leftMouseClick"):
		return
	var node = get_node("YSort_Map/Player")
	node.interaction = true
	node.interaction_obj = $Interaction/Move_Room.global_position


func _change_scene():
	var level1 = load("res://Level/Room_1.tscn")
	get_tree().change_scene_to_packed(level1)
#------------------------------------------------------
