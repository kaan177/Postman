extends RigidBody2D

var Bodies = 0

func _integrate_forces(Physics2DDirectBodyState):
	apply_central_impulse(Vector2(0, -20 * Bodies))

func _on_Area2D_body_entered(body):
	Bodies += 1
	if Bodies == 1:
		apply_central_impulse(Vector2(0, -30 * linear_velocity.length()))


func _on_Area2D_body_exited(body):
	Bodies -= 1
	if Bodies < 1:
		apply_central_impulse(Vector2(0, 30 * linear_velocity.length()))
		
