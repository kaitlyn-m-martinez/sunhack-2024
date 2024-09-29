extends Area2D

var Obstacle = preload("res://obstacle.tscn")

func _obstacle_create():
	var obstacle_instance=ObstacleManager.get_obstacle().instantiate()
	obstacle_instance.position = Vector2(200, randi_range(-60, 60))
	get_parent().call_deferred("add_child", obstacle_instance)
	



func _on_area_entered(body):
	print("entered")
	if body.is_in_group("obstacle"):
		body.queue_free()
		_obstacle_create()
