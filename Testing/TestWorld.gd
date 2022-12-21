extends Node2D

signal WaterMovement()

onready var Player = get_node("Player")
onready var Pause_menu = $PauseMenu
onready var pipe_end = $PipeEnd


func _ready():
	#connect signal met de speler node
	Player.connect("letter_request", self, "Spawn_letter")
	BackgroundMusic.stream_paused = true
	
	for index in get_child_count():
		if get_child(index).is_in_group("pipe"):
			get_child(index).connect("SpawnWater", self, "Spawn_water")
			
		
	
	if GlobalScript.From_level != null:
		Player.set_position(get_node(GlobalScript.From_level + "pos").position)

func act():
	BackgroundMusic.stream_paused = not BackgroundMusic.stream_paused
	
func _process(delta):
	print("goosdfsdf")
	if Input.is_action_just_pressed("reset"):
		get_tree().change_scene(self.filename)


#Spawnt de letter
func Spawn_letter(Lettervector):
	if not $Letter in get_children():
		var Letter = preload("res://Player/Letter.tscn").instance()
		Letter.set_position(Player.position)
		Letter.Direction = Lettervector
		self.add_child(Letter)

func Spawn_water(direction, Position):
	var water = preload("res://Objects/Water.tscn").instance()
	water.set_position(Position)
	water.Vector = direction
	self.add_child(water)

func _on_WaterTimer_timeout():
	emit_signal("WaterMovement")
