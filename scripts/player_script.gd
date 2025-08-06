extends StaticBody2D

var PLAYER_SPEED = 5

func _ready() -> void:
	print("Player Node ready!")

func _physics_process(_delta: float) -> void:
	var direction_vectors = {
		"move_up"   : Vector2(0.0, -1.0),
		"move_down" : Vector2(0.0, 1.0),
		"move_right": Vector2(1.0, 0.0),
		"move_left" : Vector2(-1.0, 0.0),
	}
	
	var theta = 0 # in radians	
	var velocity = Vector2(PLAYER_SPEED*cos(theta), PLAYER_SPEED*sin(theta))
