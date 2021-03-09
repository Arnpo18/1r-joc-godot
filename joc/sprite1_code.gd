extends Sprite
var x=0
var mama = load("res://mamado.jpg")
var kirby = load("res://kirby.png")
func _process(delta):
	if Input.is_action_just_pressed("mama"):
		x += 1
		if x % 2 !=0:
			texture=mama
			
		else:
			texture=kirby
			
