extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
const MOVE_SPEED = 250
const CROUCH_SPEED = 100
onready var SPEED = MOVE_SPEED
const JUMP_HEIGHT = -500

var motion = Vector2()


func _physics_process(delta):
	motion.y += GRAVITY
	if Input.is_action_pressed("ui_accept"):
		motion.x = SPEED * 5 
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
	else:
		motion.x = 0
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
			motion.x = -SPEED * 5
		else:
			if Input.is_action_just_pressed("ui_up"):
				motion.y = JUMP_HEIGHT
				motion.x = -SPEED * 5
		
	motion = move_and_slide(motion, UP)
	update_animation()
	pass
enum state {Idle, Run, Jump, Crouch}

func update_animation():
	if is_on_floor():
		if motion.x == 0: 
			$Sprite/AnimationPlayer.play("Idle")
		elif motion.x != 0:
			if Input.is_action_pressed("ui_down"):
				$Sprite/AnimationPlayer.play("Crouch")
				SPEED = CROUCH_SPEED
				print("bfvbhdfgd")
		
			else:
				print("bd")
				$Sprite/AnimationPlayer.play("Run")
				SPEED = MOVE_SPEED
	
			if motion.x <0:
				$Sprite.flip_h = true
			elif motion.x >0:
				$Sprite.flip_h = false
	if not is_on_floor():
		$Sprite/AnimationPlayer.play("Jump")

func _process(delta):
	if Input.is_action_just_pressed("reset"):
		GameStats.reset()

#func _on_Area2D_area_entered(area):
	#if area.is_in_group("Death"):
		#get_tree().reload_current_scene() # Replace with function body.
