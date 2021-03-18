extends KinematicBody2D
var timer
var cooldown_i = 1
const velocitat = 100
var mov = Vector2()
const gravetat=50
var moviment = Vector2()
var direccio=1
var mort = false
var hp = 100
func _ready():
	pass
func mort():
	mort=true
	moviment=Vector2(0,0)
	$AnimatedSprite.play('mort')
	$CollisionShape2D.disabled==true
	$Timer.start()
func _physics_process(delta):
	if mort==false:
		moviment.x=velocitat*direccio
		$AnimatedSprite.play('caminar')
		moviment.y+=gravetat 
		moviment=move_and_slide(moviment,Vector2.UP)
		if direccio == 1:
			$AnimatedSprite.flip_h=false
		else:
			$AnimatedSprite.flip_h=true
		if is_on_wall():
			direccio=direccio*-1
			$RayCast2D.position.x *= -1
		if $RayCast2D.is_colliding()==false:
			direccio*=-1
			$RayCast2D.position.x *= -1
		



		
	


func _on_Timer_timeout():
	queue_free() # Replace with function body.
