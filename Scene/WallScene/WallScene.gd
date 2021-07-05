extends StaticBody2D

class_name LevelWall

enum BounceDirection {UP, RIGHT, DOWN, LEFT}

export(BounceDirection) var bounce_dir = BounceDirection.DOWN


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func get_class():
	return "LevelWall"
