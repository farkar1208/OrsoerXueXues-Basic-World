extends Node

var weight_sum
@export var camera_set = []
@export var camera_goal_position = Vector2(0,0)


func set_camera(lc: Vector2,weight: float) -> int:
	camera_set.push_back({'lc':lc,'weight':weight})
	return camera_set.size() - 1

#BUG: It will lead to a Index-not-match ploblem
#func remove_camera(index: int):
	#var camera = camera_set.pop_at(index)
	#weight_sum = weight_sum - camera['weight']
	
func _process(delta: float) -> void:
	weight_sum = 0
	var i = Vector2(0,0)
	for j in camera_set:
		i += j.lc * j.weight
		assert(j.weight>=0,'ERROR:Attentions weight can NOT be a negative number')
		weight_sum += j.weight
	camera_goal_position = i / weight_sum
	
