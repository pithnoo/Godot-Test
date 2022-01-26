extends KinematicBody2D

##const acceleration = 10
const maxSpeed = 100
##const friction = 50

var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		##velocity = velocity.move_toward(input_vector * maxSpeed, acceleration * delta)
		velocity = input_vector * maxSpeed
	else:
		##velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
		velocity = Vector2.ZERO
	
	move_and_collide(velocity * delta)
	
	
	
