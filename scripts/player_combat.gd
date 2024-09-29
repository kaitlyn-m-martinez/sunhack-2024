extends CharacterBody2D
@export var instant_kill=true

func _ready(): 
	await get_tree().create_timer(2.0).timeout
	ObstacleManager.get_obstacle().instantiate()
	
func _physics_process(delta):
	velocity.y += GlobalManager.GRAVITY*delta
	
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = -GlobalManager.JUMP
	if position.x<0:
		velocity.x += 1*delta
	else:
		velocity.x= 0
	var motion = velocity * delta
	move_and_collide(motion)


func _on_area_2d_area_entered(body):
	if instant_kill and body.is_in_group("obstacle"):
		get_tree().reload_current_scene()
		
