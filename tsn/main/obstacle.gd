extends Node2D

var speed = -100
var obstacle = preload("res://tsn/main/piping.tscn")
func _ready():
	create_double()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += speed * delta
	if(position.x < -100):
		queue_free()


func create_double():
	var h = randi() % 150 + 70 # 100 到 512 的随机整数
	var newRect = RectangleShape2D.new()
	newRect.size = Vector2(10,h)
	$score_area/CollisionShape2D.shape = newRect
	var y = randi() % 263 + 50 # 100 到 412 的随机整数
	$score_area.position = Vector2(43,y)
	# 添加下管道
	var piping_bottom = obstacle.instantiate()
	piping_bottom.position = Vector2(0,y + h / 2) 
	piping_bottom.name = "piping_bottom"
	add_child(piping_bottom)
	piping_bottom.owner = $"."
	#添加上管道
	var piping_top = obstacle.instantiate()
	piping_top.rotation_degrees = 180
	piping_top.name = "piping_top"
	piping_top.position = Vector2(52, y - h / 2)
	add_child(piping_top)
	piping_bottom.owner = $"."
	position = Vector2(400,0)


func _on_score_area_body_exited(body:Node):
	if(body.get_collision_layer_value(1) and Global.game_start):
		body.score()
		$AudioStreamPlayer2D.play(0)
