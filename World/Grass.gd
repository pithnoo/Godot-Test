extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("attack"):
		var GrassEffect = load("res://World/GrassEffect.tscn")
		var grassEffect = GrassEffect.instance()
		
		var world = get_tree().current_scene
		world.add_child(grassEffect)
		
		grassEffect.global_position = global_position
		
		queue_free()
