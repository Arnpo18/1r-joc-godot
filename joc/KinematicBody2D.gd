extends KinematicBody2D
var moviment = Vector2()
const gravetat = 50
const velocitat = 400
var esquerra = load('imatges/a/player_14.png')
var dreta = load('imatges/a/player_11.png')
func _physics_process(_delta):
	
	moviment.y += gravetat
	
	if Input.is_action_pressed("ui_right"):
		moviment.x = velocitat
		$Sprite.texture=dreta
	elif Input.is_action_pressed("ui_left"):
		moviment.x = -velocitat
		$Sprite.texture=esquerra
	else:
		moviment.x=0
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			moviment.y = -1000
			
	moviment=move_and_slide(moviment, Vector2.UP)

		


	

