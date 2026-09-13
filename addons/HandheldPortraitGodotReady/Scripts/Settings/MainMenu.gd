extends Control

@export var button_play: Button
@export var button_option: Button
@export var button_credits: Button
@export var button_don: Button
@export var button_quit: Button
@export var label_version: Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button_play.pressed.connect(_on_button_play_pressed)
	button_option.pressed.connect(_on_button_option_pressed)
	button_credits.pressed.connect(_on_button_credits_pressed)
	button_don.pressed.connect(_on_button_don_pressed)
	button_quit.pressed.connect(_on_button_quit_pressed)
	
	label_version.text = str(ProjectSettings.get_setting("application/config/version"))
	# $MarginContainerSafeZone/VBoxContainer/VBoxContainer/ButtonPlay.grab_focus.call_deferred()
	button_play.grab_focus.call_deferred()
	
	#if Global.game_controller == null:
		#Global.game_controller = GameController.new()

#first button grab focus if no focus and pressed down or controller down

func _on_button_play_pressed() -> void:
	print("Play Button")
	pass

func _on_button_option_pressed() ->void:
	Global.game_controller.change_gui_scene("res://addons/HandheldPortraitGodotReady/Scenes/Settings/OptionScene.tscn")
	pass

func _on_button_credits_pressed() ->void:
	Global.game_controller.change_gui_scene("res://addons/HandheldPortraitGodotReady/Scenes/Titles/Credits/CreditsScenes.tscn")
	pass

func _on_button_don_pressed() ->void:
	Global.game_controller.change_gui_scene("res://addons/HandheldPortraitGodotReady/Scenes/Titles/DonnationScenes.tscn")
	pass

func _on_button_quit_pressed() ->void:
	get_tree().quit()
