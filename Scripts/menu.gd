extends Node2D




#func _ready():



func _on_quit_pressed():
	get_tree().quit()


func _on_play_pressed():
	var levl1 = load("res://Level/Room_1.tscn")
	get_tree().change_scene_to_packed(levl1)
