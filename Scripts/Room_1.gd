extends Node2D


func _ready():
	SignalBas.Block = true
	SignalBas.Test_file = SignalBas.load_json_file( "res://Texst/Texst_1.json")


#---------------Переход в бар ----------------
func _on_area_2d_body_entered(_body):
	var node = get_node("YSort_Map/Player")
	if node.interaction and node.interaction_obj == $Interaction/Move_Bar.global_position:
		call_deferred("_change_scene")


func _on_area_2d_input_event(_viewport, _event, _shape_idx):
	if !Input.is_action_just_pressed("ui_leftMouseClick"):
		return
	var node = get_node("YSort_Map/Player")
	node.interaction = true
	node.interaction_obj = $Interaction/Move_Bar.global_position

func _change_scene():
	var level2 = load("res://Level/Bar_02.tscn")
	get_tree().change_scene_to_packed(level2)
# -------------------------------------------------

#---------------Посмотреть на дверь  ----------------
func _on_door_body_entered(_body):
	var node = get_node("YSort_Map/Player")
	if node.interaction and node.interaction_obj == $Interaction/Door.global_position:
		$UI/Dialog_Box.TextOutput(SignalBas.Test_file["door"])


func _on_door_input_event(_viewport, _event, _shape_idx):
	if !Input.is_action_just_pressed("ui_leftMouseClick"):
		return
	var node = get_node("YSort_Map/Player")
	node.interaction = true
	node.interaction_obj = $Interaction/Door.global_position
# -------------------------------------------------
