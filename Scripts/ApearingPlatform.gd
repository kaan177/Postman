extends StaticBody2D

onready var sprite = $Sprite
onready var collisionshape = $CollisionShape2D
onready var timer = $Timer

export var Time = 1

var TimerIsPlaying = false

func act():
	Appear()

func Appear():
	sprite.visible = true
	collisionshape.set_deferred("disabled", false)
	timer.start(Time)
	TimerIsPlaying = true

func Disappear():
	sprite.visible = false
	collisionshape.set_deferred("disabled", true)


func _on_Timer_timeout():
	Disappear()
	TimerIsPlaying = false
