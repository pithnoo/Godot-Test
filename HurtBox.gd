extends Area2D

var HitEffect = preload("res://Effects/HitEffect.tscn")

export(bool) var show_hit = true

func _ready():
	pass # Replace with function body.

func _on_HurtBox_area_entered(_area:Area2D):
	if show_hit:
		var effect = HitEffect.instance()
		var main = get_tree().current_scene
		main.add_child(effect)			
		effect.position = global_position
	pass # Replace with function body.
