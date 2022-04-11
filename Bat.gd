extends KinematicBody2D


var knockback = Vector2.ZERO
var resistance = 200

onready var stats = $Stats

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, resistance * delta)
	knockback = move_and_slide(knockback)

func _on_HurtBox_area_entered(area):
	stats.health -= area.damage
	print(stats.health)
	knockback = area.knockback_vector * 120 
	
func _on_Stats_no_health():
	queue_free()
