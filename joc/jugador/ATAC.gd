extends Area2D
export var vel = 623
var mov = Vector2()
var direccio = 1
func _ready():
	pass
func direccio_atac(dir):
	direccio = dir
	if dir  == 1:
		$AnimatedSprite.flip_h=true
	 
func _process(delta):
	mov.x = vel * delta * direccio
	mov.y=0
	translate(mov)


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	

# Replace with function body.


func _on_atac_body_entered(body):
	if body.has_method('mort'):
		body.hp -= 50
	
		if body.hp <= 0:
			body.mort()
			print("si")
	queue_free()
