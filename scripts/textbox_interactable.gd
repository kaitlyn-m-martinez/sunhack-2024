extends Area2D 


@export var activate=false
@export var id="trash can"

func _activate():
	DialogManager.create_textbox(id)

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
