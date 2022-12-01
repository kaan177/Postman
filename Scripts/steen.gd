extends RigidBody2D

var Bodies_down = 0
var Bodies_up = 0

func _integrate_forces(Physics2DDirectBodyState):
	apply_central_impulse(Vector2(0, -15 * Bodies_down))
	
	apply_central_impulse(Vector2(0, -15 * Bodies_up))




func _on_Down_body_entered(body):
	Bodies_down += 1
	if Bodies_down == 1:
		apply_central_impulse(Vector2(0, -5 * linear_velocity.length()))


func _on_Down_body_exited(body):
	Bodies_down -= 1
	if Bodies_down < 1:
		apply_central_impulse(Vector2(0, 5 * linear_velocity.length()))
		


func _on_Up_body_entered(body):
	Bodies_up += 1
	if Bodies_up == 1:
		apply_central_impulse(Vector2(0, -5 * linear_velocity.length()))


func _on_Up_body_exited(body):
	Bodies_up -= 1
	if Bodies_up < 1:
		apply_central_impulse(Vector2(0, 5 * linear_velocity.length()))
