extends Node

@onready var TEXT_BOX = preload("res://scenes/text/textbox.tscn")
var text = {
	#id		text 								#choices 			#item
	"id": {
		"name": "Christina",
		"text": ["i say stuff...", "text 2", "text 3"],
		"braches": [["id2", "yes"], ["id3", "no"]]
	},
	"trash can": {
		"name": "Christina",
		"text": ["it smells like something rotting"],
		"branches": null
	}
}

func create_textbox(id):
	var text_box = TEXT_BOX.instantiate()
	var text_data=text[id]
	if text_box: 
		print(str(text_data))
		print(text_box)
		
		text_box.set_values(text_data["name"], str(text_data["text"]))
		get_parent().add_child(text_box);
		
	else:
		print("textbox not exist")

	
