extends Area2D
class_name player

@onready var bullet_prefab = preload("res://bullet_scene.tscn")
const SPEED = 10
var ammo = 2

func _process(delta: float) -> void:
	if Input.is_action_pressed("player_left") and position.x > 1:
		position.x -= SPEED
		
	if Input.is_action_pressed("player_right") and position.x < 1100:
		position.x += SPEED
		
	if Input.is_action_just_pressed("shoot") and ammo > 0:
		var bullet = bullet_prefab.instantiate()
		bullet.position = position
		ammo -=1
		get_parent().add_child(bullet)




	
