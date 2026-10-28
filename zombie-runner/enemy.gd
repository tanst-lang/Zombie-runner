extends Area2D

var speed = 350
signal enemy_killed

func _physics_process(delta: float) -> void:
	position.y+= speed * delta

func _on_area_entered(area: Area2D) -> void:
	if area is bullet:
		print("bullet")
		enemy_killed.emit()
	
	if area is player:
		print("player") 
