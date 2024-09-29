extends Control

func set_values(name_text, dialog_text):	
	var named=$Panel/Panel/VBoxContainer/Name
	var dialog=$Panel/Panel/VBoxContainer/Dialog
	
	if dialog and named:
		dialog.text=str(dialog_text)
		named.text=str(name_text)
