extends Control

@onready var label: RichTextLabel = $RichTextLabel
@onready var sfx: AudioStreamPlayer = $AudioStreamPlayer  # ton son synchronisé

const FULL_TEXT := "Handheld Portrait"
const LETTER_DELAY := 0.09          # vitesse d'apparition des lettres
const RAINBOW_CYCLE_TIME := 0.6     # durée du défilement arc-en-ciel
const FINAL_BLUE := Color("#0088ff") # bleu final (modifiable)

# Palette arc-en-ciel (basée sur ton BBCode)
var rainbow_palette: Array[Color] = [
	Color("#ff00ff"), # H
	Color("#aa00ff"), # a
	Color("#00ff44"), # n
	Color("#ffdd00"), # d
	Color("#00ddff"), # h
	Color("#00ddff"), # e
	Color("#ffdd00"), # l
	Color("#00ff44"), # d
	Color("#ffffff"), # espace (invisible)
	Color("#aa00ff"), # P
	Color("#ff00ff"), # o
	Color("#ff00ff"), # r
	Color("#aa00ff"), # t
	Color("#00ff44"), # r
	Color("#ffdd00"), # a
	Color("#00ddff"), # i
	Color("#00ddff"), # t
]

func _ready() -> void:
	label.bbcode_enabled = true
	label.fit_content = true
	label.autowrap_mode = TextServer.AUTOWRAP_OFF
	
	# Texte incliné (effet console portable)
	label.rotation_degrees = -7.0
	label.pivot_offset = label.size / 2.0
	
	label.text = ""
	play_intro()

func play_intro() -> void:
	var tween := create_tween()
	tween.set_parallel(false)
	
	# 1. Apparition lettre par lettre avec couleurs arc-en-ciel
	for i in FULL_TEXT.length():
		tween.tween_callback(add_letter.bind(i))
		tween.tween_interval(LETTER_DELAY)
	
	# 2. Petite pause une fois le texte complet
	tween.tween_interval(0.25)
	
	# 3. Défilement arc-en-ciel (plusieurs cycles)
	tween.tween_method(update_rainbow_shift, 0.0, 1.0, RAINBOW_CYCLE_TIME)
	
	# 4. Passage progressif vers le bleu final
	tween.tween_method(fade_to_blue, 0.0, 1.0, 0.7)
	
	# 5. Son synchronisé à la toute fin du tween
	tween.tween_callback(play_sound)

func add_letter(index: int) -> void:
	var bbcode := "[center][font_size=80]"
	
	for i in index + 1:
		var char = FULL_TEXT[i]
		if char == " ":
			bbcode += " "
		else:
			var col = rainbow_palette[i].to_html(false)
			bbcode += "[color=#%s]%s[/color]" % [col, char]
	
	bbcode += "[/font_size][/center]"
	label.text = bbcode

func update_rainbow_shift(t: float) -> void:
	# Fait défiler les couleurs de l'arc-en-ciel
	var bbcode := "[center][font_size=80]"
	var offset = int(t * rainbow_palette.size())
	
	for i in FULL_TEXT.length():
		var char = FULL_TEXT[i]
		if char == " ":
			bbcode += " "
			continue
		
		var color_index = (i + offset) % rainbow_palette.size()
		var col = rainbow_palette[color_index].to_html(false)
		bbcode += "[color=#%s]%s[/color]" % [col, char]
	
	bbcode += "[/font_size][/center]"
	label.text = bbcode

func fade_to_blue(t: float) -> void:
	var bbcode := "[center][font_size=80]"
	
	for i in FULL_TEXT.length():
		var char = FULL_TEXT[i]
		if char == " ":
			bbcode += " "
			continue
		
		# Interpolation entre la couleur arc-en-ciel et le bleu
		var from_col = rainbow_palette[i]
		var final_col = from_col.lerp(FINAL_BLUE, t)
		bbcode += "[color=#%s]%s[/color]" % [final_col.to_html(false), char]
	
	bbcode += "[/font_size][/center]"
	label.text = bbcode

func play_sound() -> void:
	if sfx and sfx.stream:
		sfx.play()
