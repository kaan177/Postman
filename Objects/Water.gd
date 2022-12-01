extends KinematicBody2D

const GRAVITY = Vector2(0, 0.2)

var Vector = Vector2.ZERO
var Rng = RandomNumberGenerator.new()

onready var world = get_parent()
onready var ray_cast_2d = $RayCast2D


#connenct signal
func _ready():
	world.connect("WaterMovement", self, "make_a_move")
	Rng.randomize()
	make_a_move()
	

func make_a_move():
	Vector += GRAVITY
	Vector = Vector.normalized()
	var dir = rad2deg(Vector.angle())
	
	
	var Directions = [Vector2(-1, 0), Vector2(0, -1), Vector2(1, 0), Vector2(0, 1)]
	var Calculations = fmod(dir + 180 + 45, 360)/90
	
	
	var ChanceOfAdjusment = int(Calculations) - Calculations
	var Adjustment = 0
	
	
	if ray_cast_2d.is_colliding():
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
	
	
	
	move_and_collide(Usebal_dir * 2)
	
	
	
	position = Vector2(int(round(position.x)/2)*2, int(round(position.y)/2)*2)
	










