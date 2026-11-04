extends Area2D
class_name obstacle
 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void: 
	position.y+= GlobalVariable.speed * delta



func _on_area_entered(area: Area2D) -> void:
	if area is player:
		print("player") 
