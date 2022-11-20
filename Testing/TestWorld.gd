extends Node2D

signal WaterMovement()

onready var Player = get_node("Player")
onready var Pause_menu = $PauseMenu
onready var pipe_end = $PipeEnd
onready var node_2d = $Node2D


func _ready():
	#connect signal met de speler node
	Player.connect("letter_request", self, "Spawn_letter")
	pipe_end.connect("SpawnWater", self, "Spawn_water")
	
	if GlobalScript.From_level != null:
		Player.set_position(get_node(GlobalScript.From_level + "pos").position)

#Spawnt de letter
func Spawn_letter(Lettervector):
	if not $Letter in get_children():
		var Letter = preload("res://Player/Letter.tscn").instance()
		Letter.set_position(Player.position)
		Letter.Direction = Lettervector
		self.add_child(Letter)

func Spawn_water(direction, Position):
	node_2d.make_water(direction,Position)

func _on_WaterTimer_timeout():
	print("new water")
	emit_signal("WaterMovement")
