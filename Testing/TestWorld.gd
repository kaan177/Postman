extends Node2D

signal WaterMovement()

onready var Player = get_node("Player")
onready var Pause_menu = $PauseMenu

func _ready():
	#connect signal met de speler node
	Player.connect("letter_request", self, "Spawn_letter")
	if GlobalScript.From_level != null:
		Player.set_position(get_node(GlobalScript.From_level + "pos").position)

#Spawnt de letter
func Spawn_letter(Lettervector):
	if not $Letter in get_children():
		var Letter = preload("res://Player/Letter.tscn").instance()
		Letter.set_position(Player.position)
		Letter.Direction = Lettervector
		self.add_child(Letter)


func _on_WaterTimer_timeout():
	emit_signal("WaterMovement")
