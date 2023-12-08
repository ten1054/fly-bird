extends RigidBody2D

@export var vy = -300
var max_rotation_deg = 20
var min_rotation_deg = -20

func _process(delta):
	if(Input.is_action_just_pressed("click")):
		if(Global.game_start):
			$AnimationPlayer.play("fly")
			fly()
	if linear_velocity.y > 0 and rotation_degrees < max_rotation_deg :
		angular_velocity = 1.5 
	elif linear_velocity.y < 0 and rotation_degrees > min_rotation_deg:
		angular_velocity = -1 
	else: 
		angular_velocity = 0

func fly():
	$Music.play()
	linear_velocity.y = vy


func score():
	Global.score += 1

func die():
	$Music.stop()
	Global.game_start = false
	$Die.play(0)
	await $Die.finished
	print("播放结束")
	get_tree().change_scene_to_file("res://tsn/end/end.tscn")
