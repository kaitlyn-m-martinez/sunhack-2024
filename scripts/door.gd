extends Area2D 
class_name Interactable

@export var activate=false
@export var target="res://scenes/levels/anxiety_room.tscn"

func _activate():
	get_tree().change_scene_to_file(target)

func _input(event):
	if activate and Input.is_action_just_pressed("ui_accept"):
		_activate()
		
func _on_body_entered(body):
	if body.is_in_group("player"):
		activate=true
		print("ready")

func _on_body_exited(body):
	if body.is_in_group("player"):
		activate=false
		print("unready")
