extends KinematicBody2D

const GRAVITY = Vector2(0, 0.2)

var Vector = Vector2.ZERO
var Rng = RandomNumberGenerator.new()

onready var world = get_parent()
onready var down = $Down
onready var right = $Right
onready var left = $Left
onready var up = $Up


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
	var Cheking_dir = [left, up, right, down]
	var Calculations = fmod(dir + 180 + 45, 360)/90
	
	
	var ChanceOfAdjusment = int(Calculations) - Calculations
	var Adjustment = 0
	
	
	if down.is_colliding():
		if ChanceOfAdjusment + 0.5 <= 0:
			Adjustment = -1
		if ChanceOfAdjusment + 0.5 >= 0:
			Adjustment = 1
	
	elif abs((ChanceOfAdjusment + 0.5)) * 100 >= Rng.randf_range(0, 100):
		if ChanceOfAdjusment + 0.5 <= 0:
			Adjustment = -1
		if ChanceOfAdjusment + 0.5 >= 0:
			Adjustment = 1
	
	var index = (int(Calculations) - Adjustment) % 4
	var Usebal_dir = Directions[index]
	var Usebal_checking_dir = Cheking_dir[index]
	
	position += Usebal_dir * int(not Usebal_checking_dir.is_colliding()) * 2
	
	
	if position == Vector2(4, 71):
		print(Usebal_dir)











