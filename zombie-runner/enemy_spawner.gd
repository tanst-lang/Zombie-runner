extends Node2D

func _on_timer_timeout() -> void:
	var enemy = preload("res://enemy_scene.tscn").instantiate()
	enemy.position.y = 0
	enemy.position.x = randf_range(1,110) * 10
	
	add_child(enemy)
