extends Node2D

@export var obstacles_scene: Array[PackedScene]

@onready var marker: Marker2D = $Marker2D

func _on_timer_timeout() -> void:
	var random_obstacle: Node = obstacles_scene.pick_random()
	var random_obstacle_instance: Node = random_obstacle.instantiate()
	add_child(random_obstacle_instance) 
	
	random_obstacle_instance.position = marker.position
