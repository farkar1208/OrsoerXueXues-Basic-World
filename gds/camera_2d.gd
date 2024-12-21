extends Camera2D

var camera_friction = 1.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position += (camera.camera_goal_position - global_position) * delta / camera_friction * 2
	pass
