extends Node2D

func _ready():
	$Swing.play("Swing")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   


func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		print("player dead")
