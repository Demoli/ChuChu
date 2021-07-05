extends KinematicBody2D

onready var level_tiles : LevelTileMap = get_node("/root/GameScene/TileMapScene")
var speed = 150
var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Ensure we only change direction fron the center of the tile
	var tailCell = level_tiles.get_cell_at_world_position(get_node("TailTileCollider").global_position)
	var noseCell = level_tiles.get_cell_at_world_position(get_node("NoseTileCollider").global_position)
	
	if(tailCell != noseCell):
		return
		
	var cell = tailCell
	
	if cell == level_tiles.AllowedTiles.TILE_UP:
		turn_up()
	if cell == level_tiles.AllowedTiles.TILE_RIGHT:
		turn_right()
	if cell == level_tiles.AllowedTiles.TILE_DOWN:
		turn_down()
	if cell == level_tiles.AllowedTiles.TILE_LEFT:
		turn_left()
	
func _physics_process(delta: float) -> void:
	# handle movement
	velocity = Vector2(1, 0).rotated(rotation) * speed
	velocity = move_and_slide(velocity)

	for index in get_slide_count():
		# handle collisions
		var colliding = get_slide_collision(index)
		if colliding:
			var colliding_cell = level_tiles.get_cell_at_world_position(colliding.position)
			if colliding_cell == level_tiles.WallTiles.WALL_TOP:
				turn_left()
			if colliding_cell == level_tiles.WallTiles.WALL_RIGHT:
				turn_up()
			if colliding_cell == level_tiles.WallTiles.WALL_BOTTOM:
				turn_left()
			if colliding_cell == level_tiles.WallTiles.WALL_LEFT:
				turn_up()

func turn_up():
	rotation_degrees = -90
	
func turn_right():
	rotation_degrees = 0
	
func turn_down():
	rotation_degrees = 90
	
func turn_left():
	rotation_degrees = 180
