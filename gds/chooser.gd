extends CharacterBody2D

@export var mouse_position: Vector2 #鼠标位置
@export var mouse_tile_position: Vector2i #鼠标指向的区块内瓦片坐标
const MOD = 4 * 16
var pos = 1


func _process(delta: float) -> void:
	mouse_position = get_global_mouse_position()
	self.global_position = mouse_position - (Vector2(fposmod(mouse_position.x,MOD)-MOD/2,fposmod(mouse_position.y,MOD)-MOD/2) if pos else Vector2.ZERO)
	$AnimationTree.call('set',"parameters/blend_position",pos)
	
	mouse_tile_position = Vector2(self.global_position / MOD ).floor()
	
	move_and_slide()
