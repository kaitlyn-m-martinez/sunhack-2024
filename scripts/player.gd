extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D

@export var speed = 200

var movement = Vector4.ZERO

func set_animation(movement):
	if(movement[0]<0):
		animated_sprite_2d.play("left")
	if(movement[0]>0):
		animated_sprite_2d.play("right")
	if(movement[1]<0):
		animated_sprite_2d.play("up")
	if(movement[1]>0):
		animated_sprite_2d.play("down")
func get_input():
	movement = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	movement = movement.normalized()
	if GlobalManager.player_state==GlobalManager.PLAYER_STATES.FROZEN:
		velocity=Vector2.ZERO
	else:
		velocity = movement * speed
	if Input.is_action_pressed("ui_run"):
		velocity=velocity*2		#run modifier
	set_animation(movement)
		
func _process(delta):	
	get_input()
	move_and_slide()
