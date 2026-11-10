extends Node2D

var score= 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalVariable.speed = 300
	$"restart screen".hide()
	$game_ui.show()
	_update_ui()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_timer_timeout() -> void:
	var enemy = preload("res://enemy_scene.tscn").instantiate()
	enemy.position.y = 0
	enemy.position.x = randf_range(1,110) * 10
	enemy.enemy_killed.connect(_on_enemy_killed)
	add_child(enemy)


func _update_ui():
	$game_ui/score_label.text = "score: " + str(score)


func _on_enemy_killed():
	print("enemy killed")
	score += 10
	_update_ui()


func _on_restart_timer_timeout() -> void:
	$"restart screen".show()
	$game_ui.hide()
	Engine.time_scale=0


func _on_item_timer_timeout() -> void:
	var item = randi_range(1,2)
	if item == 1:
		var coin = preload("res://coin_scene.tscn").instantiate()
		coin.position.y = 0
		coin.position.x = randf_range(3,9) * 100
		add_child(coin)
	else:
		var bullet_object = preload("res://bullet_item_scene.tscn").instantiate()
		bullet_object.position.y = 0
		bullet_object.position.x = randf_range(3,9) * 100
		add_child(bullet_object)



func _on_game_timer_timeout() -> void:
	if GlobalVariable.speed <500:
		GlobalVariable.speed += 30



func _on_score_timer_timeout() -> void:
	score += GlobalVariable.speed / 100
	_update_ui()




func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main-menu_scene.tscn")
