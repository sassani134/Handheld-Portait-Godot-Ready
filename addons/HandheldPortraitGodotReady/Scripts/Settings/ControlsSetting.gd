extends Control

"""
All buttons on the scene
"""
# Mobile
@export_category("Mobile")
@export var up_button_mobile: Button
@export var down_button_mobile: Button
@export var right_button_mobile: Button
@export var left_button_mobile: Button
@export var action_right_button_mobile: Button
@export var action_bottom_button_mobile: Button
@export var action_top_button_mobile: Button
@export var action_left_button_mobile: Button
@export var start_button_mobile: Button
@export var select_button_mobile: Button
 
# Keyboard Mouse
@export_category("Mouse Keyboard")
@export var up_button_mk: Button
@export var down_button_mk: Button
@export var right_button_mk: Button
@export var left_button_mk: Button
@export var action_right_button_mk: Button
@export var action_bottom_button_mk: Button
@export var action_top_button_mk: Button
@export var action_left_button_mk: Button
@export var start_button_mk: Button
@export var select_button_mk: Button

# Controler
@export_category("Controller")
@export var up_button_controller: Button
@export var down_button_controller: Button
@export var right_button_controller: Button
@export var left_button_controller: Button
@export var action_right_button_controller: Button
@export var action_bottom_button_controller: Button
@export var action_top_button_controller: Button
@export var action_left_button_controller: Button
@export var start_button_controller: Button
@export var select_button_controller: Button

@export_category("Misc")
@export var reset_button: Button

# Dict[nameOfNode, InputMap Action], 
const ACTIONSALL : Dictionary[String,String]= {
	"mobile_up": "mobile_move_up",
	"mobile_down": "mobile_move_down",
	"mobile_left": "mobile_move_left",
	"mobile_right": "mobile_move_right",
	"mobile_action_top": "mobile_action_top",
	"mobile_action_bottom": "mobile_action_bottom",
	"mobile_action_left": "mobile_action_left",
	"mobile_action_right": "mobile_action_right",
	"mobile_start": "mobile_start",
	"mobile_select": "mobile_select",
	"mk_up": "mk_move_up",
	"mk_down": "mk_move_down",
	"mk_left": "mk_move_left",
	"mk_right": "mk_move_right",
	"mk_action_top": "mk_action_top",
	"mk_action_bottom": "mk_action_bottom",
	"mk_action_left": "mk_action_left",
	"mk_action_right": "mk_action_right",
	"mk_start": "mk_start",
	"mk_select": "mk_select",
	"controller_up": "controller_move_up",
	"controller_down": "controller_move_down",
	"controller_left": "controller_move_left",
	"controller_right": "controller_move_right",
	"controller_action_top": "controller_action_top",
	"controller_action_bottom": "controller_action_bottom",
	"controller_action_left": "controller_action_left",
	"controller_action_right": "controller_action_right",
	"controller_start": "controller_start",
	"controller_select": "controller_select"
}
 
var waiting_for_input: String = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	# _update_button_labels()
	_update_button_icons()
	#connect signal to func
	up_button_mobile.pressed.connect(_on_rebind_button_pressed.bind("mobile_up"))
	down_button_mobile.pressed.connect(_on_rebind_button_pressed.bind("mobile_down"))
	left_button_mobile.pressed.connect(_on_rebind_button_pressed.bind("mobile_left"))
	right_button_mobile.pressed.connect(_on_rebind_button_pressed.bind("mobile_right"))
	action_right_button_mobile.pressed.connect(_on_rebind_button_pressed.bind("mobile_action_top"))
	action_bottom_button_mobile.pressed.connect(_on_rebind_button_pressed.bind("mobile_action_bottom"))
	action_top_button_mobile.pressed.connect(_on_rebind_button_pressed.bind("mobile_action_bottom"))
	action_left_button_mobile.pressed.connect(_on_rebind_button_pressed.bind("mobile_action_left"))
	start_button_mobile.pressed.connect(_on_rebind_button_pressed.bind("mobile_start"))
	select_button_mobile.pressed.connect(_on_rebind_button_pressed.bind("mobile_select"))
	
	# ui ----

	
	###
	up_button_mk.pressed.connect(_on_rebind_button_pressed.bind("mk_up"))
	down_button_mk.pressed.connect(_on_rebind_button_pressed.bind("mk_down"))
	left_button_mk.pressed.connect(_on_rebind_button_pressed.bind("mk_left"))
	right_button_mk.pressed.connect(_on_rebind_button_pressed.bind("mk_right"))
	action_right_button_mk.pressed.connect(_on_rebind_button_pressed.bind("mk_action_right"))
	action_bottom_button_mk.pressed.connect(_on_rebind_button_pressed.bind("mk_action_bottom"))
	action_top_button_mk.pressed.connect(_on_rebind_button_pressed.bind("mk_action_top"))
	action_left_button_mk.pressed.connect(_on_rebind_button_pressed.bind("mk_action_left"))
	start_button_mk.pressed.connect(_on_rebind_button_pressed.bind("mk_start"))
	select_button_mk.pressed.connect(_on_rebind_button_pressed.bind("mk_select"))



	#####
	up_button_controller.pressed.connect(_on_rebind_button_pressed.bind("controller_up"))
	down_button_controller.pressed.connect(_on_rebind_button_pressed.bind("controller_down"))
	left_button_controller.pressed.connect(_on_rebind_button_pressed.bind("controller_left"))
	right_button_controller.pressed.connect(_on_rebind_button_pressed.bind("controller_right"))
	action_right_button_controller.pressed.connect(_on_rebind_button_pressed.bind("controller_action_right"))
	action_bottom_button_controller.pressed.connect(_on_rebind_button_pressed.bind("controller_action_bottom"))
	action_top_button_controller.pressed.connect(_on_rebind_button_pressed.bind("controller_action_top"))
	action_left_button_controller.pressed.connect(_on_rebind_button_pressed.bind("controller_action_left"))
	start_button_controller.pressed.connect(_on_rebind_button_pressed.bind("controller_start"))
	select_button_controller.pressed.connect(_on_rebind_button_pressed.bind("controller_select"))

	####
	
	reset_button.pressed.connect(_on_reset_button_pressed)

# func to get the control button node
func _get_button_all0(direction:String) -> Button:
	match direction:
		"mobile_up": return up_button_mobile
		"mobile_down": return down_button_mobile
		"mobile_right": return right_button_mobile
		"mobile_left": return left_button_mobile

		"mobile_action_right": return action_right_button_mobile
		"mobile_action_bottom": return action_bottom_button_mobile
		"mobile_action_top": return action_top_button_mobile
		"mobile_action_left": return action_left_button_mobile

		"mobile_start": return start_button_mobile
		"mobile_select": return select_button_mobile

		"mk_up": return up_button_mk
		"mk_down": return down_button_mk
		"mk_left": return right_button_mk
		"mk_right": return up_button_mk

		"mk_action_right": return action_right_button_mk
		"mk_action_bottom": return action_bottom_button_mk
		"mk_action_top": return action_top_button_mk
		"mk_action_left": return action_left_button_mk

		"mk_start": return start_button_mk
		"mk_select": return select_button_mk

		"controller_up": return up_button_controller
		"controller_down": return down_button_controller
		"controller_left": return right_button_controller
		"controller_right": return up_button_controller

		"controller_action_right": return action_right_button_controller
		"controller_action_bottom": return action_bottom_button_controller
		"controller_action_top": return action_top_button_controller
		"controller_action_left": return action_left_button_controller

		"controller_start": return start_button_controller
		"controller_select": return select_button_controller
		_: return null

# in update button text gets events from action name
func _update_button_label(direction: String):
	var action_name = ACTIONSALL[direction]
	print(action_name)
	var events = InputMap.action_get_events(action_name)
	print("events:" + str(events))
	# print("ayoclass : " + events[0].get_class()) # InputEventJoypadMotion
	var label_text = "Unassigned"
	
	# from events array get the first events
	
	if events.size() > 0:
		var event = events[0]
		if event is InputEventKey:
			if event.keycode != 0:
				label_text = OS.get_keycode_string(event.keycode) # check the type of event get the keycode
			elif event.physical_keycode != 0:
				label_text = OS.get_keycode_string(event.physical_keycode) # check the type of event get the keycode

		if event is InputEventJoypadMotion:
			#print("IF InputEventJoypadMotion")
			print(event.as_text())
			label_text = event.as_text()
		if event is InputEventJoypadButton:
			print(event.as_text())
			label_text = event.as_text()
		if event is InputEventMouseButton:
			print(event.as_text())
			label_text = event.as_text()
	print(direction)
	var btn = _get_button_all0(direction)
	btn.text = "%s" % [label_text] # set the buttons text w keycode
 
#func to update text for every button
func _update_button_labels():
	for dir in ACTIONSALL.keys():
		# print("dir : "+dir)
		_update_button_label(dir)
 
# in update button icon get svg from action name
# inputToSVG
func _old_update_button_icon(direction: String):
	var action_name = ACTIONSALL[direction] #value
	print(action_name)
	var events = InputMap.action_get_events(action_name)
	# events:[InputEventJoypadMotion: axis=1, axis_value=-1.00]
	# events:[InputEventJoypadButton: button_index=3, pressed=true, pressure=0.00]
	# events:[InputEventKey: keycode=87 (W), mods=none, physical=true, location=unspecified, pressed=false, echo=false]
	# events:[InputEventMouseButton: button_index=2, mods=none, pressed=false, canceled=false, position=((0.0, 0.0)), button_mask=0, double_click=false]
	# JoyAxis.JOY_AXIS_LEFT_X
	# JoyButton.JOY_BUTTON_START
	# controller_move_up="Left Stick Y -"
	# controller_move_down="Left Stick Y +"
	# controller_move_right="Left Stick X -"
	# controller_move_left="Left Stick X +"

	print("events:" + str(events))
	print("events class : " + events[0].get_class())
	var label_text := "Unassigned"
	var icon_text : Texture2D
 
 # to change
	if events.size() > 0:
		var event = events[0]
		if event is InputEventKey: # InputEventJoypadButton
			# FindSvgIcon.key_enum_to_svg()
			#texture_rect.texture = load(FindSvgInput.get_svg_for_joy_button(Input.get_joy_name(0), button)) as Texture2D

			if event.keycode != 0:
				label_text = OS.get_keycode_string(event.keycode)
				# icon_text = FindSvgInput.get_svg_for_key(event.keycode) as Texture2D
			elif event.physical_keycode != 0:
				label_text = OS.get_keycode_string(event.physical_keycode)

		if event is InputEventJoypadMotion:
			# find FindSvgIcon.joy_axis_enum_to_svg(number : int) -> String:
			#print("IF InputEventJoypadMotion")
			print(event.as_text())
			label_text = event.as_text()
			# icon_text = FindSvgInput.get_svg_for_joy_button() as Texture2D
		if event is InputEventJoypadButton:
			print(event.as_text())
			label_text = event.as_text()
			# icon_text = FindSvgInput.get_svg_for_joy_button() as Texture2D
		if event is InputEventMouseButton:
			print(event.as_text())
			label_text = event.as_text()

	print(direction)
	var btn = _get_button_all0(direction)
	btn.text = "%s" % [label_text]
	#btn.icon = load(icon_text) as Texture2D

func _update_button_icon(direction: String) -> void:
	print("_update_button_icon Direction : " + direction)
	var action_name = ACTIONSALL[direction] #value
	print("_update_button_icon Action Name : " + action_name)
	var events = InputMap.action_get_events(action_name)
	# events:[InputEventJoypadMotion: axis=1, axis_value=-1.00] 
	# events:[InputEventJoypadButton: button_index=3, pressed=true, pressure=0.00]
	# events:[InputEventKey: keycode=87 (W), mods=none, physical=true, location=unspecified, pressed=false, echo=false]
	# events:[InputEventMouseButton: button_index=2, mods=none, pressed=false, canceled=false, position=((0.0, 0.0)), button_mask=0, double_click=false]


	# print("events:" + str(events))
	# print("events class : " + events[0].get_class())
	var label_text := "Unassigned"
	var icon_text : Texture2D
	var icon_path : String
 
	if events.size() > 0:
		var event = events[0]
		print("events[0] : " + str(event))
		if events is InputEventKey:
			icon_path = FindSvgInput.get_svg_for_key(event.keycode)
			pass
		elif events is InputEventGesture:
			# icon_path = FindSvgInput
			#ayo for mobile
			pass
		elif events is InputEventMouseButton:
			icon_path = FindSvgInput.get_svg_for_mouse_button(event.button_index)
			pass
		elif events is InputEventMouseMotion:
			# icon_path = FindSvgInput.get_svg
			pass
		elif events is InputEventJoypadButton:
			var joy_button_event := events as InputEventJoypadButton
			var button: JoyButton = joy_button_event.button_index
			icon_path = FindSvgInput.get_svg_for_joy_button(Input.get_joy_name(0), button)
			pass
		elif events is InputEventJoypadMotion:
			var axis: JoyAxis = events.axis
			var value: float = events.axis_value
			icon_path = FindSvgInput.get_svg_for_joy_axis(Input.get_joy_name(0),axis, value)
			pass
	
	print("IconPath : " + icon_path )


	var btn = _get_button_all0(direction)
	btn.text = "%s" % [label_text]
	btn.icon = load(icon_path) as Texture2D

	


func _update_button_icons():
	for dir in ACTIONSALL.keys():
		print(dir)
		_update_button_icon(dir)

# function to rebind & wait for input & store the name of action
func _on_rebind_button_pressed(direction: String):
	waiting_for_input = direction
	var btn = _get_button_all0(direction)
	btn.text = "..."
	# show modal
	set_process_input(true)
 
func _input(event):
	if waiting_for_input == "":
		return
 
	if event is InputEventKey and event.pressed:
		# memoise the action name ??
		var direction = waiting_for_input
		var action_name = ACTIONSALL[direction]
 
		InputMap.action_erase_events(action_name) # erase the previous event 
		InputMap.action_add_event(action_name, event) # add new event to the action name
		
		# add an func modal
		# _update_button_label(direction) # Update the button label 
		_update_button_icon(direction) # Update the button
 
		waiting_for_input = "" # reset the input variable
		set_process_input(false)

func _on_reset_button_pressed():
	# cofirmation are you sure
	# reset to default
	print("reset ")

# create a pop up menu ?????
"""
func get_svg_for_key(key: Key) -> String:
func get_svg_for_joy_button(manette : String, button: JoyButton) -> String:
func get_svg_for_joy_axis(manette : String, axis: JoyAxis, value: float) -> String:
func get_svg_for_mouse_button(button: MouseButton) -> String:
"""

"""
var key: Key = key_event.keycode          # or .physical_keycode
var button: MouseButton = mouse_event.button_index

var button: JoyButton = joy_button_event.button_index
texture_rect.texture = load(FindSvgInput.get_svg_for_joy_button(Input.get_joy_name(0), button)) as Texture2D

var motion := event as InputEventJoypadMotion
var axis: JoyAxis = motion.axis
var value: float = motion.axis_value
texture_rect.texture = load(FindSvgInput.get_svg_for_joy_axis(Input.get_joy_name(0),axis ,value)) as Texture2D


"""
