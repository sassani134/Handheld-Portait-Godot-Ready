extends Control
# controls_group.gd

# choose mouvment and action button Input


# back signal& file path for storing controls data
signal back_requested

const CONTROLS_PATH := "user://controls.cfg"
const AXIS_DEADZONE := 0.65

# set action names & store in dictionary
# action : 
var actions := {
	"Movement": {
		"move_up": "Move Up",
		"move_down": "Move Down",
		"move_left": "Move Left",
		"move_right": "Move Right"
	},
	"Combat": {
		"attack": "Attack",
		"heavy_attack": "Heavy Attack",
		"dash": "Dash",
		"interact": "Interact"
	},
	"Other": {
		"inventory": "Inventory",
		"character": "Character",
		"map": "Map"
	}
}

# Set export variable to store actions description & reset button
@export var action_rows: VBoxContainer
@export var description: Label
@export var reset_button: Button 
@export var back_button: Button # no need ??

# set variables for storing default inputs, listening modifier events axis & flags
var defaults: Dictionary = {}
var binding_buttons: Dictionary = {}
var listening := false
var listening_action := ""
var listening_type := ""
var listening_button: Button = null
var capture_axis_event := false
var axis_candidate: InputEventJoypadMotion
var input_was_pressed := false
var active_modifiers: Dictionary = {}
var modifier_event: InputEventKey = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	description.text = "Select a binding to change it."

	reset_button.pressed.connect(_on_reset)
	#back_button.pressed.connect(_on_back)

	_capture_defaults()
	_load_bindings()
	_build_ui()

# function to split events into keyboard & controller
func _split_events( events: Array[InputEvent] ) -> Dictionary:
	var result := {
		"keyboard": [],
		"controller": []
	}

# separate the events in 2 diff array & return the result
	for event in events:
		if event is InputEventKey \
		or event is InputEventMouseButton:
			result.keyboard.append(event.duplicate())

		elif event is InputEventJoypadButton \
		or event is InputEventJoypadMotion:
			result.controller.append(event.duplicate())

	return result

# get default bindings & store it in defaults array
func _capture_defaults() -> void:
	defaults.clear()

	for category in actions:
		for action in actions[category]:
			if InputMap.has_action(action):
				defaults[action] = \
					_split_events(
						InputMap.action_get_events(action)
					)

# add a label for showing category name
func _add_category(category: String) -> void:
	var label := Label.new()
	label.text = category.to_upper()
	label.add_theme_font_size_override("font_size", 12)
	label.add_theme_color_override(
		"font_color",
		Color("#B94A54")
	)
	action_rows.add_child(label)

func _make_binding_button() -> Button:
	var button := Button.new()
	button.custom_minimum_size = Vector2(0, 12)
	button.add_theme_font_size_override("font_size", 8)

	var normal := StyleBoxFlat.new()
	normal.bg_color = Color("#19131B")
	normal.border_color = Color("#5A3A43")
	normal.set_border_width_all(1)
	normal.set_corner_radius_all(3)

	var hover := StyleBoxFlat.new()
	hover.bg_color = Color("#3B1923")
	hover.border_color = Color("#C04450")
	hover.set_border_width_all(1)
	hover.set_corner_radius_all(3)

	button.add_theme_stylebox_override("normal", normal)
	button.add_theme_stylebox_override("hover", hover)
	button.add_theme_stylebox_override("focus", hover)

	button.add_theme_color_override(
		"font_color",
		Color("#E1D4D4")
	)

	return button

# func to convert input event into displayable name
func _keyboard_name(event: InputEvent) -> String:
	if event is InputEventKey:
		var key_name := OS.get_keycode_string(
			event.physical_keycode \
			if event.physical_keycode != 0 \
			else event.keycode
		)

		# handle modifier names
		var modifiers := ""

		if event.ctrl_pressed:
			modifiers += "Ctrl + "
		if event.alt_pressed:
			modifiers += "Alt + "
		if event.shift_pressed:
			modifiers += "Shift + "
		if event.meta_pressed:
			modifiers += "Meta + "

		return modifiers + key_name

	# put mouse event name in keyboard too
	if event is InputEventMouseButton:
		match event.button_index:
			MOUSE_BUTTON_LEFT:
				return "LMB"
			MOUSE_BUTTON_RIGHT:
				return "RMB"
			MOUSE_BUTTON_MIDDLE:
				return "MMB"
			MOUSE_BUTTON_WHEEL_UP:
				return "Wheel Up"
			MOUSE_BUTTON_WHEEL_DOWN:
				return "Wheel Down"

	return "Unassigned"

# function to convert controller input events into displayable name PS/XBOX
func _controller_name(event: InputEvent) -> String:
	if event is InputEventJoypadButton:
		match event.button_index:
			JOY_BUTTON_A:
				return "A"
			JOY_BUTTON_B:
				return "B"
			JOY_BUTTON_X:
				return "X"
			JOY_BUTTON_Y:
				return "Y"

			JOY_BUTTON_LEFT_SHOULDER:
				return "L1"
			JOY_BUTTON_RIGHT_SHOULDER:
				return "R1"

			JOY_BUTTON_LEFT_STICK:
				return "L3"
			JOY_BUTTON_RIGHT_STICK:
				return "R3"

			JOY_BUTTON_BACK:
				return "View"
			JOY_BUTTON_START:
				return "Menu"

			JOY_BUTTON_DPAD_UP:
				return "D-Pad Up"
			JOY_BUTTON_DPAD_DOWN:
				return "D-Pad Down"
			JOY_BUTTON_DPAD_LEFT:
				return "D-Pad Left"
			JOY_BUTTON_DPAD_RIGHT:
				return "D-Pad Right"

			_:
				return "Button %d" % event.button_index

	# Stick naming
	if event is InputEventJoypadMotion:
		var directional_sign := "+" if event.axis_value > 0 else "-"

		match event.axis:
			JOY_AXIS_LEFT_X:
				return "LS Right" if directional_sign == "+" else "LS Left"

			JOY_AXIS_LEFT_Y:
				return "LS Down" if directional_sign == "+" else "LS Up"

			JOY_AXIS_RIGHT_X:
				return "RS Right" if directional_sign == "+" else "RS Left"

			JOY_AXIS_RIGHT_Y:
				return "RS Down" if directional_sign == "+" else "RS Up"

			JOY_AXIS_TRIGGER_LEFT:
				return "L2"

			JOY_AXIS_TRIGGER_RIGHT:
				return "R2"

			_:
				return "Axis %d %s" % [event.axis, directional_sign]

	return "Unassigned"

# set event name
func _event_name( events: Array, input_type: String ) -> String:
	if events.is_empty():
		return "Unassigned"

	if input_type == "keyboard":
		return _keyboard_name(events[0])

	return _controller_name(events[0])

func _refresh_action(action: String) -> void:
	if not binding_buttons.has(action):
		return

	var buttons: Dictionary = binding_buttons[action]
	var split := _split_events(
		InputMap.action_get_events(action)
	)

	buttons.keyboard.text = _event_name(split.keyboard, "keyboard")
	buttons.controller.text = _event_name(split.controller, "controller")

# func to notify player while remapping an action
func _begin_capture( action: String, input_type: String, button: Button ) -> void:
	if listening:
		return

	listening = true
	listening_action = action
	listening_type = input_type
	listening_button = button

	input_was_pressed = false
	capture_axis_event = false
	axis_candidate = null

	if input_type == "keyboard":
		button.text = "Press a key..."
		description.text = "Press a key or mouse button. Escape cancels."
	else:
		button.text = "Press controller..."
		description.text = "Press a controller button or move an axis. Escape cancels."

#func to add action row HBox 1st element will be Label for action name
func _add_action_row( action: String, display_name: String ) -> void:
	var row := HBoxContainer.new()
	row.custom_minimum_size = Vector2(0, 16)
	row.add_theme_constant_override("separation", 12)

	var name_label := Label.new()
	name_label.text = display_name
	name_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	name_label.size_flags_stretch_ratio = 1.0
	name_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	name_label.add_theme_color_override(
		"font_color",
		Color("#D4C8C5")
	)

	row.add_child(name_label)

	# make Keyboard/mouse binding button
	var keyboard_button := _make_binding_button()
	keyboard_button.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	keyboard_button.size_flags_stretch_ratio = 1.0

	var controller_button := _make_binding_button()
	controller_button.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	controller_button.size_flags_stretch_ratio = 1.0

	# make controller binding button & add both to action row
	row.add_child(keyboard_button)
	row.add_child(controller_button)

	# Store binding buttons & connect keyboards pressed signal to _begin_capture
	binding_buttons[action] = {
		"keyboard": keyboard_button,
		"controller": controller_button
	}

	keyboard_button.pressed.connect(
		_begin_capture.bind(
			action,
			"keyboard",
			keyboard_button
		)
	)

	controller_button.pressed.connect(
		_begin_capture.bind(
			action,
			"controller",
			controller_button
		)
	)

	action_rows.add_child(row)
	_refresh_action(action)

# func to handle modifier when holding modifier key ctrl alt shift
func _handle_modifier_press(event: InputEventKey) -> void:
	active_modifiers[event.keycode] = true
	modifier_event = InputEventKey.new()

	modifier_event.keycode = event.keycode
	modifier_event.physical_keycode = event.physical_keycode

	modifier_event.shift_pressed = event.shift_pressed
	modifier_event.ctrl_pressed = event.ctrl_pressed
	modifier_event.alt_pressed = event.alt_pressed
	modifier_event.meta_pressed = event.meta_pressed

func _is_modifier_key(key: Key) -> bool:
	return key in [
		KEY_SHIFT,
		KEY_CTRL,
		KEY_ALT,
		KEY_META
	]

# func to check if the event is keyboard or controller
func _belongs_to_type( event: InputEvent, input_type: String ) -> bool:
	if input_type == "keyboard":
		return event is InputEventKey \
			or event is InputEventMouseButton

	return event is InputEventJoypadButton \
		or event is InputEventJoypadMotion

# check if 2 events matches or not
func _events_match( a: InputEvent, b: InputEvent ) -> bool:
	if a is InputEventKey and b is InputEventKey:
		var same_key := false

		if (
			a.physical_keycode != 0
			and b.physical_keycode != 0
		):
			same_key = (
				a.physical_keycode == b.physical_keycode
			)

		elif a.keycode != 0 and b.keycode != 0:
			same_key = a.keycode == b.keycode

		else:
			same_key = (
				a.physical_keycode != 0
				and a.physical_keycode == b.keycode
			) or (
				b.physical_keycode != 0
				and b.physical_keycode == a.keycode
			)

		return (
			same_key
			and a.shift_pressed == b.shift_pressed
			and a.ctrl_pressed == b.ctrl_pressed
			and a.alt_pressed == b.alt_pressed
			and a.meta_pressed == b.meta_pressed
		)

	if a is InputEventMouseButton and b is InputEventMouseButton:
		return (
			a.button_index == b.button_index
			and a.shift_pressed == b.shift_pressed
			and a.ctrl_pressed == b.ctrl_pressed
			and a.alt_pressed == b.alt_pressed
			and a.meta_pressed == b.meta_pressed
		)

	if a is InputEventJoypadButton and b is InputEventJoypadButton:
		return a.button_index == b.button_index

	if a is InputEventJoypadMotion and b is InputEventJoypadMotion:
		return (
			a.axis == b.axis
			and signf(a.axis_value) == signf(b.axis_value)
		)

	return false

# func to finish capture w/ reset all the listening vars
func _finish_capture() -> void:
	listening = false
	listening_action = ""
	listening_type = ""
	listening_button = null

func _cancel_capture() -> void:
	if listening_button:
		_refresh_action(listening_action)

	_finish_capture()

	description.text = \
        "Select a binding to change it."

func _has_conflict( action: String, new_event: InputEvent, input_type: String ) -> bool:
	for category in actions:
		for other_action in actions[category]:
			if other_action == action:
				continue

			if not InputMap.has_action(other_action):
				continue

			for old_event in InputMap.action_get_events(other_action ):
				if not _belongs_to_type(old_event, input_type):
					continue

				if _events_match(old_event, new_event):
					return true

	return false

func _serialize_event(event: InputEvent) -> Dictionary:
	if event is InputEventKey:
		return {
			"type": "key",
			"keycode": event.keycode,
			"physical": event.physical_keycode,
			"shift": event.shift_pressed,
			"ctrl": event.ctrl_pressed,
			"alt": event.alt_pressed,
			"meta": event.meta_pressed
		}

	if event is InputEventMouseButton:
		return {
			"type": "mouse",
			"button": event.button_index
		}

	if event is InputEventJoypadButton:
		return {
			"type": "joy_button",
			"button": event.button_index
		}

	if event is InputEventJoypadMotion:
		return {
			"type": "joy_axis",
			"axis": event.axis,
			"value": event.axis_value
		}

	return {}

func _deserialize_event(data: Dictionary) -> InputEvent:
	match data.get("type", ""):
		"key":
			var event := InputEventKey.new()
			event.keycode = int(data.get("keycode", 0)) as Key
			event.physical_keycode = int(data.get("physical", 0)) as Key
			event.shift_pressed = data.get("shift", false)
			event.ctrl_pressed = data.get("ctrl", false)
			event.alt_pressed = data.get("alt", false)
			event.meta_pressed = data.get("meta", false)
			return event

		"mouse":
			var event := InputEventMouseButton.new()
			event.button_index = int(data.get("button", 0)) as MouseButton
			return event

		"joy_button":
			var event := InputEventJoypadButton.new()
			event.button_index = int(data.get("button", 0)) as JoyButton
			event.device = -1
			return event

		"joy_axis":
			var event := InputEventJoypadMotion.new()
			event.axis = int(data.get("axis", 0)) as JoyAxis
			event.axis_value = float(data.get("value", 0.0))
			event.device = -1
			return event

	return null

# save  serialized data to config file
func _save_bindings() -> void:
	var config := ConfigFile.new()

	for category in actions:
		for action in actions[category]:
			if not InputMap.has_action(action):
				continue

			var serialized: Array[Dictionary] = []

			for event in InputMap.action_get_events(action):
				var data := _serialize_event(event)

				if not data.is_empty():
					serialized.append(data)

			config.set_value("controls", action, serialized)

	var error := config.save(CONTROLS_PATH)

	if error != OK:
		push_warning("Could not save controls.")

func _load_bindings() -> void:
	var config := ConfigFile.new()

	if config.load(CONTROLS_PATH) != OK:
		return

	for category in actions:
		for action in actions[category]:
			if not InputMap.has_action(action):
				continue

			if not config.has_section_key("controls", action):
				continue

			var data: Array = config.get_value(
				"controls",
				action,
				[]
			)

			InputMap.action_erase_events(action)

			for entry in data:
				var event := _deserialize_event(entry)

				if event:
					InputMap.action_add_event(
						action,
						event
					)

func _apply_binding( new_event: InputEvent, input_type: String ) -> void:
	if _has_conflict( listening_action, new_event, input_type ):
		description.text = "This input is already assigned."
		return

	var action := listening_action
	var events := InputMap.action_get_events(action)

	for old_event in events:
		if _belongs_to_type(old_event, input_type):
			InputMap.action_erase_event(
				action,
				old_event
			)

	InputMap.action_add_event(action, new_event)

	_finish_capture()
	_refresh_action(action)
	_save_bindings()

	description.text = "Binding updated."

func _handle_modifier_release(event: InputEventKey) -> void:
	active_modifiers.erase(event.keycode)

	if not active_modifiers.is_empty():
		return

	if modifier_event != null:
		_apply_binding(modifier_event, "keyboard")

	modifier_event = null

func _capture_keyboard(event: InputEvent) -> void:
	if event is InputEventKey:
		if not event.pressed:
			if _is_modifier_key(event.keycode):
				_handle_modifier_release(event)

			return

		if event.echo:
			return

		if event.keycode == KEY_ESCAPE:
			active_modifiers.clear()
			modifier_event = null

			_cancel_capture()

			get_viewport().set_input_as_handled()
			return

		if _is_modifier_key(event.keycode):
			_handle_modifier_press(event)

			get_viewport().set_input_as_handled()
			return

		modifier_event = null

		var key := InputEventKey.new()

		key.keycode = event.keycode
		key.physical_keycode = event.physical_keycode

		key.shift_pressed = event.shift_pressed
		key.ctrl_pressed = event.ctrl_pressed
		key.alt_pressed = event.alt_pressed
		key.meta_pressed = event.meta_pressed

		_apply_binding(key, "keyboard")
		active_modifiers.clear()
		get_viewport().set_input_as_handled()
		
		return

	if event is InputEventMouseButton:

		if not event.pressed:
			return

		var mouse := InputEventMouseButton.new()
		mouse.button_index = event.button_index
		mouse.shift_pressed = event.shift_pressed
		mouse.ctrl_pressed = event.ctrl_pressed
		mouse.alt_pressed = event.alt_pressed
		mouse.meta_pressed = event.meta_pressed

		_apply_binding(mouse, "keyboard")
		get_viewport().set_input_as_handled()

func _capture_controller(event: InputEvent) -> void:
	var new_event: InputEvent = null
	if event is InputEventJoypadButton:

		if not event.pressed:
			return

		var button := InputEventJoypadButton.new()
		button.button_index = event.button_index
		button.device = -1

		new_event = button

	elif event is InputEventJoypadMotion:

		if absf(event.axis_value) < AXIS_DEADZONE:
			return

		var motion := InputEventJoypadMotion.new()
		motion.axis = event.axis
		motion.axis_value = signf(event.axis_value)
		motion.device = -1

		new_event = motion

	else:
		return

	if new_event == null:
		return

	_apply_binding( new_event, "controller" )
	get_viewport().set_input_as_handled()

func _input(event: InputEvent) -> void:
	if not listening:
		return

	if event is InputEventKey and event.pressed \
	and not event.echo and event.keycode == KEY_ESCAPE:
		_cancel_capture()
		get_viewport().set_input_as_handled()
		return

	if listening_type == "keyboard":
		_capture_keyboard(event)
	else:
		_capture_controller(event)

func _build_ui() -> void:
	for child in action_rows.get_children():
		child.queue_free()

	binding_buttons.clear()

	for category in actions:
		_add_category(category)

		for action in actions[category]:
			if not InputMap.has_action(action):
				continue

			_add_action_row( action, actions[category][action] )

func _on_reset() -> void:
	if listening:
		_cancel_capture()

	for action in defaults:
		if not InputMap.has_action(action):
			continue

		InputMap.action_erase_events(action)

		for event in defaults[action].keyboard:
			InputMap.action_add_event(
				action,
				event.duplicate()
			)

		for event in defaults[action].controller:
			InputMap.action_add_event(
				action,
				event.duplicate()
			)

	_save_bindings()
	_build_ui()

	description.text = \
        "Controls reset to the defaults."

func _on_back() -> void: # no need
	if listening:
		_cancel_capture()

	back_requested.emit()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
