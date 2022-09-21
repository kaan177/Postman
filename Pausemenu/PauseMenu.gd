extends Control

func _ready():
	pass
	


#Making the settings tab open and close
func _input(event):
	if Input.is_action_just_pressed("open_settings"):
		if not self.visible:
			self.show()
			get_tree().paused = true
		else:
			self.hide()
			get_tree().paused = false



func _on_MVslider_value_changed(value):
	Global_settings.Set_music_vollume(value)


func _on_SFXVslider_value_changed(value):
	Global_settings.Set_SFX_vollume(value)


func _on_MaVslider_value_changed(value):
	Global_settings.Set_MaV_vollume(value)


func _on_Controls_btn_toggled(button_pressed):
	Open_controls_scene()


func _on_FScheckbox_toggled(button_pressed):
	Global_settings.Toggle_fullscreen(button_pressed)


func Open_controls_scene():
	pass



