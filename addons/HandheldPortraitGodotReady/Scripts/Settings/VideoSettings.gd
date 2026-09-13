extends Control

@export var resolution_option: OptionButton
@export var vsync_check: CheckBox
@export var fps_count_check: CheckBox
@export var fps_option: OptionButton
@export var anti_aliasing_check: CheckBox
@export var camera_shake: CheckBox

# Called when the node enters the scene tree for the first time.
func _ready():
	var resolutions = [
		Vector2i(720, 1280),
		Vector2i(1080,1920 )
	]
	for res in resolutions:
		resolution_option.add_item("%dx%d" % [res.x, res.y])
 
	load_current_settings()
 
	resolution_option.item_selected.connect(_on_resolution_selected)
	vsync_check.toggled.connect(_on_vsync_toggled)
	


func load_current_settings():
	var mode = DisplayServer.window_get_mode()
	vsync_check.button_pressed = DisplayServer.window_get_vsync_mode() == DisplayServer.VSYNC_ENABLED
 
	var window_size = DisplayServer.window_get_size()
	for i in range(resolution_option.item_count):
		var res_text = resolution_option.get_item_text(i)
		var parts = res_text.split("x")
		if parts.size() == 2 and int(parts[0]) == window_size.x and int(parts[1]) == window_size.y:
			resolution_option.select(i)
			break
 
func _on_resolution_selected(index: int):
	var text = resolution_option.get_item_text(index)
	var parts = text.split("x")
	if parts.size() == 2:
		DisplayServer.window_set_size(Vector2i(int(parts[0]), int(parts[1])))
	SettingsManager.video_settings["resolution"] = Vector2i(int(parts[0]), int(parts[1]))
 
  
func _on_vsync_toggled(enabled: bool):
	var mode = DisplayServer.VSYNC_ENABLED if enabled else DisplayServer.VSYNC_DISABLED
	DisplayServer.window_set_vsync_mode(mode)
	SettingsManager.video_settings["vsync"] = enabled
