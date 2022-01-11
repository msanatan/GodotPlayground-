extends KinematicBody2D

export var ACCELERATION = 512
export var MAX_SPEED = 64
export var FRICTION = 0.25
export var GRAVITY = 200
export var JUMP_FORCE = 128

var motion = Vector2.ZERO

func _physics_process(delta):
    var x_input = Input.get_action_strength('ui_right') - Input.get_action_strength('ui_left')

    if x_input != 0:
        motion.x += x_input * ACCELERATION * delta
        motion.x = clamp(motion.x, -MAX_SPEED, MAX_SPEED)
    else:
        motion.x = lerp(motion.x, 0, FRICTION)

    motion.y += GRAVITY * delta

    if is_on_floor():
        pass

    motion = move_and_slide(motion)