extends Area2D

signal ButtonPressed()

export var Conected_node :NodePath

onready var sprite = $Sprite
onready var audiostreamplayer = $AudioStreamPlayer

var BodyAmount = 0

func _ready():
	yield(get_tree(),"idle_frame")
	connect("ButtonPressed", get_node(Conected_node), "act")

func _on_Buttons_body_entered(body):
	emit_signal("ButtonPressed")
	BodyAmount += 1
	if BodyAmount > 0:
		sprite.frame = 1
		audiostreamplayer.play()
		
	


func _on_Buttons_body_exited(body):
	BodyAmount -= 1
	if BodyAmount <= 0:
		sprite.frame = 0
	


