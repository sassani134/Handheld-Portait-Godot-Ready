extends Control


@onready var color_rect: ColorRect = $MarginContainer/VBoxContainer/MarginContainer/ColorRect

@export var button_modify : Button
@export var button_reset : Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button_modify.pressed.connect(_on_button_modify_press)
	button_reset.pressed.connect(_on_button_reset_press)


func _on_button_modify_press() -> void:
	#can drag and drop then save position ...
	#change texte to save position or modify
	#
	pass

func _on_button_reset_press() -> void:
	# reset to default placement
	pass
