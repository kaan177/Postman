extends Sprite

signal ButtonPressed()

export var Conected_node :NodePath

func _ready():
	yield(get_tree(),"idle_frame")
	connect("ButtonPressed", get_node(Conected_node), "act")

func act():
	visible = not visible
	emit_signal("ButtonPressed")
