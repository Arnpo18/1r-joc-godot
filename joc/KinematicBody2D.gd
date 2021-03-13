extends KinematicBody2D
var moviment = Vector2()
const gravetat = 50
const velocitat = 425
var dreta = load('imatges/a/player_11.png')
var d = load('imatges/a/player_23.png')
var esquerra = load('imatges/a/player_14.png')

func _physics_process(_delta):
	
	moviment.y += gravetat
	
	if Input.is_action_pressed("ui_right"):
		moviment.x = velocitat
		if moviment.x > 0:
			get_node("Sprite").hide()
			get_node("AnimatedSprite").show()
			$AnimatedSprite.play('dreta')
		else:
			get_node("Sprite").show()
			get_node("AnimatedSprite").hide()
			$Sprite.texture=load(dreta)
			
	elif Input.is_action_pressed("ui_left"):
		moviment.x = -velocitat
		if moviment.x<0:
			get_node("Sprite").hide()
			get_node("AnimatedSprite").show()
			$AnimatedSprite.play('esquerra')
		else:
			get_node("Sprite").show()
			get_node("AnimatedSprite").hide()
			$Sprite.texture=load(esquerra)	
	else:
		moviment.x=0
		get_node("Sprite").show()
		get_node("AnimatedSprite").hide()
		$Sprite.texture=d
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			moviment.y = -1000
			
	moviment=move_and_slide(moviment, Vector2.UP)

		


	

