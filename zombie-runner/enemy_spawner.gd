extends Node2D

@onready var marker: Marker2D= $Marker2D

func _on_timer_timeout() -> void:
	var enemy = preload("res://enemy_scene.tscn").instantiate()
	enemy.position.y = 0
	enemy.position.x = randf_range(1,50) * 20
	
	add_child(enemy)
