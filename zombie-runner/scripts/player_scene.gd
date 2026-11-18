extends Area2D
class_name player

@onready var bullet_prefab = preload("res://bullet_scene.tscn")
const SPEED = 450
signal restart
signal bulletitem
signal coinitem


func _ready() -> void:
	position.x = 575
	_update_ui()

func _process(delta: float) -> void:
	
	if Input.is_action_pressed("player_left") and position.x > 220:
		position.x -= SPEED * delta

	if Input.is_action_pressed("player_right") and position.x < 930:
		position.x += SPEED * delta

	if Input.is_action_just_pressed("shoot") and GlobalVariable.ammo > 0 :
		var bullet = bullet_prefab.instantiate()
		bullet.position = position
		GlobalVariable.ammo -=1
		_update_ui()
		get_parent().add_child(bullet)



func _update_ui():
	$"../game_ui/ammo_label".text = "bullets: " + str(GlobalVariable.ammo)
	$"../game_ui/coins_label".text = "coins: " + str(GlobalVariable.coins)



func _on_area_entered(area: Area2D) -> void:
	if area is zombie or area is obstacle:
		restart.emit()
		print("restart")
		$"../restart_timer".start()

	
	if area is bullet_item:
		GlobalVariable.ammo += 1
		_update_ui()
		bulletitem.emit()
	
	if area is coin_item:
		GlobalVariable.coins += 1
		_update_ui()
		coinitem.emit()
