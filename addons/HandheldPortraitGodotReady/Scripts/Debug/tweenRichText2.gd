extends RichTextLabel

@export var reveal_speed: float = 0.04
@export var wave_delay: float = 0.1
@export var color_speed: float = 2.0

var _full_text: String = ""
var _visible_chars: int = 0
var _char_timers: Dictionary = {}
var _char_colors: Dictionary = {}

func _ready():
	_full_text = text
	text = ""
	bbcode_enabled = true
	
	# Commence l'animation
	_reveal_next()

func _reveal_next():
	if _visible_chars >= _full_text.length():
		return
	
	_visible_chars += 1
	
	# Calcule le délai de couleur pour ce caractère en fonction de la vague
	var char_index = _visible_chars - 1
	var delay = char_index * wave_delay
	
	# Ajoute le caractère
	_update_text()
	
	# Lance l'animation de couleur après un délai
	_animate_char_color(char_index, delay)
	
	# Planifie la prochaine révélation
	await get_tree().create_timer(reveal_speed).timeout
	_reveal_next()

func _animate_char_color(index: int, delay: float):
	# Utilise un timer pour le délai
	await get_tree().create_timer(delay).timeout
	
	var tween = create_tween()
	tween.set_parallel(true)
	
	# Animation arc-en-ciel (boucle continue)
	tween.tween_method(
		func(time: float):
			#var hue = time % 1.0
			var hue = fmod(time, 1.0)
			var color = Color.from_hsv(hue, 1.0, 0.9)
			_char_colors[index] = color
			_update_text(),
		0.0, 2.0, 2.0  # Arc-en-ciel pendant 2 secondes
	)
	
	# Transition vers le bleu après l'arc-en-ciel
	tween.tween_method(
		func(progress: float):
			var end_color = Color(0, 0.5, 1)
			var current_color = _char_colors.get(index, Color.WHITE)
			var color = current_color.lerp(end_color, progress)
			_char_colors[index] = color
			_update_text(),
		0.0, 1.0, 0.5
	).set_delay(2.0)

func _update_text():
	var result = ""
	for i in range(_full_text.length()):
		var char = _full_text[i]
		if i < _visible_chars and _char_colors.has(i):
			var color = _char_colors[i]
			result += "[color=#%02x%02x%02x]%s[/color]" % [
				int(color.r * 255),
				int(color.g * 255),
				int(color.b * 255),
				char
			]
		elif i < _visible_chars:
			result += "[color=#0000ff]%s[/color]" % char  # Bleu par défaut
		else:
			result += char
	
	text = result
