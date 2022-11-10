extends KinematicBody2D

export var Death_timer = 5
export var Speed = 200
var Direction = Vector2.ZERO
onready var PapierWoosh_Audio  =  $PapierWoosh

func _ready():
	$Timer.start(Death_timer)

#Handelt de movement
func _physics_process(_delta):
	var Movement = Direction * Speed
	Movement = move_and_collide(Movement)

#handelt de death animatie
func Death():
	queue_free()

func _on_Timer_timeout():
	Death()


func _on_PapierWoosh_finished():
	PapierWoosh_Audio.play()
