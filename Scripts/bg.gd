extends ParallaxBackground




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	scroll_offset.x -= 100 * _delta
