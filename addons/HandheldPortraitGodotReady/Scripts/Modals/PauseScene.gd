extends Control

@export var button_resume :Button
@export var button_restart :Button
@export var button_options :Button
@export var button_main_menu :Button
@export var button_exit :Button

func _ready() -> void:
	button_resume.grab_focus.call_deferred()
	
	button_resume.pressed.connect(_on_button_resume_pressed)
	button_restart.pressed.connect(_on_button_restart_pressed)
	button_options.pressed.connect(_on_button_options_pressed)
	button_main_menu.pressed.connect(_on_button_main_menu_pressed)
	button_exit.pressed.connect(_on_button_exit_pressed)
	


func _on_button_resume_pressed() -> void:
	#Global.game_controller.change_gui_scene("res://addons/HandheldPortraitGodotReady/Scenes/Titles/DonnationScenes.tscn")
	print("resume the game")
	
func _on_button_restart_pressed() -> void:
	#Global.game_controller.change_gui_scene("res://addons/HandheldPortraitGodotReady/Scenes/Titles/DonnationScenes.tscn")
	print("Restart game")
	
func _on_button_options_pressed() -> void:
		Global.game_controller.change_gui_scene("res://addons/HandheldPortraitGodotReady/Scenes/Settings/OptionScene.tscn")

func _on_button_main_menu_pressed() -> void:
	# use a modal confirmation
	Global.game_controller.change_gui_scene("res://addons/HandheldPortraitGodotReady/Scenes/Titles/MainMenuScene.tscn")

	
func _on_button_exit_pressed() -> void:
	get_tree().quit()
	
