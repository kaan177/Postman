extends Camera2D

onready var TopLeft = $Node/TopLeft
onready var BottemRight = $Node/BottemRight

func _ready():
	limit_top = TopLeft.position.y
	limit_left = TopLeft.position.x
	limit_bottom = BottemRight.position.y
	limit_right = BottemRight.position.x
