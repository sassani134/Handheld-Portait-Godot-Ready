extends OptionButton

const LANGUAGES := {
	"KEY_ENGLISH": "en",
	"KEY_FRENCH": "fr"
}

# Called when the node enters the scene tree for the first time.
func _ready():
	self.item_focused.connect(_on_ui_hover_focus)
	self.mouse_entered.connect(_on_ui_hover_focus)
	self.item_selected.connect(_on_ui_pressed)
	
	for lang_name in LANGUAGES.keys():
		var i := 0
		self.add_item(lang_name)
	
	#todo add item icon acording to languages in a loop maybe use a dict of array["en","flagPath"]
	self.set_item_icon(0,load("res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyFlagPack/Vector/US.svg"))
	self.set_item_icon(1,load("res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyFlagPack/Vector/FR.svg"))
	
	var current_locale := TranslationServer.get_locale()
	for i in range(self.item_count):
		var lang_name := self.get_item_text(i)
		print(lang_name)
		if current_locale.begins_with(LANGUAGES[lang_name]):
			self.select(i)
			break

 
	self.item_selected.connect(_on_language_selected)
 
func _on_language_selected(index: int):
	var lang_name := self.get_item_text(index)
	var locale = LANGUAGES[lang_name]
	TranslationServer.set_locale(locale)
	SettingsManager.language_settings["locale"] = locale
	print("Locale set to:", locale)
	SettingsManager.save_settings()
 
func _on_ui_pressed() -> void:
	AudioSoundUi._on_ui_pressed()

func _on_ui_hover_focus() -> void:
	AudioSoundUi._on_ui_hover_focus()
