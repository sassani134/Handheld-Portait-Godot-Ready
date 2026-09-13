extends Node
# DeviceManager.gd - Autoload

# Cache des capacités (read-only)
var device_info: Dictionary = {}
var capabilities: Dictionary = {}

func _ready() -> void:
	_initialize_device_info()
	_initialize_capabilities()
	print("Device Manager initialized: ", device_info)

func _initialize_device_info() -> void:
	"""Initialise les informations de base du périphérique"""

	
	device_info = {
		"os_name": OS.get_name(),
		"os_version": OS.get_version(),
		"locale": OS.get_locale(),
		"locale_language": OS.get_locale_language(),
		"model": OS.get_model_name() if OS.has_feature("android") else "Unknown",
		"is_web": OS.has_feature("web"),
		"is_mobile": OS.has_feature("android") or OS.has_feature("ios"),
		"is_desktop": OS.has_feature("windows") or OS.has_feature("linux") or OS.has_feature("macos"),
		"is_debug": OS.is_debug_build(),
	}
# which web is really can i not make assumption with known data
# web_android, web_ios, web_linuxbsd, web_macos, or web_windows.


func _initialize_capabilities() -> void:
	"""Initialise les capacités du périphérique"""
	capabilities = {
		# Affichage
		"touchscreen": DisplayServer.is_touchscreen_available(),
		"virtual_keyboard": DisplayServer.has_feature(DisplayServer.FEATURE_VIRTUAL_KEYBOARD),
		"mouse": DisplayServer.has_feature(DisplayServer.FEATURE_MOUSE),
		"cursor": DisplayServer.has_feature(DisplayServer.FEATURE_CURSOR_SHAPE),
		
		# Haptique (vibration)
		"vibration": OS.has_feature("android") or OS.has_feature("ios"),

		
		# Audio on s'en fout non ?
		#"audio": AudioServer.get_driver_list().size() > 0,
		
		# Réseau
		"network": OS.has_feature("network"),
		
		## Stockage
		#"storage": OS.has_feature("storage"),
	}

# ─── Méthodes d'interrogation ───

func is_mobile() -> bool:
	return device_info.is_mobile

func is_desktop() -> bool:
	return device_info.is_desktop

func is_web() -> bool:
	return device_info.is_web

func has_touchscreen() -> bool:
	return capabilities.touchscreen

func has_virtual_keyboard() -> bool:
	return capabilities.virtual_keyboard

func has_mouse() -> bool:
	return capabilities.mouse

func has_gamepad() -> bool:
	return capabilities.gamepad

func can_vibrate() -> bool:
	return capabilities.vibration

# ─── Actions ───

#func show_virtual_keyboard(visible: bool) -> void:
	#"""Affiche ou cache le clavier virtuel"""
	#if capabilities.virtual_keyboard:
		#_display_server.virtual_keyboard_show(visible)
	#else:
		#push_warning("Virtual keyboard not available on this device")

func vibrate_phone(duration_ms: int = 100) -> void:
	"""Vibrate Phone if availaible"""
	if capabilities.vibration:
		# Pour Android, utiliser le plugin ou Input.vibrate_handheld()
		# Pour iOS, utiliser le plugin
		if OS.has_feature("android"):
			# Android : Utiliser le plugin Android
			if Engine.has_singleton("GodotVibration"):
				Engine.get_singleton("GodotVibration").vibrate(duration_ms)
			else:
				push_warning("Vibration plugin not found")
		elif OS.has_feature("ios"):
			# iOS : Utiliser le plugin iOS
			push_warning("iOS vibration not implemented yet")
	else:
		push_warning("Vibration not available on this device")

# ─── Vérification rapide pour l'UI ───

func should_use_virtual_keyboard() -> bool:
	"""Détermine si on doit afficher un clavier virtuel"""
	return has_touchscreen() and has_virtual_keyboard()

func should_show_touch_controls() -> bool:
	"""Détermine si on doit afficher des contrôles tactiles"""
	return has_touchscreen() and not has_mouse()

func should_show_gamepad_ui() -> bool:
	"""Détermine si on doit afficher l'UI pour gamepad"""
	return has_gamepad()
