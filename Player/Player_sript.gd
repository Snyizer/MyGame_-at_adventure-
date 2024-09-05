extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
@onready var nav: NavigationAgent2D = $NavigationAgent2D


var destination = Vector2()
var speed = 225

var interaction: bool 
var interaction_obj = Vector2()



func _ready():
	interaction = false
	nav.set_target_position(global_position)

func _process(_delta):
	if Input.is_action_just_pressed("ui_leftMouseClick") and SignalBas.Block:
		nav.set_target_position(get_global_mouse_position())
		nav.set_target_position(nav.get_final_position())
		
		if interaction:
			if  !interaction_obj.distance_to(get_global_mouse_position()) < 100:
				interaction = false
			
	
	if int(nav.distance_to_target()) > 2:
		
		
		var next_location = nav.get_next_path_position() - global_position
		next_location = next_location.normalized()
		if(abs(next_location.x) * 2 > abs(next_location.y)):
			anim.play("Side")
			$AnimatedSprite2D.flip_h = next_location.x < 0
		else:
			anim.play("Forward" if next_location.y > 0 else "Back")
			
		velocity = velocity.lerp(next_location * speed,7 * _delta)
	else:
		velocity.x = 0
		velocity.y = 0
		anim.play("Idle")
	
	
	move_and_slide()
