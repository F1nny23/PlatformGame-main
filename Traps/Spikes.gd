extends Area2D

func ready():
	$AnimationPlayer.play("Spike")





func _on_Spikes_body_entered(body):
	if body.is_in_group("Player"):	
		if GameStats.check_reset() == false:
			body.global_position = GameStats.get_spawn().global_position
