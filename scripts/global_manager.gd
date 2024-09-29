extends Node

const GRAVITY = 200.0
const JUMP = GRAVITY/2
const MAX_GRAVITY = 300.0
const DEFAULT_HORIZONTAL_SPEED=2
enum PLAYER_STATES { FREE, FROZEN }
var player_state = PLAYER_STATES.FREE
func _ready():
	randomize()
