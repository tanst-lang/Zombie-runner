extends Area2D
class_name zombie
signal enemy_killed

func _physics_process(delta: float) -> void:
	position.y+= (GlobalVariable.speed + 150) * delta

func _on_area_entered(area: Area2D) -> void:
	if area is bullet:
		queue_free()
		area.queue_free()
		enemy_killed.emit()
