@tool
extends Control

@onready var credits_label : RichTextLabel = %CreditsLabel

@export var return_button : Button

@export var input_scroll_speed : float = 10.0

var _line_number : float = 0

func _ready() -> void:
	return_button.pressed.connect(_on_button_return_pressed)
	visibility_changed.connect(_on_visibility_changed)
	#return_button.grab_focus.call_deferred()
	return

func _process(delta : float) -> void:
	if Engine.is_editor_hint() or not visible:
		return
	var input_axis = Input.get_axis("ui_up", "ui_down")
	if abs(input_axis) > 0.5:
		_line_number += input_axis * delta * input_scroll_speed
		var max_lines = credits_label.get_line_count() - credits_label.get_visible_line_count()
		if _line_number < 0:
			_line_number = 0
		if _line_number > max_lines:
			_line_number = max_lines
		credits_label.scroll_to_line(round(_line_number))


func _on_button_return_pressed() ->void:
	Global.game_controller.change_gui_scene("res://addons/HandheldPortraitGodotReady/Scenes/Titles/MainMenuScene.tscn")
	pass

func _on_visibility_changed() -> void:
	if is_visible_in_tree():
		credits_label.scroll_to_line(0)
		credits_label.grab_focus()
