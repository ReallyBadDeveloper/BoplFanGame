extends CharacterBody2D


@export var speed = 300.0
@export var jump_height = -400.0
@export var terminal_velocity = 10000.0
@export var coyote_time = 10
@export var friction = 30
var coyote_timer = coyote_time
@export var gravity_dir = 0

func _physics_process(delta: float) -> void:
	if (velocity.y > terminal_velocity):
		velocity.y = terminal_velocity
	if not is_on_floor():
		coyote_timer = coyote_timer - 1
		velocity += (get_gravity() * delta).rotated(deg_to_rad(gravity_dir))
		$Icon.rotation = gravity_dir
	else:
		coyote_timer = coyote_time

	if Input.is_action_pressed("Jump") and coyote_timer > 0:
		coyote_timer = 0
		velocity.y = jump_height

	var direction := Input.get_axis("MoveLeft", "MoveRight")
	if direction:
		if direction < 0:
			$Icon.flip_h = true
		else:
			$Icon.flip_h = false
		velocity.x = direction * speed
	else: 		velocity.x = move_toward(velocity.x, 0, friction)

	move_and_slide()
