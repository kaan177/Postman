extends KinematicBody2D

const GRAVITY = Vector2(0, 0.2)

var Vector = Vector2.ZERO
var Rng = RandomNumberGenerator.new()

onready var world = get_parent()


#connenct signal
func _ready():
	world.connect("WaterMovement", self, "movement")
	Rng.randomize()

#the magic vector


#the movement code
func movement():
	Vector += GRAVITY
	Vector = Vector.normalized()
	
	var dir = rad2deg(Vector.angle())
	
	
	var Directions = [Vector2(-1, 0), Vector2(0, -1), Vector2(1, 0), Vector2(0, 1)]
	var Calculations = fmod(dir + 180 + 45, 360)/90
	
	
	var ChanceOfAdjusment = int(Calculations) - Calculations
	var Adjustment = 0
	
	if abs((ChanceOfAdjusment + 0.5)) * 100 >= Rng.randf_range(0, 100):
		if ChanceOfAdjusment + 0.5 <= 0:
			Adjustment = -1
		if ChanceOfAdjusment + 0.5 >= 0:
			Adjustment = 1
	
	var Usebal_dir = Directions[(int(Calculations) - Adjustment) % 4]
	move_and_collide(Usebal_dir * 8)








