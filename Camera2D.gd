extends Camera2D

onready var target = owner.get_node("player")
var zoomed = false
var center = Vector2.ZERO


func _ready():
	center = get_viewport().size/2
	
func _process(delta):
	if Input.is_action_just_pressed("zoom"):
		if zoomed:
			target = owner.get_node("player")
			zoomed = false
		else:
			target = owner.get_node("player")
			zoomed = true
	
	
	if zoomed:
		zoom = zoom.move_toward(Vector2(0.3, 0.3), .03)
		position = position.move_toward(target.global_position, 1000)
		
		
	else:
		zoom = zoom.move_toward(Vector2(1,1), 0.03)
		position = position.move_toward(target.global_position, 1000)
		position.y = center.y
