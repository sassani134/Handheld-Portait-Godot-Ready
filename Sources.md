# Sources

## Links
- (Multiple resolutions)[https://docs.godotengine.org/en/stable/tutorials/rendering/multiple_resolutions.html]
- (Support multiple form factors and screen sizes )[https://developer.android.com/games/engines/godot/godot-formfactor?hl=fr]
- (Making Responsive UI in Godot)[https://www.kodeco.com/45869762-making-responsive-ui-in-godot]
- (Maaack /Godot-Game-Template)[https://github.com/Maaack/Godot-Game-Template]
- (TinyTakinTeller / TakinGodotTemplate)[https://github.com/TinyTakinTeller/TakinGodotTemplate/tree/master]
- (16bitdev)[https://www.youtube.com/@16bitdev/videos]
- https://github.com/sassani134/starterprojectsgodot
- calligraphr.com
- https://kenney.nl
- https://github.com/lukky-nl/Pocket-Godot
- https://github.com/KenneyNL/Godot-SplashScreens/tree/main/Screen
- https://github.com/godotengine/godot-demo-projects/tree/master/misc/joypads
- https://github.com/godotengine/godot-demo-projects/tree/master/misc/os_test
- https://docs.godotengine.org/en/stable/tutorials/ui/index.html
- https://www.reddit.com/r/FigmaDesign/comments/1f6glnm/design_for_1920x1080/?tl=fr
- https://docs.godotengine.org/en/stable/classes/class_margincontainer.html#class-margincontainer
- https://docs.godotengine.org/en/stable/tutorials/ui/bbcode_in_richtextlabel.html
- https://www.gameuidatabase.com/
	- https://www.gameuidatabase.com/index.php?tag=94&plat=2
	- https://www.gameuidatabase.com/index.php?plat=3
- https://www.spriters-resource.com/
- https://www.instagram.com/reel/Da-PdjxOT9R/?igsh=aXB5dXVsdWg3cmJm
- https://fonts.google.com/
- https://sfxr.me/
- https://docs.godotengine.org/en/stable/tutorials/i18n/internationalizing_games.html
- https://docs.godotengine.org/en/stable/tutorials/scripting/change_scenes_manually.html
- [The SMART Way to Manage Scenes in Godot](https://youtu.be/32h8BR0FqdI)
- https://github.com/sassani134/TheOpenSourceBrigade/tree/master
- https://github.com/godotengine/godot/blob/master/core/input/gamecontrollerdb.txt

## recherche google
La résolution idéale pour un Reel Instagram est de 1080 x 1920 pixels, avec un ratio vertical de 9:16
Résolution : 1080 x 1920 px (minimum 720 px).
Fréquence d'images : 30 images par seconde (FPS) minimum, 60 FPS maximum.

La résolution idéale pour TikTok est 1080 x 1920 pixels avec un format vertical 9:16 pour occuper tout l'écran du mobile.
Résolution : 1080p (1080 x 1920 px)Ratio : 9:16 (vertical)

The ideal vertical resolution for short-form mobile videos like YouTube Shorts and Instagram Reels is 1080 x 1920 pixels, featuring a 9:16 aspect ratio. 
Resolution: 1080p width by 1920p height
Aspect Ratio: 9:16

Set the base window width to 720 and window height to 1280.
1080 and window height to 1920

### 720*1280 margin %
Pour une résolution de 720×1280 pixels (portrait),
 les marges en pourcentage courantes pour les zones de sécurité ou l'espacement d'interface s'établissent généralement à 5 % sur les côtés (gauche/droite) 
et à 3 % en haut et en bas.
Latérales (gauche/droite) : 5 % (soit 36 px de chaque côté)Verticales (haut/bas) : 3 % à 5 % (soit environ 38 à 64 px)Zone utile restante : 90 % de largeur et 90 % à 94 % de hauteur pour le contenu principal.Si vous concevez une application ou une vidéo, dites-moi le type de contenu (publicité mobile, Reels/Shorts, UI d'app) pour que je vous donne les dimensions exactes en pixels des zones sûres.Reddit·r/godotMy project resolution is 1280 x 720 and my scenes ... - Reddit21 oct. 2022 — My project resolution is 1280 x 720 and my scenes are 1280x720, and they exactly fill up the viewport in the editor. But when I la...    

### 1080*1920 margin %
For a standard 1080×1920 (9:16 vertical) canvas used on platforms like TikTok and Instagram Reels, 
safe zone margins in percentage are approximately 6.8% to 13% for the top, 19% to 35% for the bottom,
 and 5% to 11% for the sides.

Top: 6.83% (131 px)Bottom: 19.11% (367 px)Sides (Left/Right): 11.11% (120 px)
Instagram Reels Safe MarginsTop: ~14% (250 px)Bottom: ~35% (672 px)Sides (Left/Right): ~6% (65 px)

## calcul
720 / 1080 = 0.66
1080/1920 =  0.5625

| |720|1280|1080|1920|
|---|---|---|---|---|
|3%|21,6 pix | 38,4 pix | 32,4 pix | 57,6 pix |
|5%| 36 pix | 64 pix | 54 pix | 96 pix |
|6.8%| 48,96 | 87,04 pix | 73,44 pix | 130,56 pix |
|13%| 93,6 pix |166,4 pix | 140,4 pix | 249,6 pix |

**Voici le BBCode complet pour ton RichTextLabel dans Godot 4 :**

```bbcode
[center][font_size=80][color=#001a66]Godot Ready[/color][/font_size]

[font_size=110][color=#ff00ff]S[/color][color=#aa00ff]t[/color][color=#00ff44]a[/color][color=#ffdd00]r[/color][color=#00ddff]t[/color][color=#00ddff]e[/color][color=#ffdd00]r[/color][color=#00ff44] [/color][color=#aa00ff]G[/color][color=#ff00ff]B[/color][color=#ff00ff]C[/color][/font_size][/center]
```

### Explications et conseils d’optimisation

**Couleurs utilisées :**
- Bleu foncé (`#001a66`) pour "Godot Ready" — très visible sur fond sombre/clair.
- Ordre exact demandé pour "Starter GBC" :  
  **fuchsia (#ff00ff), violet (#aa00ff), vert (#00ff44), jaune (#ffdd00), bleu clair (#00ddff), bleu clair (#00ddff), jaune, vert, violet, fuchsia.**

**Tailles recommandées pour écran 720×1280 portrait :**
- `Godot Ready` → `font_size=70` à `90`
- `Starter GBC` → `font_size=100` à `130` (plus gros car c’est le mot-clé)

Tu peux ajuster facilement ces valeurs selon tes fonts.

### Comment configurer les fonts

1. Ajoute tes deux fonts (`Font A` et `Font B`) dans le projet.
2. Sur ton **RichTextLabel**, va dans **Theme Overrides > Fonts** :
   - `normal_font` → ta Font A (pour le premier texte)
3. Pour utiliser **deux fonts différentes** dans le même RichTextLabel, utilise le tag `[font]` :

```bbcode
[center][font_size=80][color=#001a66]Godot Ready[/color][/font_size]

[font=res://fonts/ma_font_b.tres][font_size=110]S[color=...]t...[/font_size][/font][/center]
```

**Solution la plus propre :**  
Utilise **deux RichTextLabel** empilés (un par ligne) avec chacun son font dans le thème. C’est plus simple et plus performant.

### Astuces visibilité (mobile portrait 720x1280)

- Active **[center]** pour centrer le titre.
- Ajoute un **Outline** ou **Shadow** sur le RichTextLabel (Theme Overrides > Font Outline Color / Size).
  - Outline size = 4~8
  - Outline color = noir ou blanc selon ton fond
- Ajoute un peu de marge en haut (`margin_top` ou un Container avec padding).
- Teste en mode **Portrait** (`Project Settings > Display > Window > Mode` + résolution test 720x1280).

### Version alternative avec deux RichTextLabel (recommandée)

**RichTextLabel1 (Godot Ready)**
- Font = Font A
- BBCode :
```bbcode
[center][font_size=85][color=#001a66]Godot Ready[/color][/font_size][/center]
```

**RichTextLabel2 (Starter GBC)**
- Font = Font B
- BBCode :
```bbcode
[center][font_size=115][color=#ff00ff]S[/color][color=#aa00ff]t[/color][color=#00ff44]a[/color][color=#ffdd00]r[/color][color=#00ddff]t[/color][color=#00ddff]e[/color][color=#ffdd00]r[/color][color=#00ff44] [/color][color=#aa00ff]G[/color][color=#ff00ff]B[/color][color=#ff00ff]C[/color][/center]
```

Tu veux que je te donne aussi une version avec **outline + shadow** ou un script pour scaler automatiquement selon la résolution ? Dis-moi !

**Parfait ! Voici les versions mises à jour pour Godot 4.**

### Configuration recommandée du RichTextLabel

- **Font** : Charge la police **Ubuntu** (idéalement `Ubuntu-Italic.ttf` ou `Ubuntu-MediumItalic.ttf`).
- Active **BBCode Enabled** = `true`
- Pour l’italique : utilise le tag `[i]` (ou mieux, assigne directement la variante Italic dans le thème si tu as le fichier).

---

### Version 1 : Texte blanc + Outline bleu foncé

```bbcode
[center][font_size=85][color=#ffffff][i]GODOT READY[/i][/color][/font_size]

[font_size=115][color=#ff00ff]S[/color][color=#aa00ff]t[/color][color=#00ff44]a[/color][color=#ffdd00]r[/color][color=#00ddff]t[/color][color=#00ddff]e[/color][color=#ffdd00]r[/color][color=#00ff44] [/color][color=#aa00ff]G[/color][color=#ff00ff]B[/color][color=#ff00ff]C[/color][/font_size][/center]
```

**Theme Overrides à mettre sur le RichTextLabel :**
- `font_outline_color` → `#001a66` (bleu foncé)
- `font_outline_size` → `8` à `12` (selon l’effet désiré)
- `font` → Ubuntu Italic (ou Regular + tag `[i]`)

---

### Version 2 : Bleu foncé + Shadow noir

```bbcode
[center][font_size=85][color=#001a66][i]GODOT READY[/i][/color][/font_size]

[font_size=115][color=#ff00ff]S[/color][color=#aa00ff]t[/color][color=#00ff44]a[/color][color=#ffdd00]r[/color][color=#00ddff]t[/color][color=#00ddff]e[/color][color=#ffdd00]r[/color][color=#00ff44] [/color][color=#aa00ff]G[/color][color=#ff00ff]B[/color][color=#ff00ff]C[/color][/font_size][/center]
```

**Theme Overrides à mettre :**
- `font_color` → `#001a66` (bleu foncé) — ou utilise le tag `[color]` comme ci-dessus
- `font_shadow_color` → `#000000` (noir)
- `shadow_offset_x` → `3`
- `shadow_offset_y` → `4`
- `shadow_outline_size` → `2` (optionnel, pour adoucir l’ombre)

---

### Astuces supplémentaires

- Pour un meilleur rendu italique → charge directement la variante **Ubuntu Italic** dans le thème du RichTextLabel (`normal_font`).
- Si tu utilises le même RichTextLabel pour les deux lignes, le outline/shadow s’appliquera aux deux textes.  
  → **Solution recommandée** : utilise **deux RichTextLabel** séparés (un pour chaque ligne) pour pouvoir ajuster outline/shadow indépendamment.
- Pour un effet encore plus premium, tu peux augmenter un peu le `font_size` de "GODOT READY" (ex: 90-95) car l’italique prend parfois un peu moins de place.

Tu veux que je te donne aussi la version avec **deux RichTextLabel séparés** (code prêt à copier) ou une version avec un léger glow ? Dis-moi ce que tu préfères !



### input

controller_move_up={
"deadzone": 0.2,
"events": [Object(InputEventJoypadMotion,"resource_local_to_scene":false,"resource_name":"","device":-1,"axis":1,"axis_value":-1.0,"script":null)
]
}
controller_move_down={
"deadzone": 0.2,
"events": [Object(InputEventJoypadMotion,"resource_local_to_scene":false,"resource_name":"","device":-1,"axis":1,"axis_value":1.0,"script":null)
]
}
controller_move_right={
"deadzone": 0.2,
"events": [Object(InputEventJoypadMotion,"resource_local_to_scene":false,"resource_name":"","device":-1,"axis":0,"axis_value":1.0,"script":null)
]
}
controller_move_left={
"deadzone": 0.2,
"events": [Object(InputEventJoypadMotion,"resource_local_to_scene":false,"resource_name":"","device":-1,"axis":0,"axis_value":-1.0,"script":null)
]
}
controller_action_right={
"deadzone": 0.2,
"events": [Object(InputEventJoypadButton,"resource_local_to_scene":false,"resource_name":"","device":-1,"button_index":1,"pressure":0.0,"pressed":true,"script":null)
]
}
controller_action_bottom={
"deadzone": 0.2,
"events": [Object(InputEventJoypadButton,"resource_local_to_scene":false,"resource_name":"","device":-1,"button_index":0,"pressure":0.0,"pressed":true,"script":null)
]
}
controller_action_top={
"deadzone": 0.2,
"events": [Object(InputEventJoypadButton,"resource_local_to_scene":false,"resource_name":"","device":-1,"button_index":3,"pressure":0.0,"pressed":true,"script":null)
]
}
controller_action_left={
"deadzone": 0.2,
"events": [Object(InputEventJoypadButton,"resource_local_to_scene":false,"resource_name":"","device":-1,"button_index":2,"pressure":0.0,"pressed":true,"script":null)
]
}
controller_start={
"deadzone": 0.2,
"events": [Object(InputEventJoypadButton,"resource_local_to_scene":false,"resource_name":"","device":-1,"button_index":6,"pressure":0.0,"pressed":true,"script":null)
]
}
controller_select={
"deadzone": 0.2,
"events": [Object(InputEventJoypadButton,"resource_local_to_scene":false,"resource_name":"","device":-1,"button_index":4,"pressure":0.0,"pressed":true,"script":null)
]
}

#### Joypad Axes

joypad Axis 0 - (Left Stick Left, Joystick 0 Left)
joypad Axis 0 + (Left Stick Right, Joystick 0 Right)
joypad Axis 1 - (Left Stick Up, Joystick 0 Up)
joypad Axis 1 + (Left Stick Down, Joystick 0 Down)

joypad Axis 2 - (Right Stick Left, Joystick 0 Left)
joypad Axis 2 + (Right Stick Right, Joystick 0 Right)
joypad Axis 3 - (Right Stick Up, Joystick 0 Up)
joypad Axis 3 + (Right Stick Down, Joystick 0 Down)

joypad Axis 4 - (Joystick 2 Left)
joypad Axis 4 + (Left Trigger, Sony L2, Xbox LT, Joystick 2 Right)
joypad Axis 5 - (Joystick 2 Up)
joypad Axis 5 + (Right Trigger, Sony R2, Xbox RT, Joystick 2 Down)

joypad Axis 6 - (Joystick 3 Left)
joypad Axis 6 + (Joystick 3 Right)
joypad Axis 7 - (Joystick 3 Up)
joypad Axis 7 + (Joystick 3 Down)

joypad Axis 8 - (Joystick 2 Left)
joypad Axis 8 + (Joystick 2 Right)
joypad Axis 9 - (Joystick 2 Up)
joypad Axis 9 + (Joystick 2 Down)

#### Joypad Buttons

Joypad Button 0 (Bottom Action, Sony Cross, Xbox A, Nintendo B)
1 (Right Action, Sony Circle, Xbox B, Nintendo A)
2 (Left Action, Sony Square, Xbox X, Nintendo Y)
3 (Top Action, Sony Triangle, Xbox Y, Nintendo X)
4 (Back, Sony Select, Xbox Back, Nintendo -)
5 (Guide, Sony PS, Xbox Home)
6 (Start, Xbox Menu, Nintendo +)
7 (Left Stick, Sony L3, XboxL/LS)
8 (Right Stick, Sony R3, Xbox R/RS)
9 (Left Shoulder, Sony L1, Xbox LB)
10 (Right Shoulder, Sony R1, XboxRB)
11 (D-pad Up)
12 (D-pad Down)
13 (D-pad Left)
14 (D-pad Right)
15 (Xbox Share, PS5 Microphone, Nintendo Capture)
16 (Xbox Padle 1)
17 (Xbox Padle 2)
18 (Xbox Padle 3)
19(Xbox Padle 4)
20 (PS4/5 Touchpad)
21 ()
...
25 ()
26
...
127

Left Mouse Button
Right Mouse Button
Middle Mouse Button
Mouse wheele right
lef
Mouse Thumb Button 1
2
----
All Devices

controller_move_up={
"deadzone": 0.2,
"events": [Object(InputEventJoypadMotion,"resource_local_to_scene":false,"resource_name":"","device":-1,"axis":1,"axis_value":-1.0,"script":null)
]
}
joypad Axis 1 - (Left Stick Up, Joystick 0 Up)


mobile_up
mobile_move_up
events:[InputEventJoypadMotion: axis=1, axis_value=-1.00]
InputEventJoypadMotion
Joypad Motion on Axis 1 (Left Stick Y-Axis, Joystick 0 Y-Axis) with Value -1.00
mobile_up
mobile_down
mobile_move_down
events:[InputEventJoypadMotion: axis=1, axis_value=1.00]
InputEventJoypadMotion
Joypad Motion on Axis 1 (Left Stick Y-Axis, Joystick 0 Y-Axis) with Value 1.00
mobile_down
mobile_left
mobile_move_left
events:[InputEventJoypadMotion: axis=0, axis_value=-1.00]
InputEventJoypadMotion
Joypad Motion on Axis 0 (Left Stick X-Axis, Joystick 0 X-Axis) with Value -1.00
mobile_left
mobile_right
mobile_move_right
events:[InputEventJoypadMotion: axis=0, axis_value=1.00]
InputEventJoypadMotion
Joypad Motion on Axis 0 (Left Stick X-Axis, Joystick 0 X-Axis) with Value 1.00
mobile_right
mobile_action_top
mobile_action_top
events:[InputEventJoypadButton: button_index=3, pressed=true, pressure=0.00]
InputEventJoypadButton
Joypad Button 3 (Top Action, Sony Triangle, Xbox Y, Nintendo X)
mobile_action_top
mobile_action_bottom
mobile_action_bottom
events:[InputEventJoypadButton: button_index=0, pressed=true, pressure=0.00]
InputEventJoypadButton
Joypad Button 0 (Bottom Action, Sony Cross, Xbox A, Nintendo B)
mobile_action_bottom
mobile_action_left
mobile_action_left
events:[InputEventJoypadButton: button_index=2, pressed=true, pressure=0.00]
InputEventJoypadButton
Joypad Button 2 (Left Action, Sony Square, Xbox X, Nintendo Y)
mobile_action_left
mobile_action_right
mobile_action_right
events:[InputEventJoypadButton: button_index=1, pressed=true, pressure=0.00]
InputEventJoypadButton
Joypad Button 1 (Right Action, Sony Circle, Xbox B, Nintendo A)
mobile_action_right
mobile_start
mobile_start
events:[InputEventJoypadButton: button_index=6, pressed=true, pressure=0.00]
InputEventJoypadButton
Joypad Button 6 (Start, Xbox Menu, Nintendo +)
mobile_start
mobile_select
mobile_select
events:[InputEventJoypadButton: button_index=4, pressed=true, pressure=0.00]
InputEventJoypadButton
Joypad Button 4 (Back, Sony Select, Xbox Back, Nintendo -)
mobile_select
mk_up
mk_move_up
events:[InputEventKey: keycode=87 (W), mods=none, physical=true, location=unspecified, pressed=false, echo=false]
InputEventKey
mk_up
mk_down
mk_move_down
events:[InputEventKey: keycode=83 (S), mods=none, physical=true, location=unspecified, pressed=false, echo=false]
InputEventKey
mk_down
mk_left
mk_move_left
events:[InputEventKey: keycode=65 (A), mods=none, physical=true, location=unspecified, pressed=false, echo=false]
InputEventKey
mk_left
mk_right
mk_move_right
events:[InputEventKey: keycode=68 (D), mods=none, physical=true, location=unspecified, pressed=false, echo=false]
InputEventKey
mk_right
mk_action_top
mk_action_top
events:[InputEventMouseButton: button_index=2, mods=none, pressed=false, canceled=false, position=((0.0, 0.0)), button_mask=0, double_click=false]
InputEventMouseButton
Right Mouse Button
mk_action_top
mk_action_bottom
mk_action_bottom
events:[InputEventMouseButton: button_index=1, mods=none, pressed=false, canceled=false, position=((0.0, 0.0)), button_mask=0, double_click=false]
InputEventMouseButton
Left Mouse Button
mk_action_bottom
mk_action_left
mk_action_left
events:[InputEventMouseButton: button_index=3, mods=none, pressed=false, canceled=false, position=((0.0, 0.0)), button_mask=0, double_click=false]
InputEventMouseButton
Middle Mouse Button
mk_action_left
mk_action_right
mk_action_right
events:[InputEventKey: keycode=32 (Space), mods=none, physical=true, location=unspecified, pressed=false, echo=false]
InputEventKey
mk_action_right
mk_start
mk_start
events:[InputEventKey: keycode=4194309 (Enter), mods=none, physical=true, location=unspecified, pressed=false, echo=false]
InputEventKey
mk_start
mk_select
mk_select
events:[InputEventKey: keycode=4194305 (Escape), mods=none, physical=true, location=unspecified, pressed=false, echo=false]
InputEventKey
mk_select
controller_up
controller_move_up
events:[InputEventJoypadMotion: axis=1, axis_value=-1.00]
InputEventJoypadMotion
Joypad Motion on Axis 1 (Left Stick Y-Axis, Joystick 0 Y-Axis) with Value -1.00
controller_up
controller_down
controller_move_down
events:[InputEventJoypadMotion: axis=1, axis_value=1.00]
InputEventJoypadMotion
Joypad Motion on Axis 1 (Left Stick Y-Axis, Joystick 0 Y-Axis) with Value 1.00
controller_down
controller_left
controller_move_left
events:[InputEventJoypadMotion: axis=0, axis_value=-1.00]
InputEventJoypadMotion
Joypad Motion on Axis 0 (Left Stick X-Axis, Joystick 0 X-Axis) with Value -1.00
controller_left
controller_right
controller_move_right
events:[InputEventJoypadMotion: axis=0, axis_value=1.00]
InputEventJoypadMotion
Joypad Motion on Axis 0 (Left Stick X-Axis, Joystick 0 X-Axis) with Value 1.00
controller_right
controller_action_top
controller_action_top
events:[InputEventJoypadButton: button_index=3, pressed=true, pressure=0.00]
InputEventJoypadButton
Joypad Button 3 (Top Action, Sony Triangle, Xbox Y, Nintendo X)
controller_action_top
controller_action_bottom
controller_action_bottom
events:[InputEventJoypadButton: button_index=0, pressed=true, pressure=0.00]
InputEventJoypadButton
Joypad Button 0 (Bottom Action, Sony Cross, Xbox A, Nintendo B)
controller_action_bottom
controller_action_left
controller_action_left
events:[InputEventJoypadButton: button_index=2, pressed=true, pressure=0.00]
InputEventJoypadButton
Joypad Button 2 (Left Action, Sony Square, Xbox X, Nintendo Y)
controller_action_left
controller_action_right
controller_action_right
events:[InputEventJoypadButton: button_index=1, pressed=true, pressure=0.00]
InputEventJoypadButton
Joypad Button 1 (Right Action, Sony Circle, Xbox B, Nintendo A)
controller_action_right
controller_start
controller_start
events:[InputEventJoypadButton: button_index=6, pressed=true, pressure=0.00]
InputEventJoypadButton
Joypad Button 6 (Start, Xbox Menu, Nintendo +)
controller_start
controller_select
controller_select
events:[InputEventJoypadButton: button_index=4, pressed=true, pressure=0.00]
InputEventJoypadButton
Joypad Button 4 (Back, Sony Select, Xbox Back, Nintendo -)
controller_select
