extends Node
@export var current_id=-1
@export var current_index=-1

@onready var TEXT_BOX = preload("res://scenes/text/textbox.tscn")
var text = {
	#id		text 								#choices 			#item
	"id": {
		"name": ["Christina"],
		"text": ["i say stuff...", "text 2", "text 3"],
		"braches": [["id2", "yes"], ["id3", "no"]]
	},
	"trash can": {
		"name": ["Christina"],
		"text": ["it smells like something rotting", "is that you?"],
		"branches": null
	},
	"sleepy": {
		"name": ["Christina"],
		"text": ["is it weird that i'm still tired?", "*yawn*", "i wonder if i can dream inside a dream..."],
		"braches": []
	},
	"frog": {
		"name": ["Christina"],
		"text": ["i used to have a pet frog -", " - before i set him free in the yard", "probably dead by now."],
		"braches": []
	},
	"demon": {
		"name": ["Boogyman", "Christina", "Boogyman", "Christina", "Boogyman"],
		"text": ["...", "who are you?", "...", "what's the silent treatment for?", "..."],
		"braches": []
	},
}
func delete_textbox():
	var root=get_tree()
	var textbox=root.get_nodes_in_group("text_box")[0]
	root.get_current_scene().remove_child(textbox)
	textbox.call_deferred("free")
	if current_index < len(text[current_id]["text"]):
		create_textbox(current_id)
	else:
		current_id=-1
		current_index=-1
		GlobalManager.player_state=GlobalManager.PLAYER_STATES.FREE
		
		
func create_textbox(id):
	if id != str(current_id):
		GlobalManager.player_state=GlobalManager.PLAYER_STATES.FROZEN
		current_id=id
		current_index=0
	var text_box = TEXT_BOX.instantiate()
	var text_data=text[id]
	if text_box:
		if len(text_data["name"])==1:
			text_box.set_values(text_data["name"][0], text_data["text"][current_index])
		else:
			text_box.set_values(text_data["name"][current_index], text_data["text"][current_index])
		get_parent().add_child(text_box)
		current_index+=1
	else:
		print("textbox not exist")

	
