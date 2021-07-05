extends Node2D

class_name LevelTileMap

enum AllowedTiles {TILE_BLANK, TILE_UP, TILE_DOWN, TILE_LEFT, TILE_RIGHT}

enum WallTiles {WALL_TOP = 5, WALL_RIGHT = 6, WALL_BOTTOM = 7, WALL_LEFT = 8}

onready var map = get_node("TileMap")

func get_cell_at_world_position(world_pos: Vector2) -> int:
	var tile_index = map.world_to_map(world_pos)
	var cell_index = map.get_cell(tile_index.x, tile_index.y)
	
	return cell_index

func get_cell_name(cell_index: int) -> String:
	return map.tile_set.tile_get_name(cell_index)

func set_tile_at_world_positition(world_pos: Vector2, tile: int):
	var tile_pos = map.world_to_map(world_pos)
	map.set_cell(tile_pos.x, tile_pos.y, tile)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _input(event):
	if event is InputEventMouseButton:
		if event.pressed and  event.button_index == BUTTON_RIGHT:
			set_tile_at_world_positition(get_global_mouse_position(), AllowedTiles.TILE_BLANK)
