extends Control




func _on_PlayButten_pressed():
	get_tree().change_scene("res://Levels/Level B.tscn")


func _on_ExitButten_pressed():
	get_tree().quit()
