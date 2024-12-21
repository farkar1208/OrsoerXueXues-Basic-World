extends Node

var weight_sum = 0.0
@export var camera_set = []
@export var camera_goal_position = Vector2(0,0)


func set_camera(lc: Vector2,weight: float) -> int:
	camera_set.push_back({'lc':lc,'weight':weight})
	weight_sum = weight_sum + weight
	return camera_set.size() - 1
	
func remove_camera(index: int):
	var camera = camera_set.pop_at(index)
	weight_sum = weight_sum - camera['weight']
	
func _process(delta: float) -> void:
	if weight_sum == 0:
		camera_goal_position = Vector2(0,0)
		return
	var i = Vector2(0,0)
	for j in camera_set:
		i += j.lc * j.weight
	camera_goal_position = i / weight_sum
	
