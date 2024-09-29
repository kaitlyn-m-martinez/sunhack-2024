extends Control
@onready var dialog = $Panel/Panel/VBoxContainer/Dialog
@onready var named = $Panel/Panel/VBoxContainer/Name

func set_values(name_text, dialog_text): 
	if dialog and named: 
		dialog.text=str(dialog_text)
		named.text=str(name_text)
