extends Control
#Gettingacces to all the needed nodes
onready var Music_volume_slider = $MarginContainer2/Buttens/MusicVolume/HBoxContainer/MVslider
onready var SFX_volume_slider = $MarginContainer2/Buttens/SFXVolume/HBoxContainer/SFXVslider
onready var Controls_butten = $MarginContainer2/Buttens/Controls/Controls_btn
onready var Fullscreen_checkbox = $MarginContainer2/Buttens/Fullscreen/HBoxContainer/FScheckbox

func _ready():
	pass
	




func _on_MVslider_value_changed(value):
	pass # Replace with function body.


func _on_SFXVslider_value_changed(value):
	pass # Replace with function body.


func _on_Controls_btn_toggled(button_pressed):
	pass # Replace with function body.


func _on_FScheckbox_toggled(button_pressed):
	pass # Replace with function body.
