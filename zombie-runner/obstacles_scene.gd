extends StaticBody2D

var speed = 300
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position.y+= speed * delta
