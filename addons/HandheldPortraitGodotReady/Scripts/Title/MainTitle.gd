extends Control

@onready var rich_text_label_title: RichTextLabel = $MarginContainerSafeZone/VBoxContainerTitle/RichTextLabelTitle
@onready var rich_text_label_title_2: RichTextLabel = $MarginContainerSafeZone/VBoxContainerTitle/RichTextLabelTitle2
@onready var label: Label = $MarginContainerSafeZone/VBoxContainerTitle/Label
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var timer: Timer = $Timer



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	blink_text()
	timer.autostart
	
	pass

func _unhandled_input(event: InputEvent) -> void:
	if event.is_pressed():
		Global.game_controller.change_gui_scene("res://addons/HandheldPortraitGodotReady/Scenes/Titles/MainMenuScene.tscn")


# Tween GBC
# Sounds GBC like
# Timer back to splash scene or video

func blink_text() -> void:
	var tween = create_tween().set_loops()
	tween.tween_property(label, "modulate:a", 0.0, 0.5)
	tween.tween_property(label, "modulate:a", 1.0, 0.5)

func gbc_startup_tween() -> void:
	pass
