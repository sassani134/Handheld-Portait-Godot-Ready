@tool
extends EditorPlugin



"""
- GameController MainScene
- Autoloads
	- Global : scripts/Autoloads/Global.gd
	- DeviceManager : scripts/Autoloads/DeviceManager.gd
	- SettingsManager : scenes/SettingsManager.tscn # Autoload scene ???
	- ### AudioManager : scenes/Autoloads/AudioManager.tscn # not enable
	- ### AudioSoundUi: scenes/Autoloads/AudioSoundUi.tscn
	- ### FindSvgInput (plugin): scripts/Autoloads/FindSvgInput.gd
- Input Actions ###
	# Buttons
		- jump : space joystick button 0
		- action_fire : left mouse button joystick button 1
		- action_interact : right mouse button joystick button 2
		- action_run : shift joystick button 3
		- action_pause : escape joystick button 7
	# Joystick
		- move_left : a joystick axis 0 negative
		- move_right : d joystick axis 0 positive
		- move_up : w joystick axis 1 negative
		- move_down : s joystick axis 1 positive
"""

const PLUGIN_DIR : String = "res://addons/HandheldPortraitGodotReady/"
const TARGET_SCRIPT_DIR : String = "res://scripts/generated"
const TARGET_SCENE_PATH : String = "res://scenes/starter_main.tscn"

var _backup : Dictionary = {}




func project_backup() -> void:
	# Backup the current window size and mode settings
	_backup["viewport_width"] = ProjectSettings.get_setting("display/window/size/viewport_width")
	_backup["viewport_height"] = ProjectSettings.get_setting("display/window/size/viewport_height")
	_backup["window_mode"] = ProjectSettings.get_setting("display/window/size/mode")


	# Set the window size to 720x1280 and set the window mode to fullscreen
	ProjectSettings.set_setting("display/window/size/viewport_width", 720)
	ProjectSettings.set_setting("display/window/size/viewport_height", 1280)
	# ProjectSettings.set_setting("display/window/size/mode", DisplayServer.WINDOW_MODE_FULLSCREEN)

	# DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	ProjectSettings.save()
	pass


func project_restore() -> void:
	# Clean-up of the plugin goes here.

	# Restore the original window size and mode settings
	for key in _backup:
		ProjectSettings.set_setting("display/window/size/" + key, _backup[key])
		ProjectSettings.save()
	pass


func _install_starter_files() -> void:
	# create the target directory if it doesn't exist
	if not DirAccess.dir_exists_absolute(TARGET_SCRIPT_DIR):
		DirAccess.make_dir_absolute(TARGET_SCRIPT_DIR)

	# copy scripts
	_copy_dir(PLUGIN_DIR + "/scripts", TARGET_SCRIPT_DIR)

	# Copier les scènes vers le répertoire du projet
	_copy_file(PLUGIN_DIR + "/scenes/main.tscn", TARGET_SCENE_PATH)

	# Copier les ressources
	_copy_dir(PLUGIN_DIR + "/assets", "res://assets/starter")
	pass


func _uninstall_starter_files() -> void:
	# remove the target directory
	if DirAccess.dir_exists_absolute(TARGET_SCRIPT_DIR):
		DirAccess.remove_absolute(TARGET_SCRIPT_DIR)
	pass








func _copy_dir(source_dir: String, target_dir: String) -> void:
	# var dir = DirAccess.open(source_dir)
	# if dir:
	# 	dir.list_dir_begin()
	# 	var file_name = dir.get_next()
	# 	while file_name != "":
	# 		if dir.current_is_dir():
	# 			# Create the target directory if it doesn't exist
	# 			if not DirAccess.dir_exists_absolute(target_dir + "/" + file_name):
	# 				DirAccess.make_dir_absolute(target_dir + "/" + file_name)
	# 			# Recursively copy the subdirectory
	# 			_copy_dir(source_dir + "/" + file_name, target_dir + "/" + file_name)
	# 		else:
	# 			# Copy the file
	# 			_copy_file(source_dir + "/" + file_name, target_dir + "/" + file_name)
	# 		file_name = dir.get_next()
	# 	dir.list_dir_end()
		pass

func _copy_file(source_file: String, target_file: String) -> void:
	# var file = FileAccess.open(source_file, FileAccess.READ)
	# if file:
	# 	var data = file.get_buffer(file.get_length())
	# 	file.close()
	# 	var target = FileAccess.open(target_file, FileAccess.WRITE)
	# 	if target:
	# 		target.store_buffer(data)
	# 		target.close()
		pass






func _add_input_actions():
# Créer l'action "jump" et lier la barre d'espace
	if not InputMap.has_action("jump"):
		InputMap.add_action("jump")

	var event : InputEventKey = InputEventKey.new()
	event.keycode = KEY_SPACE
	InputMap.action_add_event("jump", event)

	# Persister dans la configuration du projet
	ProjectSettings.set_setting("input/jump", {
		"deadzone": 0.5,
		"events": [event]
	})
	ProjectSettings.save()

func _remove_input_actions():
	if InputMap.has_action("jump"):
		InputMap.erase_action("jump")
		ProjectSettings.set_setting("input/jump", null)
	ProjectSettings.save()



# I don't think i need to activate or desactivate the plugin, but I will leave these functions here in case I need them later.
func _enable_plugin() -> void:
	# Add autoloads here.
	pass
func _disable_plugin() -> void:
	# Remove autoloads here.
	pass


func _enter_tree() -> void:
	# Initialization of the plugin goes here.
	"""
	should i change it in _enter_tree or _enable_plugin?
	I think _enter_tree is better because it will be called when the plugin is enabled,
	but also when the editor is started and the plugin is already enabled.
	i think this starter template will be the first thing to be install before the user starts working on the project,
	so it should be fine to set the window size and mode here.
	"""
	pass

func _exit_tree() -> void:
	# Clean-up of the plugin goes here.
	pass
