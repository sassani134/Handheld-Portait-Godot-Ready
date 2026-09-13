extends RichTextLabel

@export var reveal_speed: float = 0.05  # Temps entre chaque lettre
@export var color_duration: float = 0.3  # Durée de l'effet arc-en-ciel par lettre

var _full_text: String = ""
var _current_index: int = 0
var _tween: Tween
var _characters: Array = []

func _ready():
	_full_text = text
	text = ""  # On efface le texte initial
	
	# Récupère tous les caractères
	for i in range(_full_text.length()):
		_characters.append(_full_text[i])
	
	# Commence l'animation
	_reveal_next_character()

func _reveal_next_character():
	if _current_index >= _characters.size():
		return
	
	# Ajoute le prochain caractère
	var current_text = text
	var next_char = _characters[_current_index]
	text = current_text + next_char
	
	# Crée le tween pour l'effet de couleur sur ce caractère
	_animate_character_color(_current_index)
	
	_current_index += 1
	
	# Programme la prochaine lettre
	await get_tree().create_timer(reveal_speed).timeout
	_reveal_next_character()

func _animate_character_color(char_index: int):
	# Crée un nouveau tween
	if _tween and _tween.is_running():
		_tween.kill()
	_tween = create_tween()
	_tween.set_parallel(true)
	
	# Sélectionne le caractère à animer
	var char_position = char_index
	var color_begin = Color(1, 0, 0)  # Rouge
	var color_end = Color(0, 0.5, 1)  # Bleu
	
	# Anime la couleur du caractère du rouge vers le bleu en passant par l'arc-en-ciel
	_tween.tween_method(
		_set_character_color.bind(char_position),
		0.0, 1.0, color_duration
	)

func _set_character_color(progress: float, char_index: int):
	# Calcule la couleur arc-en-ciel en fonction du temps
	var hue = progress * 0.7  # 0.7 = ~252° pour aller du rouge au bleu
	var color = Color.from_hsv(hue, 1.0, 1.0)
	
	# Applique la couleur au caractère
	_set_char_color(char_index, color)

func _set_char_color(index: int, color: Color):
	# Construit le BBcode pour ce caractère
	var before = _full_text.left(index)
	var char = _full_text[index]
	var after = _full_text.right(index + 1)
	
	# Applique la couleur via BBCode
	var colored_text = "[color=#%02x%02x%02x]%s[/color]" % [
		int(color.r * 255),
		int(color.g * 255),
		int(color.b * 255),
		char
	]
	
	# Attention : Cette méthode réécrit tout le texte, ce qui peut causer des problèmes
	# car les autres caractères perdent leurs couleurs. Pour un vrai effet multi-caractères,
	# nous devons gérer chaque caractère indépendamment.
	
	# Version améliorée : on utilise un dictionnaire de couleurs par position
	if not has_meta("char_colors"):
		set_meta("char_colors", {})
	
	var colors = get_meta("char_colors")
	colors[index] = color
	set_meta("char_colors", colors)
	
	# Reconstruit tout le texte avec toutes les couleurs
	_rebuild_colored_text()

func _rebuild_colored_text():
	var colors = get_meta("char_colors", {})
	var result = ""
	
	for i in range(_full_text.length()):
		if colors.has(i):
			var color = colors[i]
			var char = _full_text[i]
			result += "[color=#%02x%02x%02x]%s[/color]" % [
				int(color.r * 255),
				int(color.g * 255),
				int(color.b * 255),
				char
			]
		else:
			result += _full_text[i]
	
	text = result

# Pour un effet plus propre, voici une version alternative qui utilise 
# la méthode append_text et tient compte que RichTextLabel supporte le BBCode
