extends Node2D


signal F_pressed

func _process(delta: float) -> void:
	self.set("metadata/direction",Vector2(Input.get_axis("ui_left", "ui_right"),\
										  Input.get_axis("ui_up"  , "ui_down" )  ))
	if Input.is_action_just_pressed('user_F'):
		F_pressed.emit()
	
