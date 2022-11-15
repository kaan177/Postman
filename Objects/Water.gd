extends KinematicBody2D

const GRAVITY = Vector2(0, 0.2)
const UP = Vector2.UP

var Vector = Vector2.ZERO
var Rng = RandomNumberGenerator.new()
var Move = false

onready var world = get_parent()


#connenct signal
func _ready():
	world.connect("WaterMovement", self, "make_a_move")
	Rng.randomize()
	

func make_a_move():
	Move = true


#the movement code


func _physics_process(delta):
	if Move:
		Vector += GRAVITY
		Vector = Vector.normalized()
		var dir = rad2deg(Vector.angle())
		
		
		var Directions = [Vector2(-1, 0), Vector2(0, -1), Vector2(1, 0), Vector2(0, 1)]
		var Calculations = fmod(dir + 180 + 45, 360)/90
		
		
		var ChanceOfAdjusment = int(Calculations) - Calculations
		var Adjustment = 0
		
		
		if is_on_floor():
			if ChanceOfAdjusment + 0.5 <= 0:
				Adjustment = -1
			if ChanceOfAdjusment + 0.5 >= 0:
				Adjustment = 1
		
		elif abs((ChanceOfAdjusment + 0.5)) * 100 >= Rng.randf_range(0, 100):
			if ChanceOfAdjusment + 0.5 <= 0:
				Adjustment = -1
			if ChanceOfAdjusment + 0.5 >= 0:
				Adjustment = 1
		
		var Usebal_dir = Directions[(int(Calculations) - Adjustment) % 4]
		
		move_and_slide(Usebal_dir * 8 / delta, UP)
		Move = false







