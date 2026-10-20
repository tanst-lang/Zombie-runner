extends Node2D

@onready var marker: Marker2D = $Marker2D

func _on_timer_timeout() -> void:
	var obstacles = preload("res://obstacles_scene.tscn").instantiate()
	obstacles.position.y = marker.position.y
	obstacles.position.x = randf_range(10,1100)
	
	add_child(obstacles)
