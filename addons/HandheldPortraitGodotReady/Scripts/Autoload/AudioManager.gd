extends Node

@onready var audio_stream_player_music: AudioStreamPlayer = $AudioStreamPlayerMusic
@onready var audio_stream_player_sfx: AudioStreamPlayer = $AudioStreamPlayerSfx

signal ui_clicked
signal ui_hoover

func _ready() -> void:
	pass


func _on_ui_clicked() -> void:
	audio_stream_player_sfx.play()
	pass # Replace with function body.


func _on_ui_hoover() -> void:
	audio_stream_player_sfx.play()
	pass # Replace with function body.
