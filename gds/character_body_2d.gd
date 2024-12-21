extends CharacterBody2D


const SPEED = 300.0
const FRICTION = 1
var face_direction = Vector2(0,0)
var direction

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var controler = self.find_child('controler', false)
	if controler == null:
		direction = Vector2(0,0)
	else:
		direction = controler.get("metadata/direction").normalized()
	velocity = velocity.move_toward(SPEED * direction, delta * SPEED / FRICTION)
	if direction != Vector2(0,0):
		face_direction = direction
	$AnimationTree.call('set',"parameters/breath/blend_position",face_direction)
	$AnimationTree.call('set',"parameters/walk/blend_position",face_direction)

	move_and_slide()
