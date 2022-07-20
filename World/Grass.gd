extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


const GrassEffect = preload("res://Effects/GrassEffect.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func generate_grass():
	var grassEffect = GrassEffect.instance()
		
	#var world = get_tree().current_scene
	#world.add_child(grassEffect)
	get_parent().add_child(grassEffect)
	grassEffect.global_position = global_position
		
func _on_HurtBox_area_entered(_area):
	generate_grass()
	queue_free()
	
