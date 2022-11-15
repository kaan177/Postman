extends StaticBody2D

onready var Direction = Vector2(cos(rotation), sin(rotation))
var SpitState = 0
onready var Level = get_parent()

signal SpawnWater(direction, Position)
# spit water 3 states

func _ready():
	Level.connect("WaterMovement", self, "Spitslow")
	


func Place_water():
	if SpitState == 1:
		Spitslow()
	
	elif SpitState == 2:
		Spitfar()

func Spitslow():
	emit_signal("SpawnWater", Direction, get_position() + Direction * 10)

func Spitfar():
	pass
