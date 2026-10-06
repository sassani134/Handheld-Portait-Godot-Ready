extends Node

# SVG Path
const SVG_PATH: String = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/"
const FLAIRS_RES: String = "Flairs/Vector/"
const GENERIC_RES : String = "Generic/Vector/"
const KM_RES : String = "Keyboard & Mouse/"
const META_QUEST_RES : String = "Meta Quest/"
const GC_RES: String = "Nintendo Gamecube/"
const SWITCH_RES: String = "Nintendo Switch/Vector/"
const SWITCH2_RES: String = "Nintendo Switch 2/Vector/"
const WII_RES: String = "Nintendo Wii/Vector/"
const WIIU_RES: String = "Nintendo WiiU/Vector/"
const PLAYDATE: String = "Playdate/Vector/"
const PS_RES: String = "PlayStation Series/Vector/"
const STEAM_CONTROLLER_RES: String = "Steam Controller/Vector/"
const STEAM_DECK_RES: String = "Steam Deck/Vector/"
const STEAM_FRAME_RES: String = "Steam Frame/Vector/"
const TOUCH_RES : String = "Touch/Vector/"
const VALVE_INDEX_RES : String = "Valve Index/Vector/"
const XBOX_RES : String = "Xbox Series/Vector/"

# Key Mapping
const KEY_SVG_MAP: Dictionary[Key,String] = {
	# Alphabétique
	KEY_A: "keyboard_a.svg",
	KEY_B: "keyboard_b.svg",
	KEY_C: "keyboard_c.svg",
	KEY_D: "keyboard_d.svg",
	KEY_E: "keyboard_e.svg",
	KEY_F: "keyboard_f.svg",
	KEY_G: "keyboard_g.svg",
	KEY_H: "keyboard_h.svg",
	KEY_I: "keyboard_i.svg",
	KEY_J: "keyboard_j.svg",
	KEY_K: "keyboard_k.svg",
	KEY_L: "keyboard_l.svg",
	KEY_M: "keyboard_m.svg",
	KEY_N: "keyboard_n.svg",
	KEY_O: "keyboard_o.svg",
	KEY_P: "keyboard_p.svg",
	KEY_Q: "keyboard_q.svg",
	KEY_R: "keyboard_r.svg",
	KEY_S: "keyboard_s.svg",
	KEY_T: "keyboard_t.svg",
	KEY_U: "keyboard_u.svg",
	KEY_V: "keyboard_v.svg",
	KEY_W: "keyboard_w.svg",
	KEY_X: "keyboard_x.svg",
	KEY_Y: "keyboard_y.svg",
	KEY_Z: "keyboard_z.svg",
	
	# Numbers
	KEY_0: "keyboard_0.svg",
	KEY_1: "keyboard_1.svg",
	KEY_2: "keyboard_2.svg",
	KEY_3: "keyboard_3.svg",
	KEY_4: "keyboard_4.svg",
	KEY_5: "keyboard_5.svg",
	KEY_6: "keyboard_6.svg",
	KEY_7: "keyboard_7.svg",
	KEY_8: "keyboard_8.svg",
	KEY_9: "keyboard_9.svg",
	
	# Function fkeys
	KEY_F1: "keyboard_f1.svg",
	KEY_F2: "keyboard_f2.svg",
	KEY_F3: "keyboard_f3.svg",
	KEY_F4: "keyboard_f4.svg",
	KEY_F5: "keyboard_f5.svg",
	KEY_F6: "keyboard_f6.svg",
	KEY_F7: "keyboard_f7.svg",
	KEY_F8: "keyboard_f8.svg",
	KEY_F9: "keyboard_f9.svg",
	KEY_F10: "keyboard_f10.svg",
	KEY_F11: "keyboard_f11.svg",
	KEY_F12: "keyboard_f12.svg",
	
	# Modifiers keys
	KEY_SHIFT: "keyboard_shift.svg",
	KEY_CTRL: "keyboard_ctrl.svg",
	KEY_ALT: "keyboard_alt.svg",
	KEY_META: "keyboard_meta.svg",
	KEY_CAPSLOCK: "keyboard_capslock.svg",
	KEY_NUMLOCK: "keyboard_numlock.svg",
	KEY_SCROLLLOCK: "keyboard_scrolllock.svg",
	
	# Navigation keys
	KEY_UP: "keyboard_arrow_up.svg",
	KEY_DOWN: "keyboard_arrow_down.svg",
	KEY_LEFT: "keyboard_arrow_left.svg",
	KEY_RIGHT: "keyboard_arrow_right.svg",
	KEY_PAGEUP: "keyboard_pageup.svg",
	KEY_PAGEDOWN: "keyboard_pagedown.svg",
	KEY_HOME: "keyboard_home.svg",
	KEY_END: "keyboard_end.svg",
	KEY_INSERT: "keyboard_insert.svg",
	KEY_DELETE: "keyboard_delete.svg",
	KEY_BACKSPACE: "keyboard_backspace.svg",
	KEY_TAB: "keyboard_tab.svg",
	KEY_ENTER: "keyboard_enter.svg",
	KEY_ESCAPE: "keyboard_escape.svg",
	KEY_SPACE: "keyboard_space.svg",
	
	# Symbol keys
	KEY_EXCLAM: "keyboard_exclamation.svg",
	KEY_QUOTEDBL: "keyboard_quotedbl.svg",
	KEY_NUMBERSIGN: "keyboard_numbersign.svg",
	KEY_DOLLAR: "keyboard_dollar.svg",
	KEY_PERCENT: "keyboard_percent.svg",
	KEY_AMPERSAND: "keyboard_ampersand.svg",
	KEY_APOSTROPHE: "keyboard_apostrophe.svg",
	KEY_PARENLEFT: "keyboard_parenleft.svg",
	KEY_PARENRIGHT: "keyboard_parenright.svg",
	KEY_ASTERISK: "keyboard_asterisk.svg",
	KEY_PLUS: "keyboard_plus.svg",
	KEY_COMMA: "keyboard_comma.svg",
	KEY_MINUS: "keyboard_minus.svg",
	KEY_PERIOD: "keyboard_period.svg",
	KEY_SLASH: "keyboard_slash.svg",
	KEY_COLON: "keyboard_colon.svg",
	KEY_SEMICOLON: "keyboard_semicolon.svg",
	KEY_LESS: "keyboard_less.svg",
	KEY_EQUAL: "keyboard_equal.svg",
	KEY_GREATER: "keyboard_greater.svg",
	KEY_QUESTION: "keyboard_question.svg",
	KEY_AT: "keyboard_at.svg",
	KEY_BRACKETLEFT: "keyboard_bracketleft.svg",
	KEY_BACKSLASH: "keyboard_backslash.svg",
	KEY_BRACKETRIGHT: "keyboard_bracketright.svg",
	KEY_ASCIICIRCUM: "keyboard_asciicircum.svg",
	KEY_UNDERSCORE: "keyboard_underscore.svg",
	KEY_QUOTELEFT: "keyboard_quoteleft.svg",
	KEY_BRACELEFT: "keyboard_braceleft.svg",
	KEY_BAR: "keyboard_bar.svg",
	KEY_BRACERIGHT: "keyboard_braceright.svg",
	KEY_ASCIITILDE: "keyboard_asciitilde.svg",
}

# Mapping des boutons de manette
# create a standard for buttons

const JOY_BUTTON_SVG_MAP_STANDARD: Dictionary[JoyButton,String] = {
	JOY_BUTTON_A: "joy_button_a.svg", # Sony Cross, Xbox A, Nintendo B.
	JOY_BUTTON_B: "joy_button_b.svg",# Sony Circle, Xbox B, Nintendo A.
	JOY_BUTTON_X: "joy_button_x.svg", # Sony Square, Xbox X, Nintendo Y.
	JOY_BUTTON_Y: "joy_button_y.svg", # Sony Triangle, Xbox Y, Nintendo X.
	JOY_BUTTON_BACK: "joy_button_back.svg", # Sony Select, Xbox Back, Nintendo - button.
	JOY_BUTTON_GUIDE: "joy_button_guide.svg", # Sony PS, Xbox Home button.
	JOY_BUTTON_START: "joy_button_start.svg", # Sony Options, Xbox Menu, Nintendo + button.
	JOY_BUTTON_LEFT_STICK: "joy_button_left_stick.svg",
	JOY_BUTTON_RIGHT_STICK: "joy_button_right_stick.svg",
	JOY_BUTTON_LEFT_SHOULDER: "joy_button_lb.svg",
	JOY_BUTTON_RIGHT_SHOULDER: "joy_button_rb.svg",
	JOY_BUTTON_DPAD_UP: "joy_button_dpad_up.svg",
	JOY_BUTTON_DPAD_DOWN: "joy_button_dpad_down.svg",
	JOY_BUTTON_DPAD_LEFT: "joy_button_dpad_left.svg",
	JOY_BUTTON_DPAD_RIGHT: "joy_button_dpad_right.svg",
	JOY_BUTTON_MISC1: "joy_button_misc1.svg", # Xbox share button, PS5 microphone button, Nintendo Switch capture button.
	JOY_BUTTON_PADDLE1: "joy_button_paddle1.svg", # xbox_elite_paddle_bottom_left
	JOY_BUTTON_PADDLE2: "joy_button_paddle2.svg", # xbox_elite_paddle_bottom_right
	JOY_BUTTON_PADDLE3: "joy_button_paddle3.svg", # xbox_elite_paddle_top_left
	JOY_BUTTON_PADDLE4: "joy_button_paddle4.svg", # xbox_elite_paddle_top_right
	JOY_BUTTON_TOUCHPAD: "joy_button_touchpad.svg",
	JOY_BUTTON_MISC2: "joy_button_misc2.svg", #Nintendo Switch 2 Pro Controller and Horipad Steam controllers
	JOY_BUTTON_MISC3: "joy_button_misc3.svg",
	JOY_BUTTON_MISC4: "joy_button_misc4.svg",
	JOY_BUTTON_MISC5: "joy_button_misc5.svg",
	JOY_BUTTON_MISC6: "joy_button_misc6.svg"
}


# float axis_value = 0.0
# InputEventJoypadMotion JoyAxis float
const JOY_AXIS_SVG_MAP_STANDARD: Dictionary[JoyAxis,String] = {
	#1: stick size, 2: direction input
	JOY_AXIS_LEFT_X: "joy_axis_left_x",
	JOY_AXIS_LEFT_Y: "joy_axis_left_y",
	JOY_AXIS_RIGHT_X: "joy_axis_right_x",
	JOY_AXIS_RIGHT_Y: "joy_axis_right_y",
	JOY_AXIS_TRIGGER_LEFT: "joy_axis_trigger_l.svg",
	JOY_AXIS_TRIGGER_RIGHT: "joy_axis_trigger_r.svg",
}

const JOY_AXIS_VALUE_SVG_MAP_STANDARD : Dictionary[String,String] = {
	"positive": "_pos.svg",
	"negative": "_neg.svg"
}

# Mapping des boutons souris
const MOUSE_BUTTON_SVG_MAP: Dictionary[MouseButton,String] = {
	MOUSE_BUTTON_LEFT: "mouse_left.svg",
	MOUSE_BUTTON_RIGHT: "mouse_right.svg",
	MOUSE_BUTTON_MIDDLE: "mouse_middle.svg",
	MOUSE_BUTTON_WHEEL_UP: "mouse_scroll_up.svg",
	MOUSE_BUTTON_WHEEL_DOWN: "mouse_scroll_down.svg",
	MOUSE_BUTTON_WHEEL_LEFT: "mouse_scroll_left.svg",
	MOUSE_BUTTON_WHEEL_RIGHT: "mouse_scroll_right.svg",
	MOUSE_BUTTON_XBUTTON1: "mouse_side_forward.svg",
	MOUSE_BUTTON_XBUTTON2: "mouse_side_back.svg",
}

# Mapping des actions InputMap vers les SVG
# Par défaut, on essaie de mapper automatiquement
var _action_svg_cache: Dictionary = {}


func get_svg_for_key(key: Key) -> String:
	"""
	Return SVG path from a keyboard touch
	Exemple: get_svg_for_key(KEY_A) 
	"""
	if KEY_SVG_MAP.has(key):
		return SVG_PATH + KM_RES + KEY_SVG_MAP[key]
	return "res://addons/inputtosvg/Assets/KenneyInput/Flairs/flair_disabled_cross.svg"

func get_svg_for_joy_button(manette : String, button: JoyButton) -> String:
	"""
	Return SVG path for joypadButton
	Exemple: get_svg_for_joy_button(JoyButton.A) 
	"""
# https://github.com/mdqinc/SDL_GameControllerDB/blob/master/gamecontrollerdb.txt
	var path_controller : String = SVG_PATH
	match manette:
		"playstation", "PS5 Controller", "PS4 Controller", "PS3 Controller", "PS2 Controller", "Sony DualShock 4 Adapter":
			path_controller =path_controller + PS_RES
		"xbox", "Xbox 360 Controller",  "Xbox Adaptive Controller", "Xbox Elite Controller", "Xbox One Controller", "Xbox Series Controller" :
			path_controller = path_controller + XBOX_RES
		"switch", "Nintendo Switch Controller", "Nintendo Switch Pro Controller", "Nintendo Switch Joy-Con (L)", "Nintendo Switch Joy-Con (R)" :
			path_controller = path_controller + SWITCH_RES
		"gamecube", "GameCube" ,"GC and N64", "NSO GameCube Controller":
			path_controller = path_controller + GC_RES 
		"steam", "Steam", "Steam Virtual Gamepad", "Valve Steam Controller", "Valve Steam Deck":
			path_controller = path_controller + STEAM_CONTROLLER_RES
		"switch2", "switch 2", "Nintendo Switch 2 Controller":
			path_controller = path_controller + SWITCH2_RES
		_:
			path_controller = path_controller + GENERIC_RES
	if JOY_BUTTON_SVG_MAP_STANDARD.has(button):
		return path_controller + "standard/"+ JOY_BUTTON_SVG_MAP_STANDARD[button] # standarisé les noms des buttons
	return "res://addons/inputtosvg/Assets/KenneyInput/Flairs/flair_disabled_cross.svg"

func get_svg_for_joy_axis(manette : String, axis: JoyAxis, value: float) -> String:
	"""
	Return SVG path of Controller Axis
	direction: "up", "down", "left", "right" pour les sticks
	"""
	var path_controller : String = SVG_PATH
	match manette:
		"playstation", "PS5 Controller", "PS4 Controller", "PS3 Controller", "PS2 Controller", "Sony DualShock 4 Adapter":
			path_controller =path_controller + PS_RES
		"xbox", "Xbox 360 Controller",  "Xbox Adaptive Controller", "Xbox Elite Controller", "Xbox One Controller", "Xbox Series Controller" :
			path_controller = path_controller + XBOX_RES
		"switch", "Nintendo Switch Controller", "Nintendo Switch Pro Controller", "Nintendo Switch Joy-Con (L)", "Nintendo Switch Joy-Con (R)" :
			path_controller = path_controller + SWITCH_RES
		"gamecube", "GameCube" ,"GC and N64", "NSO GameCube Controller":
			path_controller = path_controller + GC_RES 
		"steam", "Steam", "Steam Virtual Gamepad", "Valve Steam Controller", "Valve Steam Deck":
			path_controller = path_controller + STEAM_CONTROLLER_RES
		"switch2", "switch 2", "Nintendo Switch 2 Controller":
			path_controller = path_controller + SWITCH2_RES
		_:
			path_controller = path_controller + GENERIC_RES
	path_controller = path_controller + "standard/"
	if JOY_AXIS_SVG_MAP_STANDARD.has(axis):
		path_controller = path_controller + JOY_AXIS_SVG_MAP_STANDARD[axis]
		if axis == JOY_AXIS_TRIGGER_LEFT or axis == JOY_AXIS_TRIGGER_RIGHT:
			return path_controller
		if value > 0:
			path_controller = path_controller + "_pos.svg"
		elif value <0:
			path_controller = path_controller + "_neg.svg"
		return path_controller
	return "res://addons/inputtosvg/Assets/KenneyInput/Flairs/flair_disabled_cross.svg"



func get_svg_for_mouse_button(button: MouseButton) -> String:
	"""
	Return SVG path of mouse button
	"""
	if MOUSE_BUTTON_SVG_MAP.has(button):
		return SVG_PATH +KM_RES+ MOUSE_BUTTON_SVG_MAP[button]
	return "res://addons/inputtosvg/Assets/KenneyInput/Flairs/flair_disabled_cross.svg"
