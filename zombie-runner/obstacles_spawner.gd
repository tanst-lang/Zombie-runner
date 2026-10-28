extends Node2D

func _on_timer_timeout() -> void:
	var obstacles = preload("res://obstacles_scene.tscn").instantiate()
	obstacles.position.y = 0
	obstacles.position.x = randf_range(1,110) * 10
	
	add_child(obstacles)
