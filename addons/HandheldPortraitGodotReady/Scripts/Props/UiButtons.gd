class_name UiButton extends Button

var tween : Tween

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.add_to_group("ui_buttons")
	self.offset_transform_enabled = true
	self.pressed.connect(_on_pressed)
	self.focus_entered.connect(_on_hover)
	self.mouse_entered.connect(_on_hover)
	self.focus_exited.connect(_on_unhover)
	self.mouse_exited.connect(_on_unhover)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_pressed() -> void:
	AudioSoundUi._on_ui_pressed()
	Input.vibrate_handheld()
	#Haptic return vibration
	#Input.start_joy_vibration()
	#Input.vibrate_handheld()
	pass # Replace with function body.

func _on_hover() -> void:
	#Audio
	AudioSoundUi._on_ui_hover_focus()
	
	#Tween
	if tween and tween.is_running():
		tween.kill()
	tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BACK)
	tween.set_parallel(true)
	tween.tween_property(self,"scale:x", 1.2, 0.1)
	tween.tween_property(self,"scale:y", 0.75, 0.13)
	tween.tween_property(self, "rotation_degrees", randf_range(5.0, 10.0) * [-1.0,1.0].pick_random(),0.1)
	tween.chain().tween_property(self,"scale:x", 1.1, 0.15)
	tween.tween_property(self, "scale:y", 1.1, 0.15)
	tween.tween_property(self,"rotation_degrees", 0.0, 0.1)
	
	#Haptic return vibration
	#Input.start_joy_vibration()
	#Input.vibrate_handheld()
	pass

func _on_unhover() -> void:
	if tween and tween.is_running():
		tween.kill()
	tween = create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC)
	tween.set_parallel(true)
	tween.tween_property(self,"scale", Vector2.ONE, 0.15)
	tween.tween_property(self,"rotation_degrees", 0.0, 0.15)
