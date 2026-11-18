extends Node2D

func _on_timer_timeout() -> void:
	var obstacles = preload("res://obstacles_scene.tscn").instantiate()
	obstacles.position.y = 0
	obstacles.position.x = randf_range(3,9) * 100
	
	add_child(obstacles)
