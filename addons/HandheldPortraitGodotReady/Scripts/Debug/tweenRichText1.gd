extends RichTextLabel

@export var reveal_speed: float = 0.05
@export var color_duration: float = 0.3

var _full_text: String = ""
var _current_index: int = 0
var _char_colors: Dictionary = {}
# [center][font_size=85][color=#001a66][i]GODOT READY[/i][/color][/font_size]

func _ready():
	_full_text = text
	text = ""
	
	bbcode_enabled = true
	
	_reveal_next_character()

func _reveal_next_character():
	if _current_index >= _full_text.length():
		return
	
	var current_text = text
	text = current_text + _full_text[_current_index]
	
	# Sauvegarde la position et sa couleur cible
	_char_colors[_current_index] = Color(0, 0.5, 1)  # Bleu final
	
	_animate_rainbow(_current_index)
	
	_current_index += 1
	await get_tree().create_timer(reveal_speed).timeout
	_reveal_next_character()

func _animate_rainbow(char_index: int):
	var tween = create_tween()
	tween.set_parallel(true)
	
	# Create the rainbow effect red to blue
	var start_time = Time.get_ticks_msec() / 10000.0
	
	tween.tween_method(
		func(progress: float):
			var hue = progress * 0.7
			var color = Color.from_hsv(hue, 1.0, 0.9)
			_char_colors[char_index] = color
			_update_display(),
		0.0, 1.0, color_duration
	).set_ease(Tween.EASE_IN_OUT)
	
	# Assure que la couleur finale est bleue
	tween.tween_method(
		func(_p: float):
			_char_colors[char_index] = Color(0, 0.5, 1)
			_update_display(),
		1.0, 1.0, 0.01
	)

# [center][font_size=85][color=#001a66][i]GODOT READY[/i][/color][/font_size]
func _update_display():
	# Reconstruit le texte avec toutes les couleurs
	var result = ""
	for i in range(_full_text.length()):
		var char = _full_text[i]
		if _char_colors.has(i) and i < _current_index:
			var color = _char_colors[i]
			result += "[font_size=85][color=#%02x%02x%02x]%s[/color][/font_size]" % [
				int(color.r * 255),
				int(color.g * 255),
				int(color.b * 255),
				char
			]
		else:
			result += char
	
	# Applique le texte avec BBCode
	#append_text(result)
	text = result
