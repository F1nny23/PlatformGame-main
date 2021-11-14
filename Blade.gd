extends Node2D
export (int) var follow_speed = 50

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Spin")
	
func _process(delta):
	$Path2D/PathFollow2D.offset += follow_speed * delta


func _on_Area2D_body_entered(body):
	pass

