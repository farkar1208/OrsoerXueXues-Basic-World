extends Node2D

var id = -1
@export var weight = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	init()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if self.get("metadata/id") != -1:
		camera.camera_set[id] = {'lc':self.global_position,'weight':weight}
	pass

func init():
	id = camera.set_camera(self.global_position,weight)
	
func remove():
	camera.remove_camera(id)
	id = -1
