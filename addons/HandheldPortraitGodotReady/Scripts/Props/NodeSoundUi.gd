extends Node

#Hard attachement, need to put signal with all ui button
func _ready() -> void:
	pass
#Tween and offset for button a lot of repetition code
func _on_ui_pressed() -> void:
	$AudioStreamPlayerClick.play()

func _on_ui_hover_focus() -> void:
	$AudioStreamPlayerHover.play()
	
func _on_ui_slide() -> void:
	$AudioStreamPlayerMaximize.play()
