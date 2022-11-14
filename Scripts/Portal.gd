extends Area2D

func _on_Portal_body_entered(body):
	GlobalScript.From_level = get_parent().name
	get_tree().change_scene("res://Levels/" + self.name + ".tscn")
	
	
