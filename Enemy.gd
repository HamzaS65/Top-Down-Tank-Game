extends CharacterBody2D

var run_speed = 100
var player = null
var eHealth = 4

func _physics_process(delta):
	velocity = Vector2.ZERO
	if player:
		self.look_at(player.global_position)
		velocity = position.direction_to(player.position) * run_speed
	move_and_slide()

	if eHealth == 0:
		queue_free()

func _on_DetectRadius_body_entered(body):
	if body.is_in_group("player"):
		print("enter")
		player = body

func _on_DetectRadius_body_exited(body):
	if body.is_in_group("player"):
		print("exit")
		player = null

func hit():
	eHealth -= 1



