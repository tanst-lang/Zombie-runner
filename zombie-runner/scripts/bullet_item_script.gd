extends Area2D
class_name bullet_item


func _ready() -> void:
	pass 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += GlobalVariable.speed * delta
