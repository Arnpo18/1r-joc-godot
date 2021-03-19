extends KinematicBody2D
var moviment = Vector2(0,0)
const gravetat = 50
const velocitat = 260
const ATAC=preload("res://jugador/ATAC.tscn")
var pot_disparar = true
var cooldown=1
var timer
var mort = false
export var hp = 200
func _ready():
	timer=Timer.new()
	add_child(timer)
	timer.set_one_shot(true)
	timer.set_wait_time(cooldown)
	timer.connect('timeout',self,'cooldown0')
func _physics_process(_delta):
	if mort == false:
		moviment.x=0
		moviment.y += gravetat
		if Input.is_action_pressed("ui_right"):
			moviment.x = velocitat
			$AnimatedSprite.flip_h = false
			$AnimatedSprite.play('caminar')
			if sign($Position2D.position.x) == -1:
				$Position2D.position.x *= -1
		elif Input.is_action_pressed("ui_left"):
			moviment.x = -velocitat
			$AnimatedSprite.flip_h = true
			$AnimatedSprite.play('caminar')
			if sign($Position2D.position.x) == 1:
				$Position2D.position.x *= -1
		else:
			$AnimatedSprite.play('quiet')
		if is_on_floor():
			if Input.is_action_just_pressed("ui_up"):
				moviment.y = -750
		moviment=move_and_slide(moviment, Vector2.UP)
		if Input.is_action_just_pressed('atacar') && pot_disparar:
			var bola = ATAC.instance()
			if sign($Position2D.position.x)==1:
				bola.direccio_atac(1)
			else:
				bola.direccio_atac(-1)
			get_parent().add_child(bola)
			bola.global_position=$Position2D.global_position
			pot_disparar = false
			timer.start()
func cooldown0():
	pot_disparar=true
func mortj():
	mort = true
	moviment.x=0
	$AnimatedSprite.play('mort')
	


	

