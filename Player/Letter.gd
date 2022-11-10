extends KinematicBody2D

var Death_timer = 0.4
var Speed = 400
var Direction = Vector2.ZERO
onready var Sprite = $Sprite
onready var PapierHit = $PapierHit
onready var CollisionShape2D = $CollisionShape2D

func _ready():
	$Timer.start(Death_timer)
	if Direction == Vector2(-1,0):
		Sprite.flip_h = true
		position += Vector2(-10,-6)
		CollisionShape2D.position += Vector2(4,0)
	elif Direction == Vector2(1,0):
		 position += Vector2(10,-6)
	elif Direction == Vector2(0,-1): 
		Sprite.rotation_degrees = 270
		position += Vector2(0,-12)
		

#Handelt de movement
func _physics_process(delta):
	var Movement = Direction * Speed
	Movement = move_and_slide(Movement)
	if is_on_wall():
		Sprite.frame = 1
		if not PapierHit.playing: 
			PapierHit.play()

#handelt de death animatie
func Death():
	queue_free()

func _on_Timer_timeout():
	Death()
	
