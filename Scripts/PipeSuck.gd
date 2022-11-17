extends StaticBody2D

onready var Direction = Vector2(cos(rotation), sin(rotation))
var SpitState = 1
onready var Level = get_owner()
onready var Area2d = $Area2D
var bodies = 0

signal SpawnWater(direction, Position)


func _ready():
	Level.connect("WaterMovement", self, "Place_water")
	


func Place_water():
	yield(get_tree(),"idle_frame")
	if bodies <= 0:
		if SpitState == 1:
			Spitslow()
	
		elif SpitState == 2:
			Spitfar()

func Spitslow():
	emit_signal("SpawnWater", Direction, get_position() + Direction * 4)

func Spitfar():
	pass


func _on_Area2D_body_entered(body):
	bodies += 1
	


func _on_Area2D_body_exited(body):
	bodies -= 1
