extends Node2D
const arr_ext = preload("res://scripts/array_ext.gd")
const dict_ext = preload("res://scripts/dictionary_ext.gd")

@export var PLAYER_SPEED = 500

var DIR_VECTORS = {
	"move_up"   : Vector2(0.0, -1.0),
	"move_down" : Vector2(0.0, 1.0),
	"move_right": Vector2(1.0, 0.0),
	"move_left" : Vector2(-1.0, 0.0),
}

func _ready() -> void:
	print("Player Node ready!")
	print("NOTE: arctan2(0, 0) resolves to " + str(atan2(0, 0)) + " in GDScript")
	
func handle_movement(delta: float) -> void:
	var mvmt_arrays: Array[Vector2] = []
	
	for dir_packet in dict_ext.items(DIR_VECTORS):
		if Input.is_action_pressed(dir_packet[0]):
			mvmt_arrays.append(dir_packet[1])

	var mvmt_vector = arr_ext.v2_sum(mvmt_arrays)
	var velocity
	
	if mvmt_vector.x == 0 and mvmt_vector.y == 0:
		# still condition
		velocity = Vector2(0.0, 0.0)
	else:
		var theta = atan2(mvmt_vector.y, mvmt_vector.x) # in radians
		velocity = Vector2(PLAYER_SPEED*cos(theta), PLAYER_SPEED*sin(theta))
	
	self.global_position += velocity * delta

func _physics_process(delta: float) -> void:
	handle_movement(delta)
