extends Node
# https://docs.godotengine.org/en/stable/classes/class_configfile.html

const CONFIG_PATH = "user://settings.cfg"
const DEFAULT_CONFIG_PATH: String = "res://addons/HandheldPortraitGodotReady/Scripts/Settings/default_settings.cfg"

var video_settings: Dictionary = {
	"resolution": Vector2i(720, 1280),
	"fullscreen": false,
	"borderless": false,
	"vsync": true,
}

var audio_settings: Dictionary = {
	"volume_master": 100,
	"volume_music": 50,
	"volume_sfx": 50
	}


var gamepad_controls_settings: Dictionary = {
	"controller_move_up": "JOY_BUTTON_DPAD_UP", #Left Stick Y - # JOY_AXIS_LEFT_Y
	"controller_move_down": "JOY_BUTTON_DPAD_DOWN", #Left Stick Y + # JOY_AXIS_LEFT_Y
	"controller_move_right": "JOY_BUTTON_DPAD_RIGHT", #Right Stick X - # JOY_AXIS_RIGHT_Y
	"controller_move_left": "JOY_BUTTON_DPAD_LEFT", #Right Stick X + # JOY_AXIS_LEFT_Y
	"controller_action_right": "JOY_BUTTON_B",# JOY_BUTTON_B = 1
	"controller_action_bottom": "JOY_BUTTON_A",# JOY_BUTTON_A = 0
	"controller_action_top":"JOY_BUTTON_Y", # JOY_BUTTON_Y = 3
	"controller_action_left":"JOY_BUTTON_X", # JOY_BUTTON_X = 2
	"controller_start": "JOY_BUTTON_START",# JOY_BUTTON_START = 6
	"controller_select":"JOY_BUTTON_BACK"# JOY_BUTTON_BACK = 4
}
# JoyButton


# TouchScreenButton
# action String
# [string, InputMap get action]
var mobile_controls_settings: Dictionary = {
	"mobile_move_up": "JOY_BUTTON_DPAD_UP", #Left Stick Y - # JOY_AXIS_LEFT_Y
	"mobile_move_down": "JOY_BUTTON_DPAD_DOWN", #Left Stick Y + # JOY_AXIS_LEFT_Y
	"mobile_move_right": "JOY_BUTTON_DPAD_RIGHT", #Right Stick X - # JOY_AXIS_RIGHT_Y
	"mobile_move_left": "JOY_BUTTON_DPAD_LEFT", #Right Stick X + # JOY_AXIS_LEFT_Y
	"mobile_action_right": "JOY_BUTTON_B",# JOY_BUTTON_B = 1
	"mobile_action_bottom": "JOY_BUTTON_A",# JOY_BUTTON_A = 0
	"mobile_action_top":"JOY_BUTTON_Y", # JOY_BUTTON_Y = 3
	"mobile_action_left":"JOY_BUTTON_X", # JOY_BUTTON_X = 2
	"mobile_start": "JOY_BUTTON_START",# JOY_BUTTON_START = 6
	"mobile_select":"JOY_BUTTON_BACK"# JOY_BUTTON_BACK = 4
}

var mk_controls_settings: Dictionary = {
	"mk_move_up": "Z",# WASD
	"mk_move_down": "S",
	"mk_move_right": "D",
	"mk_move_left": "Q",
	"mk_action_right": "KEY_SPACE",# Space KEY_SPACE = 32
	"mk_action_bottom": "MOUSE_BUTTON_LEFT",# MOUSE_BUTTON_LEFT = 1
	"mk_action_top": "MOUSE_BUTTON_RIGHT",# MOUSE_BUTTON_RIGHT = 2
	"mk_action_left": "MOUSE_BUTTON_MIDDLE",# MOUSE_BUTTON_MIDDLE = 3
	"mk_start": "KEY_ENTER",# Enter KEY_ENTER = 4194309
	"mk_select": "KEY_ESCAPE" # Escape KEY_ESCAPE = 4194305
}


var language_settings: Dictionary = {
	"locale": "en",
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_settings()
	apply_video_settings()
	apply_audio_settings()
	apply_language_settings()
	return

func save_settings() -> void:
	var config: ConfigFile = ConfigFile.new()

	for key in video_settings:
		config.set_value("video", key, video_settings[key])

	for key in audio_settings:
		config.set_value("audio", key, audio_settings[key])
	
	for key in gamepad_controls_settings:
		config.set_value("gamepad_controls", key, gamepad_controls_settings[key])
	
	for key in mobile_controls_settings:
		config.set_value("mobile_controls", key, mobile_controls_settings[key])
	
	for key in mk_controls_settings:
		config.set_value("mk_controls", key, mk_controls_settings[key])
	
	for key in language_settings:
		config.set_value("language", key, language_settings[key])
	
	config.save(CONFIG_PATH)
	print("Save settings")
	return

func load_settings() -> void:
	var config: ConfigFile = ConfigFile.new()
	var err := config.load(CONFIG_PATH)

	if err != OK:
		return
	for section in ["video", "audio", "controls", "mobile_controls", "language"]:
		if not config.has_section(section):
			continue
		
		var target_dict = get(section + "_settings")
		for key in target_dict.keys():
			if config.has_section_key(section, key):
				target_dict[key] = config.get_value(section, key)
	print("load settings")
	return

func apply_video_settings() -> void:
	var v = video_settings
	DisplayServer.window_set_vsync_mode(
	DisplayServer.VSYNC_ENABLED if v["vsync"] else DisplayServer.VSYNC_DISABLED
	)

	DisplayServer.window_set_mode(
		DisplayServer.WINDOW_MODE_FULLSCREEN if v["fullscreen"] else
		DisplayServer.WINDOW_MODE_WINDOWED
	)

	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, v["borderless"])
	DisplayServer.window_set_size(v["resolution"])
	print("apply video settings")
	return

func apply_audio_settings() -> void:
	var master_db = linear_to_db(clamp(audio_settings["volume_master"], 0.0, 1.0))
	var music_db = linear_to_db(clamp(audio_settings["volume_music"], 0.0, 1.0))
	var sfx_db = linear_to_db(clamp(audio_settings["volume_sfx"], 0.0, 1.0))

	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), master_db)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), music_db)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Sfx"), sfx_db)
	print("apply audio settings")
	return


func apply_language_settings() -> void:
	TranslationServer.set_locale(language_settings["locale"])
	print("apply language settings")
	return
