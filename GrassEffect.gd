extends AnimatedSprite


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("animation_finished", self, "_on_Animation_finished")
	frame = 0
	play("Animate")



func _on_Animation_finished():
	queue_free()
