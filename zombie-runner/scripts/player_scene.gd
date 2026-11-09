extends Area2D
class_name player

@onready var bullet_prefab = preload("res://bullet_scene.tscn")
const SPEED = 10
var ammo = 0
var coins = 0
signal restart


func _ready() -> void:
	position.x = 575

func _process(delta: float) -> void:
	
	if Input.is_action_pressed("player_left") and position.x > 207:
		position.x -= SPEED

	if Input.is_action_pressed("player_right") and position.x < 943:
		position.x += SPEED

	if Input.is_action_just_pressed("shoot") :
		var bullet = bullet_prefab.instantiate()
		bullet.position = position
		ammo -=1
		_update_ui()
		get_parent().add_child(bullet)



func _update_ui():
	$"../game_ui/ammo_label".text = "bullets: " + str(ammo)
	$"../game_ui/coins_label".text = "coins: " + str(coins)



func _on_area_entered(area: Area2D) -> void:
	if area is zombie or area is obstacle:
		restart.emit()
		print("restart")
		$"../restart_timer".start()
	
	if area is bullet_item:
		ammo += 1
		_update_ui()
	
	if area is coin_item:
		coins += 1
		_update_ui()
