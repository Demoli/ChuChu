extends Node2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

onready var level_tiles = get_node("/root/GameScene/TileMapScene")
onready var map = level_tiles.get_node("TileMap")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var tile_index = map.world_to_map(get_global_mouse_position())
	var tile_pos = map.map_to_world(tile_index, false)
	position = tile_pos + Vector2(32,32)

func _input(event):
	if event.is_action_pressed("tile_up"):
		level_tiles.set_tile_at_world_positition(get_global_mouse_position(), level_tiles.AllowedTiles.TILE_UP)		
	if event.is_action_pressed("tile_right"):
		level_tiles.set_tile_at_world_positition(get_global_mouse_position(), level_tiles.AllowedTiles.TILE_RIGHT)		
	if event.is_action_pressed("tile_down"):
		level_tiles.set_tile_at_world_positition(get_global_mouse_position(), level_tiles.AllowedTiles.TILE_DOWN)		
	if event.is_action_pressed("tile_left"):
		level_tiles.set_tile_at_world_positition(get_global_mouse_position(), level_tiles.AllowedTiles.TILE_LEFT)		
