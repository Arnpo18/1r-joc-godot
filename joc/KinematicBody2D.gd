extends KinematicBody2D
var velocitat := Vector2(0,0)
const g = 50
const moviment = 400
func _ready():
	pass 
func _process(delta):
	velocitat=Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		velocitat += Vector2.RIGHT
	if Input.is_action_pressed("ui_left"):
		velocitat += Vector2.LEFT
	if Input.is_action_pressed("ui_up"):
		position.y += 100* delta
	velocitat = velocitat.normalized() * moviment
	move_and_slide(velocitat, Vector2.UP)
	if is_on_floor():
		print('sóc a terra')
	if is_on_wall():
		print('sóc a una paret')
	if is_on_ceiling():
		print('sóc al sostre')

var v = Vector2(1,1)
func _physics_process(delta):
	v.y += delta * g
	var mov = v * delta
	move_and_collide(mov)
