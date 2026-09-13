extends Control

@export var return_button : Button

func _ready() -> void:
	#match_all_buttons_with_sounds()
	#$MarginContainer/VBoxContainer/TabContainer.tab_changed.connect(match_all_buttons_with_sounds)
	#$MarginContainer/VBoxContainer/TabContainer.tab_clicked.connect(_on_ui_pressed)
	#$MarginContainer/VBoxContainer/TabContainer.tab_hovered.connect(_on_ui_hover_focus)
	$MarginContainer/VBoxContainer/TabContainer.get_tab_bar().grab_focus.call_deferred()
	return_button.pressed.connect(_on_button_return_pressed)
	pass

func _on_button_return_pressed() ->void:
	Global.game_controller.change_gui_scene("res://addons/HandheldPortraitGodotReady/Scenes/Titles/MainMenuScene.tscn")
	SettingsManager.save_settings()

func match_all_buttons_with_sounds():
	var all_buttons = get_tree().get_nodes_in_group("ui_buttons")
	for button in all_buttons:
			print("Bouton trouvé : ", button.name)
