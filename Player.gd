extends KinematicBody2D

#signals
signal letter_request(Letterdirection)

#constants
const UP = Vector2(0, -1)

#Player stats
export var Max_speed = 100
export var Accelaration = 10
export var Friction = 0.2
var Jump_height = 100
var Jump_time_to_peak = .5
var Jump_time_to_descent = .4
var Gewicht = 25

#Remaining variables
var Motion = Vector2.ZERO
var Lettervector = Vector2.RIGHT
var RopeCount = 0

#Loading variables in
onready var animation_player = $AnimationPlayer
onready var sprite = $Sprite
onready var Jump_velocity = ((2 * Jump_height) / Jump_time_to_peak) * -1
onready var Jump_gravity = ((-2 * Jump_height) / (Jump_time_to_peak * Jump_time_to_peak)) * -1
onready var fall_gravity = ((-2 * Jump_height) / (Jump_time_to_descent * Jump_time_to_descent)) * -1

func _physics_process(delta):
	#Handeling movement
	if not Input.is_action_pressed("stand_still"):
		Move(delta)
	
	if Input.is_action_just_pressed("letter_right") or Input.is_action_just_pressed("letter_left") or Input.is_action_just_pressed("letter_up") or Input.is_action_just_pressed("letter_down"):
		LetterThrow()
	
	



func Move(delta):
	var frictiondetection = false
	if bool(RopeCount):
		Motion = Vector2.ZERO
		animation_player.play("Climb")
		if Input.is_action_pressed("right"):
			Motion.x = Max_speed/3
			sprite.flip_h = false
		
		elif Input.is_action_pressed("left"):
			Motion.x = -Max_speed/3
			sprite.flip_h = true
		
		elif Input.is_action_pressed("up"):
			Motion.y = -Max_speed/3
		
		elif Input.is_action_pressed("down"):
			Motion.y = Max_speed/3
	else:
		if Motion.y > 0:
			Motion.y += Jump_gravity * delta
		else:
			Motion.y += fall_gravity * delta
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
			
			if Input.is_action_just_released("up"):
				if Motion.y < -Jump_height/2:
					get_node("Tween").interpolate_property(self,'Motion:y',Motion.y, -Jump_height/2, 0.15,Tween.TRANS_SINE,Tween.EASE_OUT)
					get_node("Tween").start()
			
		if is_on_floor():
			if Input.is_action_just_pressed("up"):
				Motion.y = Jump_velocity
				animation_player.play("Jump")
				
			if frictiondetection == true:
				Motion.x = lerp(Motion.x, 0, Friction)
		else:
			if Motion.y <= 0:
				animation_player.play("Fall")
			if frictiondetection:
				Motion.x = lerp(Motion.x, 0, Friction/4)
	Motion = move_and_slide(Motion, UP, false, 4, PI/4, false)
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider.is_class("RigidBody2D") and not collision.collider.name == "DrijvendPlatform":
			print(collision.collider.name)
			collision.collider.apply_central_impulse(-collision.normal * Gewicht)
#Getting the direction of the letter
func LetterThrow():
	#hier veranderen we de player input in een vector die de richting van de brief bepaalt
	var Placeholdervector = Vector2.ZERO
	
	if Input.is_action_just_pressed("letter_up"):
		Placeholdervector = Vector2.UP
		
	elif Input.is_action_just_pressed("letter_right"):
		Placeholdervector = Vector2.RIGHT
		
	elif Input.is_action_just_pressed("letter_left"):
		Placeholdervector = Vector2.LEFT
	
	if Placeholdervector != Vector2.ZERO:
		Lettervector = Placeholdervector
	#Signaling World node to spawn letter
	emit_signal("letter_request", Lettervector)






func _on_Area2D_body_entered(body):
	RopeCount += 1


func _on_Area2D_body_exited(body):
	RopeCount -= 1
	
