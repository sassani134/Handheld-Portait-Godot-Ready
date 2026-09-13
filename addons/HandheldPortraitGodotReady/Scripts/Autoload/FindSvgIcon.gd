extends Node

const PATHSVG := "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Default/"
const PATHKEYBOARD := "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/"
const PATHSWITCH := "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Nintendo Switch/Vector/"
const PATHPS := "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/PlayStation Series/Vector/"
const PATHGENERIC := "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Generic/Vector/"

const KEYBOARD := "keyboard_"
const MOUSE := "mouse_"
const SWITCH := "switch_"
#const SWITCH2 := "switch2_"
const GAMECUBE := "gamecube_"
const PS3 := "playstation3_"
const PS4 := "playstation4_"
const PS5 := "playstation5_"
const GENERIC := "generic_"
const CONTROLLER := "controller_"


##### ------
# playstation4_button_options
# playstation+x+"_button_select.svg
# playstation+x+"_button_+y+.svg
# playstation_stick_+x+y

##### ------
# keyboard_d.svg
# "keyboard_"+x+".svg"
##### ------
# mouse_right.svg
# mouse_right.svg
# "mouse_"+x+".svg"
# mouse_scroll.svg
##### ------
# switch_buttons_left.svg
# switch_buttons_+x+.svg
# switch_stick_l_down.svg
# switch_stick_+x+_+y+.svg
# switch_button_zr


# @globalScope
# Enum JoyAxis
# JoyButton
# MouseButton
#Key

#from joyMapping
const BASE = {
	# Buttons
	"a": JOY_BUTTON_A,
	"b": JOY_BUTTON_B,
	"y": JOY_BUTTON_Y,
	"x": JOY_BUTTON_X,
	"start": JOY_BUTTON_START,
	"back": JOY_BUTTON_BACK,
	"leftstick": JOY_BUTTON_LEFT_STICK,
	"rightstick": JOY_BUTTON_RIGHT_STICK,
	"leftshoulder": JOY_BUTTON_LEFT_SHOULDER,
	"rightshoulder": JOY_BUTTON_RIGHT_SHOULDER,
	"dpup": JOY_BUTTON_DPAD_UP,
	"dpleft": JOY_BUTTON_DPAD_LEFT,
	"dpdown": JOY_BUTTON_DPAD_DOWN,
	"dpright": JOY_BUTTON_DPAD_RIGHT,

	# Axis
	"leftx": JOY_AXIS_LEFT_X,
	"lefty": JOY_AXIS_LEFT_Y,
	"rightx": JOY_AXIS_RIGHT_X,
	"righty": JOY_AXIS_RIGHT_Y,
	"lefttrigger": JOY_AXIS_TRIGGER_LEFT,
	"righttrigger": JOY_AXIS_TRIGGER_RIGHT,
}

func name_to_svg(name: String) -> String:
	var svg_var: String
	match name:
		"Joypad Motion on Axis 1 (Left Stick Y-Axis, Joystick 0 Y-Axis) with Value -1.00": PATHSVG+""
		_: return "no"
	return PATHSVG

# https://docs.godotengine.org/en/stable/classes/class_%40globalscope.html#enum-globalscope-joybutton
#The maximum number of game controller buttons supported by the engine. The actual limit may be lower on specific platforms:
#
	#Android: Up to 36 buttons.
#
	#Linux: Up to 80 buttons.
#
	#Windows and macOS: Up to 128 buttons.
#manette switch ps4 ps5 xbox series steam
func joy_button_enum_to_svg(number : int, console : String ) -> String:
	var svg_var: String
	match name:
		-1: svg_var = PATHPS+"playstation_button_cross.svg"
		0: svg_var = PATHPS+"playstation_button_cross.svg"
		1: svg_var = PATHPS+"playstation_button_circle.svg"
		2: svg_var = PATHPS+"playstation_button_square.svg"
		3: svg_var = PATHPS+"playstation_button_triangle.svg"
		4: svg_var = PATHPS+"playstation4_button_select.svg"
		#5: svg_var = PATHPS+"playstation_button_cross.svg"# guide / Sony PS
		6: svg_var = PATHPS+"playstation4_button_option.svg"
		7: svg_var = PATHPS+"playstation_stick_l_press.svg"
		8: svg_var = PATHPS+"playstation_stick_r_press.svg"
		9: svg_var = PATHPS+"playstation_trigger_l1.svg"
		10: svg_var = PATHPS+"playstation_trigger_r1.svg"
		11: svg_var = PATHPS+"playstation_dpad_up.svg"
		12: svg_var = PATHPS+"playstation_dpad_down.svg"
		13: svg_var = PATHPS+"playstation_dpad_left.svg"
		14: svg_var = PATHPS+"playstation_dpad_right.svg"
		#15: svg_var = PATHPS+"playstation_button_cross.svg" #Game controller SDL miscellaneous button. Corresponds to Xbox share button, PS5 microphone button, Nintendo Switch capture button.
		#16: svg_var = PATHPS+"playstation_button_cross.svg" # Game controller SDL paddle 1 button.
		#17: svg_var = PATHPS+"playstation_button_cross.svg" # Game controller SDL paddle 2 button.
		#18: svg_var = PATHPS+"playstation_button_cross.svg" # Game controller SDL paddle 3 button.
		#19: svg_var = PATHPS+"playstation_button_cross.svg" # Game controller SDL paddle 4 button.
		20: svg_var = PATHPS+"playstation4_touchpad_press.svg" # SDL touchpad button.
		_: return "no"
	return svg_var
# 22 to 26 and 128

# https://docs.godotengine.org/en/stable/classes/class_%40globalscope.html#enum-globalscope-joyaxis
func joy_axis_enum_to_svg(number : int) -> String:
	var svg_var: String
	match name:
		0: svg_var = PATHPS+"playstation_stick_l_left.svg"
		1: svg_var = PATHPS+"playstation_stick_l_left.svg"
		2: svg_var = PATHPS+"playstation_stick_r_left.svg"
		3: svg_var = PATHPS+"playstation_stick_r_left.svg"
		4: svg_var = PATHPS+".svg"
		5: svg_var = PATHPS+".svg"
		6: svg_var = PATHPS+".svg"
		_: return "no"
	return svg_var

# https://docs.godotengine.org/en/stable/classes/class_%40globalscope.html#enum-globalscope-key
func key_enum_to_svg(number : int) -> String:
	var svg_var: String
	match number:
		#0: svg_var = #None
		#1: svg_var = 
		#2: svg_var = 
		#3: svg_var = 
		#4: svg_var = 
		#5: svg_var = 
		#6: svg_var = 
		#7: svg_var = 
		#8: svg_var = 
		#9: svg_var = 
		#10: svg_var = 
		#11: svg_var = 
		#12: svg_var = 
		#13: svg_var = 
		#14: svg_var = 
		#15: svg_var = 
		#16: svg_var = 
		#17: svg_var = 
		#18: svg_var = 
		#19: svg_var = 
		#20: svg_var = 
		#21: svg_var = 
		#22: svg_var = 
		#23: svg_var = 
		#24: svg_var = 
		#25: svg_var = 
		#26: svg_var = 
		#27: svg_var = 
		#28: svg_var = 
		#29: svg_var = 
		#30: svg_var = 
		#31: svg_var = 
		32: svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_space.svg"
		33: svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_exclamation.svg"
		34: svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_quote.svg"
		#35: svg_var = ## hash or umber sign
		#36: svg_var = # dollar
		#37: svg_var = # percent
		#38: svg_var = #ampersand
		39: svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_apostrophe.svg"
		#40: svg_var = # parentleft
		#41: svg_var =  # parentRight
		42: svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_asterisk.svg"
		43: svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_plus.svg"
		44: svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_comma.svg"
		45: svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_minus.svg"
		46: svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_period.svg"
		47: svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_slash_forward.svg"
		48: svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_0.svg"
		49: svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_1.svg"
		50: svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_2.svg"
		51: svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_3.svg"
		52: svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_4.svg"
		53: svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_5.svg"
		54: svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_6.svg"
		55: svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_7.svg"
		56: svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_8.svg"
		57: svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_9.svg"
		58: svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_colon.svg"
		59: svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_semicolon.svg"
		60: svg_var ="res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_bracket_less.svg" # less <
		61: svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_equals.svg"
		62: svg_var ="res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_bracket_greater.svg" # greater >
		63: svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_question.svg"
		#64: svg_var = #@
		65: svg_var = PATHKEYBOARD+"keyboard_a.svg"
		66: svg_var = PATHKEYBOARD+"keyboard_b.svg"
		67: svg_var = PATHKEYBOARD+"keyboard_c.svg"
		68: svg_var = PATHKEYBOARD+"keyboard_d.svg"
		69: svg_var = PATHKEYBOARD+"keyboard_e.svg"
		70: svg_var = PATHKEYBOARD+"keyboard_f.svg"
		71: svg_var = PATHKEYBOARD+"keyboard_g.svg"
		72: svg_var = PATHKEYBOARD+"keyboard_h.svg"
		73: svg_var = PATHKEYBOARD+"keyboard_i.svg"
		74: svg_var = PATHKEYBOARD+"keyboard_j.svg"
		75: svg_var = PATHKEYBOARD+"keyboard_k.svg"
		76: svg_var = PATHKEYBOARD+"keyboard_l.svg"
		77: svg_var = PATHKEYBOARD+"keyboard_m.svg"
		78: svg_var = PATHKEYBOARD+"keyboard_n.svg"
		79: svg_var = PATHKEYBOARD+"keyboard_o.svg"
		80: svg_var = PATHKEYBOARD+"keyboard_p.svg"
		81: svg_var = PATHKEYBOARD+"keyboard_q.svg"
		82: svg_var = PATHKEYBOARD+"keyboard_r.svg"
		83: svg_var = PATHKEYBOARD+"keyboard_s.svg"
		84: svg_var = PATHKEYBOARD+"keyboard_t.svg"
		85: svg_var = PATHKEYBOARD+"keyboard_u.svg"
		86: svg_var = PATHKEYBOARD+"keyboard_v.svg"
		87: svg_var = PATHKEYBOARD+"keyboard_w.svg"
		88: svg_var = PATHKEYBOARD+"keyboard_x.svg"
		89: svg_var = PATHKEYBOARD+"keyboard_y.svg"
		90: svg_var = PATHKEYBOARD+"keyboard_z.svg"
		91: svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_bracket_open.svg"
		92: svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_slash_back.svg"
		93: svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_caret.svg"
		94: svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_underscore.svg"
		95: svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_underscore.svg"  # KEY_QUOTELEFT `
		#96: svg_var =  # KEY_QUOTELEFT `
		#97: svg_var = # nothing start
		#98: svg_var = 
		#99: svg_var = 
		#100: svg_var = 
		#101: svg_var = 
		#102: svg_var = 
		#103: svg_var = 
		#104: svg_var = 
		#105: svg_var = 
		#106: svg_var = 
		#107: svg_var = 
		#108: svg_var = 
		#109: svg_var = 
		#110: svg_var = 
		#111: svg_var = 
		#112: svg_var = 
		#113: svg_var = 
		#114: svg_var = 
		#115: svg_var = 
		#116: svg_var = 
		#117: svg_var = 
		#118: svg_var = 
		#119: svg_var = 
		#120: svg_var = 
		#121: svg_var = 
		#122: svg_var = # end nothing
		#123: svg_var = # {
		#124: svg_var = # |
		#125: svg_var = # }
		126: svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_tilde.svg"
		#127: svg_var = # nothing
		#128: svg_var = 
		#129: svg_var = 
		#130: svg_var = 
		#131: svg_var = 
		#132: svg_var = 
		#133: svg_var = 
		#134: svg_var = 
		#135: svg_var = 
		#136: svg_var = 
		#137: svg_var = 
		#138: svg_var = 
		#139: svg_var = 
		#140: svg_var = 
		#141: svg_var = 
		#142: svg_var = 
		#143: svg_var = 
		#144: svg_var = 
		#145: svg_var = 
		#146: svg_var = 
		#147: svg_var = 
		#148: svg_var = 
		#149: svg_var = 
		#150: svg_var = 
		#151: svg_var = 
		#152: svg_var = 
		#153: svg_var = 
		#154: svg_var = 
		#155: svg_var = 
		#156: svg_var = 
		#157: svg_var = 
		#158: svg_var = 
		#159: svg_var = 
		#160: svg_var = 
		#161: svg_var = 
		#162: svg_var = 
		#163: svg_var = 
		#164: svg_var = # end nothing
		#165: svg_var = # yen (¥)
		#166: svg_var =  #nothing
		#167: svg_var = # §
		#"arrow_left": svg_var = 
		#"arrow_right": svg_var = 
		#"arrow_up": svg_var = 
		#"arrow_down": svg_var = 
		4194304: svg_var = "" # special
		4194305 : svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_escape.svg"
		4194306 : svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_tab.svg"
		4194307 : svg_var = PATHKEYBOARD+"" #backtab
		4194308 : svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_backspace.svg"
		4194309 : svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_enter.svg"
		4194310 : svg_var = PATHKEYBOARD+"" #kp enter
		4194311 : svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_insert.svg"
		4194312 : svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_delete.svg"
		4194313 : svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_pause.svg"
		4194314 : svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_printscreen.svg"
		4194315 : svg_var = PATHKEYBOARD+"" #sysreq
		4194316 : svg_var = PATHKEYBOARD+"" #clear
		4194317 : svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_home.svg"
		4194318 : svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_end.svg"
		4194319 : svg_var = PATHKEYBOARD+"keyboard_arrow_left.svg"
		4194320 : svg_var = PATHKEYBOARD+"keyboard_arrow_up.svg"
		4194321 : svg_var = PATHKEYBOARD+"keyboard_arrow_right.svg"
		4194322 : svg_var = PATHKEYBOARD+"keyboard_arrow_down.svg"
		4194323 : svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_page_up.svg"
		4194324 : svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_page_down.svg"
		4194325 : svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_shift.svg"
		4194326: svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_ctrl.svg"
		4194327: svg_var = "" # meta
		4194328: svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_alt.svg"
		4194329: svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_capslock.svg"
		4194330: svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_numlock.svg"
		4194331: svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_scroll_lock.svg"
		4194332: svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_f1.svg"
		4194333: svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_f2.svg"
		4194334: svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_f3.svg"
		4194335: svg_var ="res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_f4.svg"
		4194336: svg_var ="res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_f5.svg"
		4194337: svg_var ="res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_f6.svg"
		4194338: svg_var ="res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_f7.svg"
		4194339: svg_var ="res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_f8.svg"
		4194340: svg_var ="res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_f9.svg"
		4194341: svg_var ="res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_f10.svg"
		4194342: svg_var ="res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_f11.svg"
		4194343: svg_var ="res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_f12.svg"
		#4194344: svg_var = # f13 to f35
		#4194345: svg_var =
		#4194346: svg_var =
		#4194347: svg_var =
		#4194348: svg_var =
		#4194349: svg_var =
		#4194350: svg_var =
		#4194351: svg_var =
		#4194352: svg_var =
		#4194353: svg_var =
		#4194354: svg_var =
		#4194355: svg_var =
		#4194356: svg_var = # f25 to last f35 support on macOs lix due to a windows limit
		#4194357: svg_var =
		#4194358: svg_var =
		#4194359: svg_var =
		#4194360: svg_var =
		#4194361: svg_var =
		#4194362: svg_var =
		#4194363: svg_var =
		#4194364: svg_var =
		#4194365: svg_var =
		#4194366: svg_var =
		4194367: svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_asterisk.svg" # multiply but same as asterik
		4194368: svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_slash_forward.svg" # divide but same as slash forward
		4194369: svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_minus.svg"
		4194370: svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_period.svg"
		4194371: svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_plus.svg"
		4194372: svg_var ="res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_0.svg"
		4194373: svg_var ="res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_1.svg"
		4194374: svg_var ="res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_2.svg"
		4194375: svg_var ="res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_3.svg"
		4194376: svg_var ="res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_4.svg"
		4194377: svg_var ="res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_5.svg"
		4194378: svg_var ="res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_6.svg"
		4194379: svg_var ="res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_7.svg"
		4194380: svg_var ="res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_8.svg"
		4194381: svg_var ="res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/keyboard_9.svg"
		#4194382: svg_var =# menu
		#4194383: svg_var = #Hyper
		#4194384: svg_var = # back
		#4194385: svg_var =# forward
		#4194386: svg_var = #stop
		#4194387: svg_var = # refresh
		#4194388: svg_var = #volumedown
		#4194389: svg_var = # volumeMute
		#4194390: svg_var = # volumeMup
		#4194391: svg_var = #mediaplay
		#4194392: svg_var =  #mediastop
		#4194393: svg_var = # mediaprevious
		#4194394: svg_var = # mediarecord
		#4194395: svg_var = #homepage
		#4194396: svg_var = #favorite
		#4194397: svg_var = #search
		#4194398: svg_var = #standby
		#4194399: svg_var = #LAuch0
		#4194400: svg_var =
		#4194401: svg_var =
		#4194402: svg_var =
		#4194403: svg_var =
		#4194404: svg_var =
		#4194405: svg_var =
		#4194406: svg_var =
		#4194407: svg_var =
		#4194408: svg_var =
		#4194409: svg_var = #lauch 9
		#4194410: svg_var = #LAuch A
		#4194411: svg_var =
		#4194412: svg_var =
		#4194413: svg_var =
		#4194414: svg_var =
		#4194415: svg_var = # Lauch F
		#4194416: svg_var =  # globe
		#4194417: svg_var = # keyboard
		#4194418: svg_var = # Jis_eisu
		#4194419: svg_var = # jis_kana
		8388607 : svg_var = PATHKEYBOARD+"" #key unkown
		_: return "no"
	return svg_var

# https://docs.godotengine.org/en/stable/classes/class_%40globalscope.html#enum-globalscope-mousebutton
func mouse_bouton_enum_to_svg(number : int) -> String:
	var svg_var: String
	match name:
		#0: svg_var = # none
		1: svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/mouse_left.svg"
		2: svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/mouse_right.svg"
		3: svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/mouse_scroll.svg"
		4: svg_var ="res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/mouse_scroll_up.svg"
		5: svg_var ="res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/mouse_scroll_down.svg"
		#6: svg_var = # scroll button left
		#7: svg_var = #scroll button right
		8: svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/mouse_side_forward.svg"
		9: svg_var = "res://addons/HandheldPortraitGodotReady/Assets/Pics/kenneyInputPrompts1.5/Keyboard & Mouse/Vector/mouse_side_back.svg"
		#10: svg_var = # none
		#11: svg_var =
		#12: svg_var =
		#13: svg_var =
		#14: svg_var =
		#15: svg_var =
		#16: svg_var =
		#17: svg_var =
		#18: svg_var =
		#19: svg_var =
		#20: svg_var =
		_: svg_var = "no"
	return svg_var
