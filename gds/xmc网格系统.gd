extends Node2D

@export var patterns = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func fresh():
	if self.get("metadata/strong_loading"):
		$freshness.start()

func store():
	var block_position = self.get("metadata/block_position")
	var patterns_file = FileAccess.open('user://save/X%dY%d'%[block_position.x, block_position.y],FileAccess.WRITE)
	patterns_file.store_var(patterns, true)
	

func _on_freshness_timeout() -> void:
	patterns = $'..'.call('save_block',self.get("metadata/block_position"))
	store()
	

func loader():
	var block_position = self.get("metadata/block_position")
	var patterns_file = FileAccess.open('user://save/X%dY%d'%[block_position.x, block_position.y],FileAccess.READ)
	if patterns_file == null:
		patterns = {}
	else:
		patterns = patterns_file.get_var(true)
		

func stale() -> bool:
	var freshness = self.get("metadata/freshness")
	freshness -= 1
	self.set("metadata/freshness",freshness)
	return freshness <= 0
