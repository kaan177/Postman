extends StaticBody2D

onready var sprite = $Sprite
onready var collisionshape = $CollisionShape2D
onready var timer = $Timer



func Appear():
	sprite.visible = true
	collisionshape.disabled = false

func Disappear():
	sprite.visible = false
	collisionshape.disabled = true


func _on_Timer_timeout():
	Disappear()
