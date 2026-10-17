extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -300.0
const GRAVITY = 1200.0

enum STATE {IDLE, WALK, JUMP, FALL}
var current_state : STATE

@onready var player_sprite : Sprite2D = $Sprite2D
@onready var anim_player : AnimationPlayer = $AnimationPlayer

@export var dust : PackedScene

func _ready() -> void:
	_set_state(STATE.IDLE)

func _physics_process(delta: float) -> void:
	_update_state(delta)

func _set_state(new_state: STATE) -> void:
	if current_state == new_state:
		return
	
	_exit_state()
	current_state = new_state
	_enter_state()

func _enter_state() -> void:
	match current_state:
		STATE.IDLE: # Enter IDLE state logic
			anim_player.play("idle")
			
		STATE.WALK: # Enter WALK state logic
			anim_player.play("walk")
			
		STATE.JUMP: # Enter JUMP state logic
			velocity.y = JUMP_VELOCITY
			anim_player.play("jump")
			
		STATE.FALL: # Enter FALL state logic
			anim_player.play("fall")

func _update_state(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("move_left", "move_right")
	match current_state:
		STATE.IDLE: # Update IDLE state logic
			if direction: # If left or right is pressed, start walking
				_set_state(STATE.WALK)
			elif !is_on_floor(): # if not on floor, fall down
				_set_state(STATE.FALL)
			elif Input.is_action_just_pressed("action_right"):
				_set_state(STATE.JUMP) # if the jump button is pressed, then jump
			
		STATE.WALK: # Update WALK state logic
			velocity.x = direction * SPEED # Set the move direction
			if velocity.x > 0: # Set Sprite direction
				player_sprite.flip_h = true
			elif velocity.x < 0:
				player_sprite.flip_h = false
				
			if !is_on_floor(): # if not on floor, fall down
				_set_state(STATE.FALL)
			elif Input.is_action_just_pressed("action_right"):
				_set_state(STATE.JUMP) # if jump is pressed, jump
			elif velocity.x == 0: # if standing still, then set idle
				_set_state(STATE.IDLE)
				
			move_and_slide()
			
		STATE.JUMP: # Update JUMP state logic
			velocity.x = direction * SPEED # Set the move direction
			if velocity.x > 0: # Set Sprite direction
				player_sprite.flip_h = true
			elif velocity.x < 0:
				player_sprite.flip_h = false
				
			if !is_on_floor(): # if in the air, apply gravity
				velocity.y += GRAVITY * delta
				if velocity.y > 0: # after max height, change from JUMP to FALL
					_set_state(STATE.FALL)
				
			move_and_slide()
			
		STATE.FALL: # Update FALL state logic
			velocity.x = direction * SPEED # Set the move direction
			if velocity.x > 0: # Set Sprite direction
				player_sprite.flip_h = true
			elif velocity.x < 0:
				player_sprite.flip_h = false
				
			if is_on_floor(): # If the ground is reached, change back to idle
				_set_state(STATE.IDLE)
			else: # if still in the air, apply gravity
				velocity.y += GRAVITY * delta
				
			move_and_slide()

func _exit_state() -> void:
	match current_state:
		STATE.IDLE: # Exit IDLE state logic
			pass
			
		STATE.WALK: # Exit WALK state logic
			pass
			
		STATE.JUMP: # Exit JUMP state logic
			pass
			
		STATE.FALL: # Exit FALL state logic
			# Instantiate and set a new dust particle scene
			# every time the player ends the fall state:
			var new_dust : CPUParticles2D = dust.instantiate()
			get_parent().add_child(new_dust)
			new_dust.global_position = global_position + Vector2(0,12)
			new_dust.emitting = true
			await new_dust.finished
			new_dust.queue_free()
			pass
