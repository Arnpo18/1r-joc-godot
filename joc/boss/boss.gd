extends KinematicBody2D
var timer
var velocitat = 200
const gravetat=50
var moviment = Vector2()
var direccio=1
var mort = false
var hp = 500
var atac = false
var mal=40
var objectiu
var colera=false
func mort():
	mort=true
	moviment=Vector2(0,0)
	$AnimatedSprite.play('mort')
	$Timer.start()
func atacar():
	$AnimatedSprite.play('atac')
	objectiu.hp-=mal
	if objectiu.hp <1:
		objectiu.mortj()
func moure():
	moviment.x=velocitat*direccio
	$AnimatedSprite.play('caminar')
	moviment.y+=gravetat 
	moviment=move_and_slide(moviment,Vector2.UP)
	if direccio == 1:
			$AnimatedSprite.flip_h=false
			$Area2D2/esquerra.set_deferred('disabled', true)
			$Area2D/dreta.set_deferred('disabled', false)
			$comp_dreta/CollisionPolygon2D.set_deferred('disabled',false)
			$comp_esquerra/CollisionPolygon2D.set_deferred('disabled',true)
	else:
		$AnimatedSprite.flip_h=true
		$Area2D2/esquerra.set_deferred('disabled', false)
		$Area2D/dreta.set_deferred('disabled', true)
		$comp_dreta/CollisionPolygon2D.set_deferred('disabled',true)
		$comp_esquerra/CollisionPolygon2D.set_deferred('disabled',false)
	if is_on_wall():
		direccio=direccio*-1
		$RayCast2D.position.x *= -1
		
	if $RayCast2D.is_colliding()==false:
		direccio*=-1
		$RayCast2D.position.x *= -1
		$Area2D.position.x*=-1
func _physics_process(delta):
	if mort==false:
		if atac==true:
			atacar()
			$Timer3.start()
		if atac==false:
			moure()
		
		moviment.y+=gravetat 	
	$TextureProgress.value=hp
func _on_Timer_timeout():#per mort
	queue_free() # Replace with function body.
func _on_Area2D_body_entered(body):
	if mort ==false:
		if body.has_method('mortj'):
			atac=true
			objectiu=body
		colera=false
func _on_Area2D_body_exited(body):
	atac=false 
func _on_Area2D2_body_entered(body):
	if mort ==false:
		if body.has_method('mortj'):
			atac=true
			objectiu=body 
		colera=false
func _on_Area2D2_body_exited(body):
	atac=false # Replace with function body.
func _on_comp_dreta_area_entered(area):
	 direccio=direccio*-1
	 $RayCast2D.position.x *= -1# Replace with function body.
	 colera=true
func _on_comp_esquerra_area_entered(area):
	direccio=direccio*-1
	$RayCast2D.position.x *= -1 # Replace with function body.
	colera=true

	colera=false # Replace with function body.
