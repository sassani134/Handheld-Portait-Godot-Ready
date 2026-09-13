# find_svg_icon.gd - Autoload
extends Node

# ─── Chemins des SVG ───
const SVG_PATH: String = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/"
const PS5_RES: String = ""
const PS4_RES: String = ""
const PS3_RES: String = ""
const GC_RES: String = ""
const SWITCH_RES: String = "Nintendo Switch/Vector/"
const STEAM_RES: String = ""
const GENERIC_RES : String = "Generic/Vector/"
const KM_RES : String = "Keyboard & Mouse/Vector/"
const TOUCH_RES : String = "Touch/Vector/"

# Mapping des touches
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
	
	# Chiffres
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
	
	# Fonctions
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
	
	# Modificateurs
	KEY_SHIFT: "keyboard_shift.svg",
	KEY_CTRL: "keyboard_ctrl.svg",
	KEY_ALT: "keyboard_alt.svg",
	KEY_META: "keyboard_meta.svg",
	KEY_CAPSLOCK: "keyboard_capslock.svg",
	KEY_NUMLOCK: "keyboard_numlock.svg",
	KEY_SCROLLLOCK: "keyboard_scrolllock.svg",
	
	# Navigation
	KEY_UP: "keyboard_up.svg",
	KEY_DOWN: "keyboard_down.svg",
	KEY_LEFT: "keyboard_left.svg",
	KEY_RIGHT: "keyboard_right.svg",
	KEY_PAGEUP: "oard_pageup.svg",
	KEY_PAGEDOWN: "oard_pagedown.svg",
	KEY_HOME: "oard_home.svg",
	KEY_END: "oard_end.svg",
	KEY_INSERT: "oard_insert.svg",
	KEY_DELETE: "oard_delete.svg",
	KEY_BACKSPACE: "oard_backspace.svg",
	KEY_TAB: "oard_tab.svg",
	KEY_ENTER: "oard_enter.svg",
	KEY_ESCAPE: "oard_escape.svg",
	KEY_SPACE: "oard_space.svg",
	
	# Symboles
	KEY_EXCLAM: "oard_exclam.svg",
	KEY_QUOTEDBL: "oard_quotedbl.svg",
	KEY_NUMBERSIGN: "oard_numbersign.svg",
	KEY_DOLLAR: "oard_dollar.svg",
	KEY_PERCENT: "oard_percent.svg",
	KEY_AMPERSAND: "oard_ampersand.svg",
	KEY_APOSTROPHE: "oard_apostrophe.svg",
	KEY_PARENLEFT: "oard_parenleft.svg",
	KEY_PARENRIGHT: "oard_parenright.svg",
	KEY_ASTERISK: "oard_asterisk.svg",
	KEY_PLUS: "oard_plus.svg",
	KEY_COMMA: "oard_comma.svg",
	KEY_MINUS: "oard_minus.svg",
	KEY_PERIOD: "oard_period.svg",
	KEY_SLASH: "oard_slash.svg",
	KEY_COLON: "oard_colon.svg",
	KEY_SEMICOLON: "oard_semicolon.svg",
	KEY_LESS: "oard_less.svg",
	KEY_EQUAL: "oard_equal.svg",
	KEY_GREATER: "oard_greater.svg",
	KEY_QUESTION: "oard_question.svg",
	KEY_AT: "oard_at.svg",
	KEY_BRACKETLEFT: "oard_bracketleft.svg",
	KEY_BACKSLASH: "oard_backslash.svg",
	KEY_BRACKETRIGHT: "oard_bracketright.svg",
	KEY_ASCIICIRCUM: "oard_asciicircum.svg",
	KEY_UNDERSCORE: "oard_underscore.svg",
	KEY_QUOTELEFT: "oard_quoteleft.svg",
	KEY_BRACELEFT: "oard_braceleft.svg",
	KEY_BAR: "keyboard_bar.svg",
	KEY_BRACERIGHT: "keyboard_braceright.svg",
	KEY_ASCIITILDE: "keyboard_asciitilde.svg",
}

# Mapping des boutons de manette
const JOY_BUTTON_SVG_MAP: Dictionary[JoyButton,String] = {
	JOY_BUTTON_A: "xbox_a.svg",
	JOY_BUTTON_B: "xbox_b.svg",
	JOY_BUTTON_X: "xbox_x.svg",
	JOY_BUTTON_Y: "xbox_y.svg",
	JOY_BUTTON_BACK: "xbox_back.svg",
	JOY_BUTTON_GUIDE: "xbox_guide.svg",
	JOY_BUTTON_START: "xbox_start.svg",
	JOY_BUTTON_LEFT_STICK: "xbox_left_stick.svg",
	JOY_BUTTON_RIGHT_STICK: "xbox_right_stick.svg",
	JOY_BUTTON_LEFT_SHOULDER: "xbox_lb.svg",
	JOY_BUTTON_RIGHT_SHOULDER: "xbox_rb.svg",
	JOY_BUTTON_DPAD_UP: "xbox_dpad_up.svg",
	JOY_BUTTON_DPAD_DOWN: "xbox_dpad_down.svg",
	JOY_BUTTON_DPAD_LEFT: "xbox_dpad_left.svg",
	JOY_BUTTON_DPAD_RIGHT: "xbox_dpad_right.svg",
	JOY_BUTTON_MISC1: "xbox_menu.svg",
	JOY_BUTTON_PADDLE1: "xbox_paddle1.svg",
	JOY_BUTTON_PADDLE2: "xbox_paddle2.svg",
	JOY_BUTTON_PADDLE3: "xbox_paddle3.svg",
	JOY_BUTTON_PADDLE4: "xbox_paddle4.svg",
	JOY_BUTTON_TOUCHPAD: "xbox_touchpad.svg",
}

# Mapping des axes de manette (pour les triggers/gâchettes)
const JOY_AXIS_SVG_MAP: Dictionary[JoyAxis,String] = {
	JOY_AXIS_LEFT_X: "xbox_left_stick.svg",
	JOY_AXIS_LEFT_Y: "xbox_left_stick.svg",
	JOY_AXIS_RIGHT_X: "xbox_right_stick.svg",
	JOY_AXIS_RIGHT_Y: "xbox_right_stick.svg",
	JOY_AXIS_TRIGGER_LEFT: "xbox_lt.svg",
	JOY_AXIS_TRIGGER_RIGHT: "xbox_rt.svg",
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
	MOUSE_BUTTON_XBUTTON1: "mouse_x1.svg",
	MOUSE_BUTTON_XBUTTON2: "mouse_x2.svg",
}

# Mapping des actions InputMap vers les SVG
# Par défaut, on essaie de mapper automatiquement
var _action_svg_cache: Dictionary = {}

# ─── Méthodes principales ───

func get_svg_for_key(key: Key) -> String:
	"""
	Retourne le chemin du SVG correspondant à une touche clavier.
	Exemple: get_svg_for_key(KEY_A) -> "res://assets/icons/inputs/key_a.svg"
	"""
	if KEY_SVG_MAP.has(key):
		return SVG_PATH + KEY_SVG_MAP[key]
	return SVG_PATH + "key_unknown.svg"

func get_svg_for_joy_button(button: JoyButton) -> String:
	"""
	Retourne le chemin du SVG correspondant à un bouton de manette.
	Exemple: get_svg_for_joy_button(JoyButton.A) -> "res://assets/icons/inputs/xbox_a.svg"
	"""
	if JOY_BUTTON_SVG_MAP.has(button):
		return SVG_PATH + JOY_BUTTON_SVG_MAP[button]
	return SVG_PATH + "gamepad_unknown.svg"

func get_svg_for_joy_axis(axis: JoyAxis, direction: String = "") -> String:
	"""
	Retourne le chemin du SVG correspondant à un axe de manette.
	direction: "up", "down", "left", "right" pour les sticks
	"""
	if JOY_AXIS_SVG_MAP.has(axis):
		var base_path = SVG_PATH + JOY_AXIS_SVG_MAP[axis]
		# Pour les sticks directionnels, on peut avoir des variantes
		if direction != "" and (axis == JoyAxis.JOY_AXIS_LEFT_X or axis == JoyAxis.JOY_AXIS_LEFT_Y or 
								 axis == JoyAxis.JOY_AXIS_RIGHT_X or axis == JoyAxis.JOY_AXIS_RIGHT_Y):
			var variant = base_path.replace(".svg", "_" + direction + ".svg")
			if ResourceLoader.exists(variant):
				return variant
		return base_path
	return SVG_PATH + "gamepad_unknown.svg"

func get_svg_for_mouse_button(button: MouseButton) -> String:
	"""
	Retourne le chemin du SVG correspondant à un bouton souris.
	"""
	if MOUSE_BUTTON_SVG_MAP.has(button):
		return SVG_PATH + MOUSE_BUTTON_SVG_MAP[button]
	return SVG_PATH + "mouse_unknown.svg"

func get_svg_for_input_event(event: InputEvent) -> String:
	"""
	Retourne le chemin du SVG correspondant à un événement input.
	Fonction principale à utiliser dans la plupart des cas.
	"""
	if event is InputEventKey:
		var key_event = event as InputEventKey
		return get_svg_for_key(key_event.keycode)
	
	elif event is InputEventJoypadButton:
		var joy_event = event as InputEventJoypadButton
		return get_svg_for_joy_button(joy_event.button_index)
	
	elif event is InputEventJoypadMotion:
		var joy_event = event as InputEventJoypadMotion
		# Pour les axes, on détecte la direction JOY_AXIS_TRIGGER_LEFT
		if joy_event.axis == JoyAxis.JOY_AXIS_TRIGGER_LEFT or joy_event.axis == JoyAxis.JOY_AXIS_TRIGGER_RIGHT:
			return get_svg_for_joy_axis(joy_event.axis)
		elif joy_event.axis_value > 0.5:
			return get_svg_for_joy_axis(joy_event.axis, "right")
		elif joy_event.axis_value < -0.5:
			return get_svg_for_joy_axis(joy_event.axis, "left")
		else:
			return get_svg_for_joy_axis(joy_event.axis)
	
	elif event is InputEventMouseButton:
		var mouse_event = event as InputEventMouseButton
		return get_svg_for_mouse_button(mouse_event.button_index)
	
	return SVG_PATH + "unknown.svg"

func get_svg_for_action(action_name: String) -> String:
	"""
	Retourne le SVG correspondant à une action InputMap.
	Utilise le cache pour les performances.
	"""
	# Vérifier le cache
	if _action_svg_cache.has(action_name):
		return _action_svg_cache[action_name]
	
	# Chercher dans les actions définies dans InputMap
	if InputMap.has_action(action_name):
		var events = InputMap.action_get_events(action_name)
		if events.size() > 0:
			# Prendre le premier événement
			var svg_path = get_svg_for_input_event(events[0])
			_action_svg_cache[action_name] = svg_path
			return svg_path
	
	# Fallback
	_action_svg_cache[action_name] = SVG_PATH + "unknown.svg"
	return _action_svg_cache[action_name]

func get_svg_for_action_with_fallback(action_name: String, fallback_svg: String = "") -> String:
	"""
	Retourne le SVG correspondant à une action, avec fallback personnalisé.
	"""
	var result = get_svg_for_action(action_name)
	if result == SVG_PATH + "unknown.svg" and fallback_svg != "":
		return fallback_svg
	return result

# ─── Méthodes utilitaires ───

func get_all_action_svgs() -> Dictionary:
	"""
	Retourne un dictionnaire de toutes les actions InputMap avec leurs SVG.
	Utile pour les paramètres/options.
	"""
	var result = {}
	for action in InputMap.get_actions():
		result[action] = get_svg_for_action(action)
	return result

func get_svg_path_for_key_name(key_name: String) -> String:
	"""
	Version alternative : utiliser le nom de la touche en string.
	Exemple: get_svg_path_for_key_name("A") -> "res://.../key_a.svg"
	"""
	var key = OS.find_keycode_from_string(key_name)
	if key != KEY_NONE:
		return get_svg_for_key(key)
	return SVG_PATH + "key_unknown.svg"

func get_icon_texture(svg_path: String) -> Texture2D:
	"""
	Charge et retourne une texture depuis un SVG.
	Utile pour afficher directement l'icône.
	"""
	if ResourceLoader.exists(svg_path):
		return load(svg_path) as Texture2D
	return null

func get_icon_for_action(action_name: String) -> Texture2D:
	"""
	Retourne directement la texture pour une action.
	"""
	var svg_path = get_svg_for_action(action_name)
	return get_icon_texture(svg_path)

# ─── Debug ───

func debug_print_action_mappings() -> void:
	"""
	Affiche toutes les actions avec leurs SVG correspondants.
	Utile pour le debug.
	"""
	print("=== Action SVG Mappings ===")
	for action in InputMap.get_actions():
		var svg = get_svg_for_action(action)
		print("%s -> %s" % [action, svg])
