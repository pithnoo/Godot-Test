extends KinematicBody2D

var velocity = Vector2.ZERO
var knockback = Vector2.ZERO

export var resistance = 200
export var acceleration = 300
export var maxSpeed = 50
export var friction = 200

onready var stats = $Stats
onready var playerDetectionZone = $PlayerDetectionZone

onready var sprite = $AnimatedSprite

const EnemyDeathEffect = preload("res://Effects/EnemyDeathEffect.tscn")

enum{
	IDLE,
	WANDER,
	CHASE
}

var state = IDLE

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, resistance * delta)
	knockback = move_and_slide(knockback)
	
	match state:
		IDLE:
			velocity = velocity.move_toward(Vector2.ZERO, resistance * delta)
			seek_player()
		WANDER:
			pass
		CHASE:
			var player = playerDetectionZone.player
			if player != null:
				var direction = (player.global_position - global_position).normalized()
				velocity = velocity.move_toward(direction * maxSpeed, acceleration * delta)
				sprite.flip_h = velocity.x < 0
			else:
				state = IDLE
	
	velocity = move_and_slide(velocity)
			

func seek_player():
	if playerDetectionZone.can_see_player():
		state = CHASE	

func _on_HurtBox_area_entered(area):
	stats.health -= area.damage
	print(stats.health)
	knockback = area.knockback_vector * 120 
	
func _on_Stats_no_health():
	var enemyDeathEffect = EnemyDeathEffect.instance()
	get_parent().add_child(enemyDeathEffect)
	enemyDeathEffect.global_position = global_position
	queue_free()
