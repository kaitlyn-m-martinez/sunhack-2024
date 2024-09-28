extends CharacterBody2D

@export var speed = 100

var movement = Vector4.ZERO

func get_input():
	movement = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	movement = movement.normalized()
	velocity = movement * speed
	if Input.is_action_pressed("ui_run"):
		velocity=velocity*2		#run modifier
		
func _process(delta):	
	get_input()
	move_and_slide()
