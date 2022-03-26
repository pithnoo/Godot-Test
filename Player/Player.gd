extends KinematicBody2D

##const acceleration = 10
const moveSpeed = 100
##const friction = 50

enum {
	MOVE,
	ROLL,
	ATTACK
}

var state = MOVE
var velocity = Vector2.ZERO

onready var animationPlayer = $AnimationPlayer
onready var animationTree =  $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

# Called when the node enters the scene tree for the first time.
func _ready():
	##animationTree.active = true
	pass # Replace with function body.

func _physics_process(delta):
	match state:
		MOVE:
			move_state(delta)
		ROLL:
			roll_state()
		ATTACK:
			attack_state()
	
func move_state(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		##velocity = velocity.move_toward(input_vector * maxSpeed, acceleration * delta)
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Move/blend_position", input_vector)
		animationTree.set("parameters/Attack/blend_position", input_vector)
		animationState.travel("Move")
		velocity = input_vector * moveSpeed
	else:
		##velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
		animationState.travel("Idle")
		velocity = Vector2.ZERO
		
	
	if Input.is_action_just_pressed("attack"):
		state = ATTACK
	
	move_and_collide(velocity * delta)

func attack_state():
	animationState.travel("Attack")
	pass

func attack_animation_finished():
	state = MOVE

func roll_state():
	pass
	
	
	
