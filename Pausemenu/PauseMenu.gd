extends Control
#Gettingacces to all the needed nodes
onready var Music_volume_slider = $MarginContainer2/Buttens/MusicVolume/HBoxContainer/MVslider
onready var SFX_volume_slider = $MarginContainer2/Buttens/SFXVolume/HBoxContainer/SFXVslider
onready var Controls_butten = $MarginContainer2/Buttens/Controls/Controls_btn
onready var Fullscreen_checkbox = $MarginContainer2/Buttens/Fullscreen/HBoxContainer/FScheckbox

func _ready():
	pass
	


#Making the settings tab open and close
func _input(event):
	if Input.is_action_just_pressed("open_settings"):
		print("3")
		if not self.visible:
			print("1")
			self.show()
			get_tree().paused = true
		else:
			self.hide()
			get_tree().paused = false
			print("2")


func Close_settings():
	self.hide()
	get_tree().paused = false

func _on_MVslider_value_changed(value):
	Global_settings.Set_music_vollume(value)


func _on_SFXVslider_value_changed(value):
	Global_settings.Set_SFX_vollume(value)


func _on_Controls_btn_toggled(button_pressed):
	Open_controls_scene()


func _on_FScheckbox_toggled(button_pressed):
	Global_settings.Toggle_fullscreen(button_pressed)


func Open_controls_scene():
	pass
