extends KinematicBody2D
var moviment = Vector2()
const gravetat = 50
const velocitat = 425

func _physics_process(_delta):
	moviment.x=0
	moviment.y += gravetat
	
	if Input.is_action_pressed("ui_right"):
		moviment.x = velocitat
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play('caminar')
	
	elif Input.is_action_pressed("ui_left"):
		moviment.x = -velocitat
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play('caminar')
	else:
		$AnimatedSprite.play('quiet')
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			moviment.y = -1000
			
	moviment=move_and_slide(moviment, Vector2.UP)

		


	

