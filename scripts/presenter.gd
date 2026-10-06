extends Node2D

const Rules = preload("res://scripts/rules.gd")
var rules = Rules.new()

func _ready() -> void:
	rules.zoom = 1.0
	if not rules.zoom_ready(rules.zoom):
		push_error("Empty 2D zoom must be positive.")
	if not rules.lens_ready(get_viewport().get_camera_2d() != null):
		push_error("Empty 2D has no current camera.")

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("leap"):
		rules.mark_sheet_ready()
	if event.is_action_pressed("primary") and rules.may_sheet():
		_go("res://scenes/sheet.tscn")

func _go(next_path: String) -> void:
	get_tree().change_scene_to_file(next_path)
