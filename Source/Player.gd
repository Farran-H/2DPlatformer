extends KinematicBody2D

var velocity = Vector2(0, 0)
const speed = 300
const gravity = 30
const jumpSpeed = -1000

func _physics_process(delta):
		if Input.is_action_pressed("right"):
			velocity.x = speed
			$Sprite.play("walk")
		else:
			$Sprite.play("idle")
		if not is_on_floor():
			$Sprite.play("jumping")
		velocity.y = velocity.y + gravity
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = jumpSpeed

			
		velocity = move_and_slide(velocity,Vector2.UP)
		velocity.x = lerp(velocity.x,0,0.1)


func _on_fallZone_body_entered(body):
	get_tree().change_scene("res://Level1.tscn")


func _on_winZone_body_entered(body):
	get_tree().change_scene("res://Win.tscn")
