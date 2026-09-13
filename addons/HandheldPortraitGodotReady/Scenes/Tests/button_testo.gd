extends Button


func _on_pressed() -> void:
	print("press")
	AudioManager.ui_clicked.emit()
	pass # Replace with function body.


func _on_focus_entered() -> void:
	AudioManager.ui_hoover.emit()
	pass # Replace with function body.


func _on_mouse_entered() -> void:
	AudioManager.ui_hoover.emit()
	pass # Replace with function body.
