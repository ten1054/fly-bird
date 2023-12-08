extends Node2D
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_just_pressed("click")):
		get_tree().change_scene_to_file("res://tsn/main/main.tscn")
		Global.game_start = true
