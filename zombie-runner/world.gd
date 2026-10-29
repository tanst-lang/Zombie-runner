extends Node2D

var score= 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
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
