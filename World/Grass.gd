extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"



# Called every frame. 'delta' is the elapsed time since the previous frame.
func generate_grass():
	var GrassEffect = load("res://World/GrassEffect.tscn")
	var grassEffect = GrassEffect.instance()
		
	var world = get_tree().current_scene
	world.add_child(grassEffect)
		
	grassEffect.global_position = global_position
		


func _on_HurtBox_area_entered(area):
	generate_grass()
	queue_free()
	
