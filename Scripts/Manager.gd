extends Node

@onready var pause_menu = $".."


var game_pause: bool = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		game_pause = !game_pause
	
	
	if game_pause:
		get_tree().paused = true
		pause_menu.show()
	else:
		get_tree().paused = false
		pause_menu.hide()


func _on_resum_pressed():
	game_pause = !game_pause


func _on_quit_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://menu.tscn")
