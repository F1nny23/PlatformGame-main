extends Camera2D

onready var target = owner.get_node("Player")
var zoomed = false
var center = Vector2.ZERO


func _ready():
	center = get_viewport().size/2
	
func _process(delta):
	if Input.is_action_just_pressed("zoom"):
		if zoomed:
			target = owner.get_node("Player")
			zoomed = false
		else:
			target = owner.get_node("Player")
			zoomed = true
	
		
		
	else:
		zoom = zoom.move_toward(Vector2(1,1), 0.03)
		position = position.move_toward(target.global_position, 1000)
		position.y = center.y
