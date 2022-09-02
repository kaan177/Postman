extends KinematicBody2D

#signals
signal letter_request(Letterdirection)

#constants
const UP = Vector2(0, -1)

#Player stats
export var Max_speed = 100
export var Accelaration = 10
export var Jump_height = 350
export var Gravity = UP * 10
export var Friction = 0.2

#Remaining variables
var Motion = Vector2.ZERO
var Lettervector = Vector2.RIGHT

#Loading variables in
onready var animation_player = $AnimationPlayer
onready var sprite = $Sprite

func _physics_process(_delta):
	#Handeling movement
	if not Input.is_action_pressed("stand_still"):
		Move()
	
	Letterdirection()
	
	if Input.is_action_just_pressed("throw_letter"):
		Throwletter()


func Move():
	var frictiondetection = false
	Motion -= Gravity
	#Turning user input into movement
	if Input.is_action_pressed("right"):
		Motion.x = min(Motion.x + Accelaration, Max_speed)
		if is_on_floor():
			animation_player.play("Run")
		sprite.flip_h = false
	
	
	elif Input.is_action_pressed("left"):
		Motion.x = max(Motion.x - Accelaration, - Max_speed)
		if is_on_floor():
			animation_player.play("Run")
		sprite.flip_h = true
	
	else:
		frictiondetection = true
		if not Input.is_action_pressed("up") and is_on_floor():
			animation_player.play("Default")
	
	if is_on_floor():
		if Input.is_action_just_pressed("up"):
			Motion.y = -Jump_height
			animation_player.play("Jump")
			
		if frictiondetection == true:
			Motion.x = lerp(Motion.x, 0, Friction)
	else:
		if Motion.y <= 0:
			animation_player.play("Fall")
		if frictiondetection:
			Motion.x = lerp(Motion.x, 0, Friction/4)
	Motion = move_and_slide(Motion, UP)
#Getting the direction of the letter
func Letterdirection():
	#hier veranderen we de player input in een vector die de richting van de brief bepaalt
	var Placeholdervector = Vector2.ZERO
	
	Placeholdervector.x = int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))
	Placeholdervector.y = int(Input.is_action_pressed("down")) - int(Input.is_action_pressed("up"))
	Placeholdervector = Placeholdervector.normalized()
	
	if Placeholdervector != Vector2.ZERO:
		Lettervector = Placeholdervector
#Signaling World node to spawn letter
func Throwletter():
	emit_signal("letter_request", Lettervector)


