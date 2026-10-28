extends Node2D

var score= 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_update_ui()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _update_ui():
	$game_ui/score_label.text = "score: " + str(score)

func _on_enemy_enemy_killed() -> void:
	score += 10
