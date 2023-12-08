extends Node2D
var obstacle_preload = preload("res://tsn/main/obstacle.tscn")

func _on_timer_timeout(): 
	if(Global.game_start):
		var obtacle = obstacle_preload.instantiate()
		obtacle.position = Vector2(get_viewport().size.x + 100 , 0)
		add_child(obtacle)

