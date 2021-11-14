extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("CheckPoint")
	
func _process(delta):
	if GameStats.get_spawn() != self:
		$AnimationPlayer.play("CheckPoint")
		
	

func _on_SavePoint_body_entered(body):
	if body.is_in_group("Player"):
		GameStats.set_spawn(self)
		$AnimationPlayer.play("Saved")
