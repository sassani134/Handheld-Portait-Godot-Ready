extends Node
# Controller Manager Autoload

signal ayo

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Input.joy_connection_changed.connect(_on_joy_connection_changed)

	# for joypad in Input.get_connected_joypads():
	# 	print_rich("Found joypad #%d: [b]%s[/b] - %s" % [joypad, Input.get_joy_name(joypad), Input.get_joy_guid(joypad)])

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# # Get the joypad device number from the spinbox.
	# joy_num = int(joypad_number.value)

	# # Display the name of the joypad if we haven't already.
	# if joy_num != cur_joy:
	# 	cur_joy = joy_num
	# 	if Input.get_joy_name(joy_num) != "":
	# 		set_joypad_name(Input.get_joy_name(joy_num), Input.get_joy_guid(joy_num))
	# 	else:
	# 		clear_joypad_name()
	pass # Replace with function body.


func _on_joy_connection_changed() -> void:
	pass
