extends Node2D


onready var Player = get_node("Player")
onready var Pause_menu = $PauseMenu

func _ready():
	#connect signal met de speler node
	Player.connect("letter_request", self, "Spawn_letter")

#Spawnt de letter
func Spawn_letter(Lettervector):
	if not $Letter in get_children():
		var Letter = preload("res://Player/Letter.tscn").instance()
		Letter.set_position(Player.position)
		Letter.Direction = Lettervector
		self.add_child(Letter)




