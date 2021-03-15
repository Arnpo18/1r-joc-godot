extends Area2D
export var vel = 500
var mov = Vector2()
var direccio = 1
func _ready():
	pass
func direccio_atac(dir):
	direccio = dir
	if dir  == -1:
		$Sprite.flip_h=true
	 
func _process(delta):
	mov.x = vel * delta * direccio
	mov.y=0
	translate(mov)
	rotation_degrees += 3

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
