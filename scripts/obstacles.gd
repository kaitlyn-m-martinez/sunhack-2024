extends StaticBody2D

func _physics_process(delta):
	position += Vector2(-GlobalManager.DEFAULT_HORIZONTAL_SPEED, 0)
