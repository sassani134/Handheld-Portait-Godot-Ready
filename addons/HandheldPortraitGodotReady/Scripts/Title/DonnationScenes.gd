extends Control

@export var return_button : Button

func _ready() -> void:
	return_button.pressed.connect(_on_button_return_pressed)
	return_button.grab_focus.call_deferred()
	pass

func _on_button_return_pressed() ->void:
	Global.game_controller.change_gui_scene("res://addons/HandheldPortraitGodotReady/Scenes/Titles/MainMenuScene.tscn")
	pass
