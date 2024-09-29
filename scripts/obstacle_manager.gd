extends Node
var current_level=0

var level1 = [
	preload("res://obstacles/level1/eyes1.tscn"),
	preload("res://obstacles/level1/lips1.tscn"),
	preload("res://obstacles/level1/teeth1.tscn"),
	preload("res://obstacles/level1/eyes1.tscn"),
	preload("res://obstacles/level1/arm1.tscn")
]
var levels=[level1, level1]
func _ready():
	randomize()
func get_obstacle():
	var random = RandomNumberGenerator.new()
	random.randomize()
	
	var level=levels[current_level]
	return level[random.randi_range(0, len(level)-1) ]
