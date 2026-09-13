extends Node

# Input
var has_touch_screen : bool
var has_v_keyboard : bool

# Software
var os_name : String
var os_model_name : String
# var web_feature bool has_feature(tag_name: String) const
# bool is debug_build() const

# Hardware

# Misc
var language : String

#const PLATFORMS = {
	## From gamecontrollerdb
	#"Windows": "Windows",
	#"OSX": "Mac OS X",
	#"X11": "Linux",
	#"Android": "Android",
	#"iOS": "iOS",
	## Godot customs
	#"HTML5": "Javascript",
	#"UWP": "UWP",
	## 4.x compat
	#"Linux": "Linux",
	#"FreeBSD": "Linux",
	#"NetBSD": "Linux",
	#"BSD": "Linux",
	#"macOS": "Mac OS X",
#}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	os_name = OS.get_name() # "Windows", "macOS", "Linux", "Android", "iOS", "Web"
	# "FreeBSD", "NetBSD", "OpenBSD", "BSD"
	os_model_name = OS.get_model_name()
	
	has_touch_screen = DisplayServer.is_touchscreen_available()
	has_v_keyboard = DisplayServer.has_feature(DisplayServer.FEATURE_VIRTUAL_KEYBOARD)
	OS.get_locale()
	OS.get_locale_language()
	OS.has_feature("web")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
