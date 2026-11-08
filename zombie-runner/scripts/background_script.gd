extends Node2D

@onready var parallax_layer: Parallax2D = $Parallax2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	parallax_layer.autoscroll= Vector2(0.0, GlobalVariable.speed)
