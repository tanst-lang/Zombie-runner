extends Area2D

var speed = 350

func _physics_process(delta: float) -> void:
	position.y+= speed * delta
