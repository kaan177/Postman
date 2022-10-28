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
onready var MudRun_audio = $MudRun

func _physics_process(_delta):
	#Handeling movement
	if not Input.is_action_pressed("stand_still"):
		Move()
	
	if Input.is_action_just_pressed("letter_right") or Input.is_action_just_pressed("letter_left") or Input.is_action_just_pressed("letter_up") or Input.is_action_just_pressed("letter_down"):
		LetterThrow()
	
	
	
	


func Move():
	var frictiondetection = false
	Motion -= Gravity
	#Turning user input into movement
	if Input.is_action_pressed("right"):
		Motion.x = min(Motion.x + Accelaration, Max_speed)
		if is_on_floor():
			animation_player.play("Run")
			if not MudRun_audio.playing:
				MudRun_audio.play()
		sprite.flip_h = false
	

	elif Input.is_action_pressed("left"):
		Motion.x = max(Motion.x - Accelaration, - Max_speed)
		if is_on_floor():
			animation_player.play("Run")
			if not MudRun_audio.playing:
				MudRun_audio.play() 
		sprite.flip_h = true
		
	
	else:
		frictiondetection = true
		if not Input.is_action_pressed("up") and is_on_floor():
			animation_player.play("Default")
			MudRun_audio.stop()
						
	if Input.is_action_just_released("up"):
		if Motion.y < -100:
			get_node("Tween").interpolate_property(self,'Motion:y',Motion.y, -100, 0.15,Tween.TRANS_SINE,Tween.EASE_OUT)
			get_node("Tween").start()
			
	
	if is_on_floor():
		if Input.is_action_just_pressed("up"):
			Motion.y = -Jump_height
			animation_player.play("Jump")
			MudRun_audio.stop()
			
		if frictiondetection == true:
			Motion.x = lerp(Motion.x, 0, Friction)
	else:
		if Motion.y <= 0:
			animation_player.play("Fall")
		if frictiondetection:
			Motion.x = lerp(Motion.x, 0, Friction/4)
	Motion = move_and_slide(Motion, UP)
#Getting the direction of the letter
func LetterThrow():
	#hier veranderen we de player input in een vector die de richting van de brief bepaalt
	var Placeholdervector = Vector2.ZERO
	
	Placeholdervector.x = int(Input.is_action_pressed("letter_right")) - int(Input.is_action_pressed("letter_left"))
	Placeholdervector.y = int(Input.is_action_pressed("letter_down")) - int(Input.is_action_pressed("letter_up"))
	Placeholdervector = Placeholdervector.normalized()
	
	if Placeholdervector != Vector2.ZERO:
		Lettervector = Placeholdervector
	#Signaling World node to spawn letter
	emit_signal("letter_request", Lettervector)



