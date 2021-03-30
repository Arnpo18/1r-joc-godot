extends KinematicBody2D
var moviment = Vector2(0,0)
const gravetat = 50
const velocitat = 260
const ATAC=preload("res://jugador/ATAC.tscn")
var pot_disparar = true
var cooldown=1
var timer
var mort = false
export var hp = 11000
export var claus=0
func _ready():
	timer=Timer.new()
	add_child(timer)
	timer.set_one_shot(true)
	timer.set_wait_time(cooldown)
	timer.connect('timeout',self,'cooldown0')
func _physics_process(_delta):
	$TextureProgress.value=hp
	if mort == false:
		moviment.x=0
		moviment.y += gravetat
		if Input.is_action_pressed("endavant"):
			moviment.x = velocitat
			$AnimatedSprite.flip_h = false
			$AnimatedSprite.play('caminar')
			if sign($Position2D.position.x) == -1:
				$Position2D.position.x *= -1
		elif Input.is_action_pressed("endarrere"):
			moviment.x = -velocitat
			$AnimatedSprite.flip_h = true
			$AnimatedSprite.play('caminar')
			if sign($Position2D.position.x) == 1:
				$Position2D.position.x *= -1
		else:
			$AnimatedSprite.play('quiet')
		if is_on_floor():
			if Input.is_action_just_pressed("salta"):
				moviment.y = -750
		if moviment.y > 0 and is_on_floor()==false:
			$AnimatedSprite.play('cau')
		if moviment.y < 0 and is_on_floor()==false:
			$AnimatedSprite.play('salt')
			
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
		if claus ==1:
			$clau.visible=true
		if claus==2:
			$clau2.visible=true
		if claus==3:
			$clau3.visible=true
		if mort==true:
			$timer_mort.start()
func cooldown0():
	pot_disparar=true
func mortj():
	mort = true
	moviment.x=0
	moviment.y+=gravetat
	$AnimatedSprite.play('mort')
	$timer_mort.start()
var i=0
func oof():
	while i <= 5:
		$Timer.start()
func _on_Timer_timeout():
	position.x+=10 # Replace with function body.

func _on_Area_claus_area_entered(area):
	claus+=1
	area.queue_free() # Replace with function body.

func _on_area_porta_area_entered(area):
	get_tree().change_scene("res://boss_final_escena.tscn")

func _on_timer_mort_timeout():
	get_tree().change_scene("res://Pantalla d'inici.tscn") # Replace with function body.
	queue_free()
